#!/usr/bin/env python3.9

import argparse
import hashlib
import json
import logging
import os
import queue
import re
import shutil
import subprocess
import sys
import tempfile
import threading
import time
from pathlib import Path
from typing import Dict, List, Tuple
from urllib import parse, request
from urllib.error import HTTPError

from update_llvm.debian import query_debian_artifacts
from update_llvm.types import Semver, VersionArtifacts

# Threadding information
ERROR_OCCURED = False
QUEUE = queue.Queue()
CV = threading.Condition()
TIMEOUT = 600


# All known releases of llvm
LLVM_VERSIONS = sorted(
    [
        Semver("3.9.1"),
        Semver("4.0.0"),
        Semver("5.0.2"),
        Semver("6.0.0"),
        Semver("6.0.1"),
        Semver("7.0.0"),
        Semver("8.0.0"),
        Semver("9.0.0"),
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
        Semver("15.0.0"),
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

ARTIFACT_REGEX = r"^clang\+llvm.*\.(tar\.xz|zip)$"


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
        "--output",
        default=Path("llvm/private/llvm_versions.bzl"),
        type=Path,
        help="Path to the output file relative to the workspace root.",
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


def triple_abi_assumption(triple: str) -> str:
    """_summary_

    Args:
        triple (str): _description_

    Returns:
        str: _description_
    """

    # I don't believe any of the release artifacts use a musl abi
    # for linux.
    if "linux" in triple:
        return "{}-gnu".format(triple)

    return triple


def distro_split(distribution: str) -> str:
    """_summary_

    Args:
        distribution (str): _description_

    Raises:
        ValueError: _description_

    Returns:
        str: _description_
    """
    for i in range(1, len(distribution)):
        if distribution[-i].isalpha():
            dist = distribution[: -(i - 1)].strip("-")
            dist_version = distribution[len(dist) :].strip("-")
            return (dist, dist_version)

    raise ValueError("{} is not a valid distribution".format(distribution))


def triple_from_artifact(artifact: str) -> Tuple[str, str]:
    """Convert the llvm artifact name into a platform triple.

    Args:
        artifact (str): The name of an artifact without it's extension. E.g. `sparcv9-sun-solaris2.11`.

    Returns:
        A platform triple.
    """

    # https://discourse.llvm.org/t/release-artifact-naming-conventions/63872/4
    split = artifact.split("-", 2)

    # All artifacts consistently have CPU/Arch first.
    arch = split.pop(0)

    # The following artifacts commonly place vendor next
    vendor = ""
    if split[0] in ["apple", "unknown", "pc", "ibm", "sun"]:
        vendor = split.pop(0)

    system = ""
    if split[0].startswith(("freebsd", "linux", "darwin", "aix", "solaris")):
        system = split.pop(0)

    # In someo cases, we need to be aware of both arch and system to identify
    # the right vendor string.
    if not vendor:
        if system == "linux":
            vendor = "unknown"

    abi = ""
    if split and split[0].startswith(("gnu", "musl")):
        abi = split.pop(0)
        # If there are no more sections from the split, we ensure abi does not have
        # additional parts to it since the original split has a capped `maxsplit`
        if not split:
            split = abi.split("-", maxsplit=1)

            # If there were no additional sections to `abi` then this should result
            # in the exact same value.
            abi = split.pop(0)

    dist = None
    dist_version = None

    # Check that the system is sanitized and does not contian version info
    if system[-1].isnumeric():
        dist, dist_version = distro_split(system)
        system = dist

    # If the `system` tag didn't appear to have info about the distribution,
    # check the remaining artifact key
    elif len(split) == 1:
        dist, dist_version = distro_split(split[0])

    triple = (
        "{arch}-{vendor}-{system}-{abi}".format(
            arch=arch,
            vendor=vendor,
            system=system,
            abi=abi,
        )
        .rstrip("-")
        .replace("--", "-")
    )

    # Update any potential ABI information.
    if not abi:
        triple = triple_abi_assumption(triple)

    distribution = (
        "{dist}-{version}".format(
            dist=dist,
            version=dist_version,
        )
        if dist
        else "*"
    )

    return (triple, distribution)


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
    # Github has some pretty senstive rate limiting, attempt to retry in the event
    # we detect we've been hit by the rate limiter.
    retries = 0
    while retries < 5:
        try:
            # Protect against rate limiting from the Github API
            time.sleep(5)
            with request.urlopen(url=url.geturl()) as data:
                content = data.read()

            if not content:
                raise RuntimeError("Failed to download: {}".format(url))

            data = json.loads(content)
            break
        except HTTPError as exc:
            if (
                exc.getcode() == 429
                or exc.getcode() == 403
                and "rate limit exceeded" in str(exc)
            ):
                retries += 1
                sleep_time = 30 * retries
                logging.debug(
                    "Rate limit exceeded, trying again in %d seconds", sleep_time
                )
                time.sleep(sleep_time)
                continue
            # Ignore versions that do not have github releases
            if exc.getcode() != 404:
                raise
            data = {"assets": []}
            break

    prefix_len = len("clang+llvm-{}-".format(version))
    suffix_len = len(".tar.xz")

    # Some artifacts will have matching triples but will be built for different
    # distributions (rhel vs ubuntu). We collect artifact information as a list
    # here and combine them into a dict later.
    artifacts: List[Tuple[str, str], Dict[str, str]] = [
        (
            triple_from_artifact(asset["name"][prefix_len:-suffix_len]),
            {
                # Create a mapping of urls to sha256 vaues of their content
                "urls": {parse.unquote(asset["browser_download_url"]): None},
            },
        )
        for asset in data["assets"]
        if re.match(ARTIFACT_REGEX, asset["name"])
        and not asset["name"][prefix_len:].startswith("rc")
        and not "ubuntu" in asset["name"][prefix_len:]
    ]

    # Add linux artifacts
    artifacts.extend(query_debian_artifacts(version))

    # Combine all artifacts to match the following format
    # "triple": {
    #     "distribution": {
    #         "urls": {
    #             "https://url": "sha256",
    #             # ...
    #         },
    #         # ...
    #     }
    # }
    combiend_artifacts = {}
    for data in artifacts:
        triple_data, artifact_data = data
        triple, dist = triple_data

        art_entry = combiend_artifacts.get(triple, {})
        art_entry.update({dist: artifact_data})
        combiend_artifacts.update({triple: art_entry})

    return combiend_artifacts


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


def generate_sha256_values(version_assets, numprocesses: int) -> None:
    with tempfile.TemporaryDirectory() as tmp_dir:
        logging.debug("temp directory: {}".format(tmp_dir))
        tmp_path = Path(tmp_dir)

        for triple_assets in version_assets.values():
            for triple in triple_assets:
                for data in triple_assets[triple].values():
                    for url in data["urls"]:
                        # Skip if a sha256 value is present
                        if data["urls"][url]:
                            continue
                        QUEUE.put((tmp_path, parse.urlparse(url)))

        # Do nothing if the task queue is empty
        if QUEUE.empty():
            return

        threads = []
        for i in range(numprocesses):
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
            for triple in version_assets[version]:
                for dist in version_assets[version][triple]:
                    for url in version_assets[version][triple][dist]["urls"]:
                        # Skip anything that already has a sha256 value
                        if version_assets[version][triple][dist]["urls"][url]:
                            continue
                        sha256_file = tmp_path / sha256_file_path(
                            Path(parse.urlparse(url).path.lstrip("/"))
                        )
                        version_assets[version][triple][dist]["urls"][
                            url
                        ] = sha256_file.read_text(encoding="utf-8").strip()

    return version_assets


def _find_workspace_root() -> Path:
    root = os.environ.get("BUILD_WORKSPACE_DIRECTORY")
    if root:
        return Path(root)

    return Path(__file__).parent.parent.parent.parent


def main() -> None:
    """The script's main entrypoint"""

    args = parse_args()
    if args.verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)

    output_bzl = _find_workspace_root() / args.output

    version_assets = {version: query_artifacts(version) for version in LLVM_VERSIONS}
    complete_version_assets = generate_sha256_values(
        version_assets=version_assets, numprocesses=args.numprocesses
    )

    output_bzl.write_text(
        TEMPLATE.format(json.dumps(complete_version_assets, indent=4))
    )
    run_buildifier(output_bzl)

    logging.info("Done")


if __name__ == "__main__":
    main()
    sys.exit(0)
