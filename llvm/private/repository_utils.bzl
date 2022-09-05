"""Utilities for fetching llvm toolchain artifacts"""

load("@bazel_skylib//lib:versions.bzl", "versions")
load("//constraints:constraints.bzl", "triple_to_constraint_set")
load(":llvm_versions.bzl", "LLVM_VERSIONS")

def get_llvm_distro(target_triple, version):
    """_summary_

    Args:
        target_triple (_type_): _description_
        version (_type_): _description_

    Returns:
        _type_: _description_
    """
    toolchains = LLVM_VERSIONS.get(version)
    if not toolchains:
        fail("{} is not a known toolchain version. Try one of {}".format(
            version,
            LLVM_VERSIONS.keys(),
        ))

    toolchain_info = toolchains.get(target_triple)
    if not toolchain_info:
        fail("{} does not have a toolchain for version {}. Try one of {}".format(
            target_triple,
            version,
            toolchains.keys(),
        ))

    return struct(
        sha256 = toolchain_info.get("sha256"),
        url = toolchain_info.get("url"),
    )

def get_latest_version():
    llvm_versions = sorted([versions.parse(v) for v in LLVM_VERSIONS.keys()])
    major, minor, patch = llvm_versions[-1]
    return "{}.{}.{}".format(
        major,
        minor,
        patch,
    )

def write_workspace_file(repository_ctx):
    """_summary_

    Args:
        repository_ctx (_type_): _description_
    """
    repository_ctx.file("WORKSPACE.bazel", """workspace(name = "{}")""".format(
        repository_ctx.name,
    ))

_LLVM_TOOLCHAIN_TEMPLATE = """\
# {repository_name}
package(default_visibility = ["//visibility:public"])

filegroup(
    name = "all_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "ar_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "as_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "compiler_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "dwp_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "linker_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "objcopy_files",
    srcs = [],
    tags = ["manual"],
)

filegroup(
    name = "strip_files",
    srcs = [],
    tags = ["manual"],
)
"""

def write_tools_build_file(repository_ctx, target_triple):
    repository_ctx.file(
        "BUILD.bazel",
        _LLVM_TOOLCHAIN_TEMPLATE.format(
            repository_name = repository_ctx.name,
        ),
    )

_LLVM_TOOLCHAIN_CONFIG_TEMPLATE = """\
cc_toolchain_config(
    name = "cc_toolchain_config",
    abi_libc_version = "{abi_libc_version}",
    abi_version = "{abi_version}",
    # builtin_sysroot = sysroot_path,
    compile_flags = [],
    compiler = "{compiler}",
    coverage_compile_flags = [],
    coverage_link_flags = [],
    cpu = "{cpu}",
    cxx_builtin_include_directories = [],
    cxx_flags = [],
    dbg_compile_flags = [],
    host_system_name = "{host_system_name}",
    link_flags = [],
    link_libs = [],
    opt_compile_flags = [],
    opt_link_flags = [],
    # supports_start_end_lib = supports_start_end_lib,
    target_libc = "{target_libc}",
    target_system_name = "{target_system_name}",
    tool_paths = {{}},
    toolchain_identifier = "{toolchain_identifier}",
    unfiltered_compile_flags = [],
    tags = ["manual"],
)

cc_toolchain(
    name = "cc_toolchain",
    all_files = "@{tools_repo_name}//:all_files",
    ar_files = "@{tools_repo_name}//:ar_files",
    as_files = "@{tools_repo_name}//:as_files",
    compiler_files = "@{tools_repo_name}//:compiler_files",
    dwp_files = "@{tools_repo_name}//:dwp_files",
    linker_files = "@{tools_repo_name}//:linker_files",
    objcopy_files = "@{tools_repo_name}//:objcopy_files",
    strip_files = "@{tools_repo_name}//:strip_files",
    toolchain_config = ":cc_toolchain_config",
    tags = ["manual"],
)

toolchain(
    name = "toolchain",
    exec_compatible_with = {exec_constraint_sets_serialized},
    target_compatible_with = {target_constraint_sets_serialized},
    toolchain = ":cc_toolchain",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    visibility = ["//visibility:public"],
)
"""

def generate_toolchain_config_build_content(name, tools_repo_name, exec_triple, target_triple):
    if exec_triple.system == "darwin":
        target_libc = "macosx"
    else:
        fail("TODO")

    return _LLVM_TOOLCHAIN_CONFIG_TEMPLATE.format(
        exec_constraint_sets_serialized = json.encode(triple_to_constraint_set(exec_triple)),
        target_constraint_sets_serialized = json.encode(triple_to_constraint_set(target_triple)),
        abi_libc_version = "unknown",
        abi_version = "unknown",
        cpu = target_triple.arch,
        host_system_name = exec_triple.system,
        target_system_name = target_triple.system,
        tools_repo_name = tools_repo_name.format(
            name = name,
            host = "common",
        ),
        toolchain_identifier = "unknown",
        compiler = "clang",
        target_libc = target_libc,
    )

_LLVM_TOOLCHAIN_CONFIG_HEADER_TEMPLATE = """\
load("@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl", "cc_toolchain_config")
load("@rules_cc//cc:defs.bzl", "cc_toolchain")

"""

def write_config_build_file(repository_ctx, tools_repo_name, exec_triple, target_triple):
    repository_ctx.file(
        "BUILD.bazel",
        "\n".join([
            _LLVM_TOOLCHAIN_CONFIG_HEADER_TEMPLATE,
            generate_toolchain_config_build_content(
                name = repository_ctx.name,
                tools_repo_name = tools_repo_name,
                exec_triple = exec_triple,
                target_triple = target_triple,
            ),
        ]),
    )

def download_artifact(repository_ctx, version, target_triple, host):
    llvm_artifacts = LLVM_VERSIONS[version].get(target_triple)
    if not llvm_artifacts:
        fail("Unexpected")

    host_artifact = llvm_artifacts.get(host)
    if not host_artifact:
        host_artifact = llvm_artifacts.get("*")
    if not host_artifact:
        fail("No artifact for {} in {}".format(
            repository_ctx.attr.host,
            llvm_artifacts,
        ))

    # URL and sha256 values are always expected to be set
    host_url = host_artifact["url"]
    host_sha256 = host_artifact["sha256"]

    _, _, filename = host_url.rpartition("/")
    if filename.endswith((".tar.gz", ".tar.xz")):
        host_strip_prefix = filename[:-len(".tar.xz")]
    else:
        host_strip_prefix = ""

    repository_ctx.download_and_extract(
        url = host_url,
        sha256 = host_sha256,
        stripPrefix = host_strip_prefix,
    )
