"""Utilities for defining constraint values"""

load(":triple.bzl", "triple")

# CPUs that map to a "@platforms//cpu entry
_CPU_ARCH_TO_BUILTIN_PLAT_SUFFIX = {
    "aarch64": "aarch64",
    "arm": "arm",
    "armv7": "armv7",
    "armv7s": None,
    "asmjs": None,
    "i386": "i386",
    "i586": None,
    "i686": "x86_32",
    "le32": None,
    "mips": None,
    "mipsel": None,
    "powerpc": "ppc",
    "powerpc64": None,
    "powerpc64le": None,
    "riscv32": "riscv32",
    "riscv32imc": "riscv32",
    "s390": None,
    "s390x": "s390x",
    "thumbv7m": "armv7",
    "wasm32": None,
    "x86_64": "x86_64",
}

# Systems that map to a "@platforms//os entry
_SYSTEM_TO_BUILTIN_SYS_SUFFIX = {
    "android": "android",
    "bitrig": None,
    "darwin": "osx",
    "dragonfly": None,
    "eabi": "none",
    "emscripten": None,
    "freebsd": "freebsd",
    "ios": "ios",
    "linux": "linux",
    "nacl": None,
    "netbsd": None,
    "none": "none",
    "openbsd": "openbsd",
    "solaris": None,
    "unknown": None,
    "wasi": None,
    "windows": "windows",
}

def cpu_arch_to_constraints(cpu_arch):
    plat_suffix = _CPU_ARCH_TO_BUILTIN_PLAT_SUFFIX[cpu_arch]

    if not plat_suffix:
        fail("CPU architecture \"{}\" is not supported by rules_rust".format(cpu_arch))

    return ["//constraints/cpu:{}".format(plat_suffix)]

def vendor_to_constraints(_vendor):
    return []

def system_to_constraints(system):
    sys_suffix = _SYSTEM_TO_BUILTIN_SYS_SUFFIX[system]

    if not sys_suffix:
        fail("System \"{}\" is not supported by rules_rust".format(sys_suffix))

    return ["//constraints/os:{}".format(sys_suffix)]

def abi_to_constraints(_abi):
    # TODO(acmcarther): Implement when C++ toolchain is more mature and we
    # figure out how they're doing this
    return []

def extra_ios_constriants(triple):
    """Add constraints specific to iOS targets.

    Args:
        triple: The full triple struct for the target

    Returns:
        A list of constraints to add to the target
    """

    # TODO: Simplify if https://github.com/bazelbuild/bazel/issues/11454 is fixed
    if triple.system != "ios":
        return []
    if triple.abi == "sim":
        return ["@build_bazel_apple_support//constraints:simulator"]
    elif triple.arch == "aarch64":  # Only add device for archs that have both
        return ["@build_bazel_apple_support//constraints:device"]
    else:
        return []

def triple_to_constraint_set(target_triple):
    """Returns a set of constraints for a given platform triple

    Args:
        target_triple (str): A platform triple. eg: `x86_64-unknown-linux-gnu`

    Returns:
        list: A list of constraints (each represented by a list of strings)
    """

    triple_struct = triple(target_triple)

    constraint_set = []
    constraint_set += cpu_arch_to_constraints(triple_struct.arch)
    constraint_set += vendor_to_constraints(triple_struct.vendor)
    constraint_set += system_to_constraints(triple_struct.system)
    constraint_set += abi_to_constraints(triple_struct.abi)
    constraint_set += extra_ios_constriants(triple_struct)

    return constraint_set
