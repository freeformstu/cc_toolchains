"""Utilities for fetching llvm toolchain artifacts"""

def llvm_artifact_info(value):
    """_summary_

    Args:
        value (_type_): _description_

    Returns:
        _type_: _description_
    """
    split = value.split("-")

    arch = None
    vendor = None
    system = None
    distribution = None
    distribution_version = None

    if split:
        arch = split.pop(0)

    if split:
        vendor = split.pop(0)

    if split:
        system = split.pop(0)

    if split:
        distribution = split.pop(0)

    if split:
        distribution_version = split.pop(0)

    return struct(
        arch = arch,
        vendor = vendor,
        system = system,
        distribution = distribution,
        distribution_version = distribution_version,
        str = value,
    )

def get_llvm_distro(target_triple, version):
    pass
