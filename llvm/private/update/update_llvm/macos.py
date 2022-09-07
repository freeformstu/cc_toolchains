
from typing import Any, Dict, Optional

from .types import Semver, VersionArtifacts

MACOS_VERSIONS = [
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

def query_macos_artifacts(
    version: Semver, github_release_info: Optional[Dict[str, Any]] = None
) -> VersionArtifacts:
    # https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-x86_64-apple-darwin.tar.xz
    # Artifacts can be downloaded directly from github
    pass

