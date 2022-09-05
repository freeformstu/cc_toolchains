"""Functionality for downloading debina toolchains"""

import logging
import re
from typing import List, TypeVar
from urllib import parse, request
from urllib.error import HTTPError

from .types import Semver, VersionArtifacts

LINUX_UBUNTU_PACKAGE_ROOT = "https://apt.llvm.org"


AnyAptPackage = TypeVar("AnyAptPackage", bound="AptPackage")


class AptPackage:
    def __init__(self, text: str):
        self.package = None
        self.source = None
        self.version = None
        self.architecture = None
        self.maintainer = None
        self.installed_size = None
        self.depends = {}
        self.recommends = None
        self.suggests = None
        self.Provides = []
        self.homepage = None
        self.priority = None
        self.section = None
        self.filename = None
        self.size = None
        self.sha256 = None
        self.sha1 = None
        self.md5sum = None

        def parse_value(text):
            return text.split(" ", 1)[-1].strip()

        for line in text.splitlines():
            if line.startswith("Package:"):
                self.package = parse_value(line)
            elif line.startswith("Source:"):
                self.source = parse_value(line)
            elif line.startswith("Version:"):
                self.version = parse_value(line)
            elif line.startswith("Architecture:"):
                self.architecture = parse_value(line)
            elif line.startswith("Maintainer:"):
                self.maintainer = parse_value(line)
            elif line.startswith("Installed-Size"):
                self.installed_size = int(parse_value(line))
            elif line.startswith("Depends:"):
                depends = parse_value(line).split(",")
                for dep in depends:
                    name, version = dep.split(" ", 1)
                    self.depends.update({name: version.strip("()")})
            elif line.startswith("Recommends:"):
                self.recommends = parse_value(line)
            elif line.startswith("Suggests:"):
                self.suggests = parse_value(line)
            elif line.startswith("Provides:"):
                self.provides = parse_value(line).split(",")
            elif line.startswith("Homepage:"):
                self.homepage = parse_value(line)
            elif line.startswith("Priority:"):
                self.priority = parse_value(line)
            elif line.startswith("Section:"):
                self.section = parse_value(line)
            elif line.startswith("Filename:"):
                self.filename = parse_value(line)
            elif line.startswith("Size:"):
                self.size = parse_value(line)
            elif line.startswith("SHA256:"):
                self.sha256 = parse_value(line)
            elif line.startswith("SHA1:"):
                self.sha1 = parse_value(line)
            elif line.startswith("MD5sum:"):
                self.md5sum = parse_value(line)

    @classmethod
    def parse_packages_file_content(cls, text: str) -> List[AnyAptPackage]:

        entries = text.split("\n\n")

        return [cls(entry) for entry in entries]


LINUX_UBUNTU_LOCATIONS = {
    # 16
    "xenial": {
        Semver("3.9.1"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-3.9",
        Semver("4.0.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-4.0",
        Semver("5.0.2"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-5.0",
        Semver("6.0.1"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-6.0",
        Semver("7.0.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-7",
        Semver("8.0.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-8",
        Semver("9.0.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-9",
        Semver("10.0.1"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-10",
        Semver("11.1.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-11",
        Semver("12.0.0"): "https://apt.llvm.org/xenial/dists/llvm-toolchain-xenial-12",
    },
    # 22
    "jammy": {
        Semver("13.0.1"): "https://apt.llvm.org/jammy/dists/llvm-toolchain-jammy-13",
        Semver("14.0.6"): "https://apt.llvm.org/jammy/dists/llvm-toolchain-jammy-14",
        Semver("15.0.0"): "https://apt.llvm.org/jammy/dists/llvm-toolchain-jammy-15",
    },
    # 18
    "bionic": {
        Semver("5.0.2"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-5.0",
        Semver("6.0.1"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-6.0",
        Semver("7.1.0"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-7",
        Semver("8.0.1"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-8",
        Semver("9.0.0"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-9",
        Semver("10.0.1"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-10",
        Semver("11.1.0"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-11",
        Semver("12.0.1"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-12",
        Semver("13.0.1"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-13",
        Semver("14.0.6"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-14",
        Semver("15.0.0"): "https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-15",
    },
    # 20
    "focal": {
        Semver("9.0.0"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-9",
        Semver("10.0.1"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-10",
        Semver("11.1.0"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-11",
        Semver("12.0.1"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-12",
        Semver("13.0.1"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-13",
        Semver("14.0.6"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-14",
        Semver("15.0.0"): "https://apt.llvm.org/focal/dists/llvm-toolchain-focal-15",
    },
}


_DEBIAN_ARCH_MAPPINGS = {
    "amd64": "x86_64",
    "i386": "x86_32",
    "s390x": "s390x",
    "arm64": "aarch64",
}

_DEBIAN_TOOLCHAIN_COMPONENT_PKG_PATTERN = r"(clang-[\d]+)$"


def query_debian_artifacts(version: Semver) -> VersionArtifacts:
    # https://apt.llvm.org/bionic/dists/llvm-toolchain-bionic-14/main/binary-amd64/Packages  - empty line delimited
    artifacts = []
    for flavor in LINUX_UBUNTU_LOCATIONS:
        # Not all versions are available for all flavors
        if version not in LINUX_UBUNTU_LOCATIONS[flavor]:
            continue

        url = parse.urlparse(
            "{}/Release".format(LINUX_UBUNTU_LOCATIONS[flavor][version])
        )
        logging.debug("Debian Artifact url: {}".format(url.geturl()))

        # Download Release file
        content = None
        try:
            with request.urlopen(url=url.geturl()) as data:
                content = data.read().decode("utf-8")
        except HTTPError as exc:
            # Ignore versions that do not have github releases
            if exc.getcode() == 404:
                continue

        if not content:
            raise RuntimeError("Failed to download: {}".format(url))

        # Parse all `main/binary-*/Release` files
        package_paths = {}
        found_sha256 = False
        for line in content.splitlines():
            if line.startswith("SHA256:"):
                found_sha256 = True
                continue
            if found_sha256:
                if not line or not line.startswith((" ", "\t")):
                    break
                match = re.match(
                    r"[a-z\d]+ \d+ (\w+\/binary-([a-z\d]*)\/Packages)$", line
                )
                if match:
                    package_paths.update(
                        {
                            match.group(2): parse.urlparse(
                                "{}/{}".format(
                                    url.geturl(),
                                    match.group(1),
                                )
                            )
                        }
                    )

        for arch, package_url in package_paths.items():
            # Download Release file
            packages = {}
            with request.urlopen(url=package_url.geturl()) as data:
                content = data.read().decode("utf-8")
                pkgs = AptPackage.parse_packages_file_content(content)
                packages = {pkg.package: pkg for pkg in pkgs}

            toolchain_packages = {}
            for pkg in packages:
                if re.match(_DEBIAN_TOOLCHAIN_COMPONENT_PKG_PATTERN, pkg):
                    toolchain_packages.update({pkg.url: pkg.sha256})
                    for dep in pkg.depends:
                        if dep in packages:
                            dep_pkg = packages[dep]
                            toolchain_packages.update({dep_pkg.url: dep_pkg.sha256})

            artifacts.append(
                (
                    (
                        "{}-unknown-linux-gnu".format(_DEBIAN_ARCH_MAPPINGS[arch]),
                        "ubuntu-{}".format(flavor),
                    ),
                    {"urls": toolchain_packages},
                )
            )

    return artifacts
