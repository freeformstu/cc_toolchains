"""Definitions of unique types used to describe how to download toolchains."""

from typing import Dict

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

Sha256 = str
Url = str
DownloadInfo = Dict[Url, Sha256]
Artifact = Dict[str, str]
VersionArtifacts = Dict[str, Artifact]
