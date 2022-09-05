
from typing import Any, Dict, Optional

from .types import Semver, VersionArtifacts


def query_macos_artifacts(
    version: Semver, github_release_info: Optional[Dict[str, Any]] = None
) -> VersionArtifacts:
    # https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/clang+llvm-14.0.6-x86_64-apple-darwin.tar.xz
    # Artifacts can be downloaded directly from github
    pass

