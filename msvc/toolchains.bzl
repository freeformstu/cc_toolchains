"""Microsoft Visual Compiler (MSVC) toolchain definitions"""

DEFAULT_EXEC_TRIPLES = [
    "x86_64-pc-windows-msvc",
]
DEFAULT_TARGET_TRIPLES = [
    "x86_64-pc-windows-msvc",
]

def msvc_register_toolchains(exec_triples = None, target_triples = None, name_template = "llvm-{version}_{exec_triple}__{target_triple}", version = "latest", register_toolchains = True):
    """_summary_

    Args:
        register_toolchains (bool, optional): _description_. Defaults to True.
    """

    fail("Unimplemented")
