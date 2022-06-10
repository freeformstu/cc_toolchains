#!/usr/bin/env python3

import argparse
import hashlib
import json
import logging
import queue
import re
import shutil
import subprocess
import tempfile
import threading
import time
from pathlib import Path
from typing import Dict
from urllib import parse, request

# Threadding information
ERROR_OCCURED = False
QUEUE = queue.Queue()
CV = threading.Condition()
TIMEOUT = 600


class Semver(str):
    def __init__(self, value: str) -> None:
        split = value.strip().split(".")
        if len(split) != 3:
            raise ValueError("Unexpected semver value: {}".format(value))

        self.major: int = int(split[0])
        self.minor: int = int(split[1])
        self.patch: int = int(split[2])

    def __repr__(self) -> str:
        return "{}.{}.{}".format(self.major, self.minor, self.patch)

    def __lt__(self, other):
        return (self.major, self.minor, self.patch) < (
            other.major,
            other.minor,
            other.patch,
        )


LLVM_VERSIONS = sorted(
    [
        # The commented-out versions do not have github releases
        # Semver("6.0.0"),
        # Semver("6.0.1"),
        # Semver("7.0.0"),
        # Semver("8.0.0"),
        # Semver("9.0.0"),

        Semver("7.1.0"),
        Semver("8.0.1"),
        Semver("9.0.1"),
        Semver("10.0.0"),
        Semver("10.0.1"),
        Semver("11.0.0"),
        Semver("11.0.1"),
        Semver("11.1.0"),
        Semver("12.0.0"),
        Semver("12.0.1"),
        Semver("13.0.0"),
        Semver("13.0.1"),
        Semver("14.0.0"),
        Semver("14.0.1"),
        Semver("14.0.2"),
        Semver("14.0.3"),
        Semver("14.0.4"),
        Semver("14.0.5"),
        Semver("14.0.6"),
    ]
)

TEMPLATE = """\
# AUTO-GENERATED: DO NOT MODIFY
# This file was updated by running the following command from the root of the repository:
#
#       python3 ./llvm/private/update_llvm_versions.py

\"\"\"Artifact locations for LLVM versions\"\"\"

LLVM_VERSIONS = {}
"""

ARTIFACT_REGEX = r"^clang\+llvm.*\.tar\.xz$"

Artifact = Dict[str, str]
VersionArtifacts = Dict[str, Artifact]


def parse_args() -> argparse.Namespace:
    """Parse command line arguments

    Returns:
        argparse.Namespace: A struct of parsed arguments.
    """
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--verbose", action="store_true", help="Enable verbose logging."
    )
    parser.add_argument(
        "--numprocesses",
        "-n",
        dest="numprocesses",
        type=int,
        default=16,
        help="The number of threads to use for downloading artifacts",
    )

    return parser.parse_args()


def query_artifacts(version: Semver) -> VersionArtifacts:
    """Query for the download URLs of all llvm artifacts for a particular version

    Note: All sha256 info generated here will be empty

    Args:
        version: The version of LLVM to query artifacts for.

    Returns:
        A map of artifact names to url + sha256 info
    """
    url = parse.urlparse(
        "https://api.github.com/repos/llvm/llvm-project/releases/tags/llvmorg-{}".format(
            version
        )
    )
    logging.debug("Artifact url: {}".format(url.geturl()))

    content = None
    with request.urlopen(url=url.geturl()) as data:
        content = data.read()
    
    # Protect against rate limiting
    time.sleep(0.5)

    if not content:
        raise RuntimeError("Failed to download: {}".format(url))

    data = json.loads(content)

    prefix_len = len("clang+llvm-{}-".format(version))
    suffix_len = len(".tar.xz")

    return {
        asset["name"][prefix_len:-suffix_len]: {
            "url": parse.unquote(asset["browser_download_url"]),
            "sha256": None,
        }
        for asset in data["assets"]
        if re.match(ARTIFACT_REGEX, asset["name"])
    }


def run_buildifier(file: Path) -> None:
    buildifier = None
    for var in ["buildifier", "buildifier.exe"]:
        buildifier = shutil.which(var)
        break

    if not buildifier:
        raise FileNotFoundError("Failed to find a Buildifier binary")

    subprocess.run(
        [str(buildifier), "-lint=fix", "-mode=fix", "-warnings=all", str(file)],
        check=True,
    )


def sha256_file_path(artifact_path: Path) -> Path:
    """Compute the name a sha256 digest file from a given file.

    Args:
        artifact_path: File to compute the sha256 digest file path for.

    Returns:
        Path to the sha256 digest.
    """
    return Path(str(artifact_path) + ".sha256")


def worker_get_sha256(download_dir: Path, url: parse.ParseResult) -> None:
    """Download an artifact and write the sha256 value of it to a file matching `{url_path}.sha256`

    Args:
        download_dir: The directory in which to download and write the outputs.
        url: The URL to the download artifact.
    """
    url_str = url.geturl()
    logging.debug("Getting sha256 for: {}".format(url_str))
    dest = download_dir / parse.unquote(url.path.lstrip("/"))
    dest.parent.mkdir(parents=True, exist_ok=True)

    request.urlretrieve(url_str, filename=str(dest))
    if not dest.exists():
        raise FileNotFoundError("Failed to download {}".format(url_str))

    artifact_bytes = dest.read_bytes()
    sha256 = hashlib.sha256(artifact_bytes).hexdigest()
    digest = sha256_file_path(dest)
    digest.write_text(sha256, encoding="utf-8")


def worker_main() -> None:
    """Main method for the worker threads"""
    while not QUEUE.empty():
        temp_dir, url = QUEUE.get()
        worker_get_sha256(temp_dir, url)
        QUEUE.task_done()


def queue_join() -> bool:
    """join for the global QUEUE object with a timeout"""
    stop = time.time() + TIMEOUT
    while QUEUE.unfinished_tasks and time.time() < stop:
        time.sleep(2)
    return time.time() < stop


def main() -> None:
    """The script's main entrypoint"""

    args = parse_args()
    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

    output_bzl = Path(__file__).parent / "llvm_versions.bzl"

    version_assets = {version: query_artifacts(version) for version in LLVM_VERSIONS}

    with tempfile.TemporaryDirectory() as tmp_dir:
        logging.debug("temp directory: {}".format(tmp_dir))
        tmp_path = Path(tmp_dir)

        for assets in version_assets.values():
            for data in assets.values():
                QUEUE.put((tmp_path, parse.urlparse(data["url"])))

        threads = []
        for i in range(args.numprocesses):
            threads.append(
                threading.Thread(
                    name="worker-{}".format(i), target=worker_main, daemon=True
                )
            )

        for worker in threads:
            worker.start()

        for worker in threads:
            worker.join(timeout=TIMEOUT)

        if not queue_join():
            raise RuntimeError("Queue still has tasks in it")

        for version in version_assets:
            for asset in version_assets[version]:
                sha256_file = tmp_path / sha256_file_path(
                    Path(
                        parse.urlparse(
                            version_assets[version][asset]["url"]
                        ).path.lstrip("/")
                    )
                )
                version_assets[version][asset]["sha256"] = sha256_file.read_text(
                    encoding="utf-8"
                ).strip()

    output_bzl.write_text(TEMPLATE.format(json.dumps(version_assets, indent=4)))
    run_buildifier(output_bzl)

    logging.info("Done")


if __name__ == "__main__":
    main()
