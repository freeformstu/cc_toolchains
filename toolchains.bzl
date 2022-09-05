"""Common toolchain definitions"""

load("//constraints:triple.bzl", "triple")
load("//gcc:toolchains.bzl", "gcc_register_toolchains")
load("//llvm:toolchains.bzl", "llvm_register_toolchains", LLVM_DEFAULT_EXEC_TRIPLES = "DEFAULT_EXEC_TRIPLES")
load("//msvc:toolchains.bzl", "msvc_register_toolchains")

DEFAULT_TOOLCHAINS = ["llvm-latest-{}".format(t) for t in LLVM_DEFAULT_EXEC_TRIPLES]

_SUPPORTED_TOOLCHAIN_TYPES = ["llvm", "gcc", "msvc"]

def _is_version(value):
    return [c for c in value.elems() if c.isalpha() or c == "."]

def _toolchain_info(value):
    split = value.split("-")

    if split[0] not in _SUPPORTED_TOOLCHAIN_TYPES:
        fail("Unsupported toolchain type: {}".format(
            split[0],
        ))

    toolchain = split.pop(0)

    # Check for semver values
    version = "latest"
    if split[0] and _is_version(split[0]):
        version = split.pop(0)

    return struct(
        toolchain = toolchain,
        version = version,
        triple = triple("-".join(split)),
    )

def _parse_info(values):
    llvm_info = []
    gcc_info = []
    msvc_info = []
    for value in values:
        toolchain_info = _toolchain_info(value)
        if toolchain_info.toolchain == "llvm":
            llvm_info.append(toolchain_info)
        elif toolchain_info.toolchain == "gcc":
            gcc_info.append(toolchain_info)
        elif toolchain_info.toolchain == "msvc":
            msvc_info.append(toolchain_info)
        else:
            fail("{} is unexpected in the list of exec triples: {}".format(
                value,
                values,
            ))

    # TODO: Allow users to register toolchains of different versions
    for toolchain_infos in [llvm_info, gcc_info, msvc_info]:
        current_version = None
        for info in toolchain_infos:
            if not current_version:
                current_version = info.version
            elif current_version != info.version:
                fail("The requested set of {} toolchains do not have consistent version numbers: {}".format(
                    info.toolchain,
                    toolchain_infos,
                ))

    return struct(
        llvm = llvm_info,
        gcc = gcc_info,
        msvc = msvc_info,
    )

def cc_register_toolchains(exec_triples = DEFAULT_TOOLCHAINS, target_triples = None, register_toolchains = True):
    """_summary_

    Args:
        llvm (bool, optional): _description_. Defaults to True.
        gcc (bool, optional): _description_. Defaults to False.
        msvc (bool, optional): _description_. Defaults to False.
        register_toolchains (bool, optional): _description_. Defaults to True.
    """

    exec_info = _parse_info(exec_triples)
    if target_triples != None:
        target_info = _parse_info(target_triples)
    else:
        target_info = struct(
            llvm = None,
            gcc = None,
            msvc = None,
        )

    if exec_info.llvm:
        llvm_register_toolchains(
            version = exec_info.llvm[0].version,
            exec_triples = [info.triple.str for info in exec_info.llvm],
            target_triples = [info.triple.str for info in target_info.llvm] if target_info.llvm else None,
            register_toolchains = register_toolchains,
        )

    if exec_info.gcc:
        gcc_register_toolchains(
            version = exec_info.gcc[0].version,
            exec_triples = [info.triple.str for info in exec_info.gcc],
            target_triples = [info.triple.str for info in target_info.gcc] if target_info.gcc else None,
            register_toolchains = register_toolchains,
        )

    if exec_info.msvc:
        msvc_register_toolchains(
            version = exec_info.msvc[0].version,
            exec_triples = [info.triple.str for info in exec_info.msvc],
            target_triples = [info.triple.str for info in target_info.msvc] if target_info.msvc else None,
            register_toolchains = register_toolchains,
        )
