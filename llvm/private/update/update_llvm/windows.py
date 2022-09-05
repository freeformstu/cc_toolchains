from typing import Optional, Dict, Any

from .types import Semver, VersionArtifacts


def query_windows_artifacts(
    version: Semver, github_release_info: Optional[Dict[str, Any]] = None
) -> VersionArtifacts:
    # https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/LLVM-14.0.6-win64.exe
    # https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/LLVM-14.0.6-woa64.zip (Windows On Arm, aarch64)
    # Very few artifacts have the correct binary
    pass
