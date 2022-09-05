"""Low Level Virtual Machine (LLVM) toolchain definitions"""

load("//llvm:repositories.bzl", "llvm_toolchain_set_repository")
load("//llvm/private:repository_utils.bzl", "get_latest_version")

DEFAULT_EXEC_TRIPLES = [
    # "x86_64-unknown-linux-gnu",
    "x86_64-apple-darwin",
]
DEFAULT_TARGET_TRIPLES = [
    # "x86_64-unknown-linux-gnu",
    "x86_64-apple-darwin",
]

def llvm_register_toolchains(exec_triples = None, target_triples = None, name_template = "llvm-{version}_{exec_triple}__{target_triple}", version = "latest", register_toolchains = True):
    """_summary_

    Args:
        register_toolchains (bool, optional): _description_. Defaults to True.
    """

    if version == "latest":
        version = get_latest_version()

    all_exec_triples = exec_triples
    if all_exec_triples == None:
        all_exec_triples = DEFAULT_EXEC_TRIPLES

    all_target_triples = target_triples
    if all_target_triples == None:
        all_target_triples = DEFAULT_TARGET_TRIPLES

    existing_rules = native.existing_rules()

    toolchains = []
    for host_triple in all_exec_triples:
        for target_triple in all_target_triples:
            name = name_template
            name = name.replace("{version}", version)
            name = name.replace("{exec_triple}", host_triple)
            name = name.replace("{target_triple}", target_triple)

            if name in existing_rules:
                continue

            toolchains.extend(llvm_toolchain_set_repository(
                name = name,
                version = version,
                exec_triple = host_triple,
                target_triple = target_triple,
            ))

    native.register_toolchains(*toolchains)
