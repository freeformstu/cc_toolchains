"""GCC toolchain definitions"""

DEFAULT_EXEC_TRIPLES = [
    "x86_64-unknown-linux-gnu",
    "x86_64-apple-darwin",
]
DEFAULT_TARGET_TRIPLES = [
    "x86_64-unknown-linux-gnu",
    "x86_64-apple-darwin",
]

def gcc_register_toolchains(exec_triples = None, target_triples = None, name_template = "llvm-{version}_{exec_triple}__{target_triple}", version = "latest", register_toolchains = True):
    """_summary_

    Args:
        register_toolchains (bool, optional): _description_. Defaults to True.
    """

    fail("Unimplemented")
