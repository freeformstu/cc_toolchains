
from .types import Semver, VersionArtifacts

def query_redhat_artifacts(version: Semver) -> VersionArtifacts:
    ### Centos
    # http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-libs-14.0.0-1.module_el8.7.0+1142+5343df54.i686.rpm
    # http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-libs-14.0.0-1.module_el8.7.0+1142+5343df54.x86_64.rpm
    # http://mirrors.vcea.wsu.edu/centos/8-stream/AppStream/x86_64/os/Packages/clang-14.0.0-1.module_el8.7.0+1142+5343df54.x86_64.rpm
    pass
