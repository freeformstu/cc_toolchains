"""LLVM repository definitions"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:util.bzl", "maybe")
load("//constraints:constraints.bzl", "triple_to_constraint_set")

def llvm_toolchain_dependencies():
    """_summary_
    """
    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.2.1/bazel-skylib-1.2.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.2.1/bazel-skylib-1.2.1.tar.gz",
        ],
        sha256 = "f7be3474d42aae265405a592bb7da8e171919d74c16f082a5457840f06054728",
    )

def llvm_register_toolchains():
    """_summary_
    """
    pass

def _llvm_toolchain_tools_repository(repository_ctx):
    pass

llvm_toolchain_tools_repository = repository_rule(
    implementation = _llvm_toolchain_tools_repository,
    doc = "TODO",
    attrs = {
    },
)

def _llvm_toolchain_proxy_repository(repository_ctx):
    pass

llvm_toolchain_proxy_repository = repository_rule(
    implementation = _llvm_toolchain_proxy_repository,
    doc = "TODO",
    attrs = {
        "tools_repo_name": attr.string(
            doc = "",
            mandatory = True,
        ),
        "exec_compatible_with": attr.string_list(
            doc = "",
        ),
        "target_compatible_with": attr.string_list(
            doc = "",
        ),
    },
)

def llvm_toolchain_repository(
        name,
        exec_triple,
        target_triple,
        features = [],
        action_configs = [],
        artifact_name_patterns = [],
        cxx_builtin_include_directories = [],
        make_variables = [],
        target_compatible_with=None,
        exec_compatible_with=None):
    """_summary_

    Args:
        name (_type_): _description_
    """        
    llvm_toolchain_tools_repository(
        name = name + "_tools",
        features = features,
        action_configs = action_configs,
        artifact_name_patterns = artifact_name_patterns,
        cxx_builtin_include_directories = cxx_builtin_include_directories,
        make_variables = make_variables,
    )

    if target_compatible_with:
        target_compatible_with = triple_to_constraint_set(target_triple)

    if exec_compatible_with:
        exec_compatible_with = triple_to_constraint_set(exec_triple)

    llvm_toolchain_proxy_repository(
        name = name,
        tools_repo_name = name + "_tools",
        target_compatible_with = target_compatible_with,
        exec_compatible_with = exec_compatible_with,
    )
