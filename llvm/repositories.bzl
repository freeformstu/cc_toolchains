"""LLVM repository definitions"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("//constraints:triple.bzl", "triple")
load("//constraints:constraints.bzl", "triple_to_constraint_set")
load("//llvm/private:repository_utils.bzl", "write_config_build_file", "write_tools_build_file", "write_workspace_file", "download_artifact")
load("//llvm/private:llvm_versions.bzl", "LLVM_VERSIONS")

def llvm_toolchain_dependencies():
    """Load dependencies required for llvm toolchains
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

def _llvm_toolchain_tools_repository(repository_ctx):
    write_workspace_file(repository_ctx)

    target_triple = triple(repository_ctx.attr.target_triple)

    write_tools_build_file(
        repository_ctx,
        target_triple = target_triple,
    )

    # Download all host tools
    download_artifact(
        repository_ctx,
        version = repository_ctx.attr.version,
        target_triple = target_triple.str,
        host = repository_ctx.attr.host,
    )

llvm_toolchain_tools_repository = repository_rule(
    implementation = _llvm_toolchain_tools_repository,
    doc = "TODO",
    attrs = {
        "version": attr.string(
            doc = "",
            mandatory = True,
            values = LLVM_VERSIONS.keys(),
        ),
        "target_triple": attr.string(
            doc = "",
            mandatory = True,
        ),
        "host": attr.string(
            doc = "e.g. ubuntu-20",
            mandatory = True,
        ),
    },
)

def _llvm_toolchain_config_repository(repository_ctx):
    write_workspace_file(repository_ctx)

    write_config_build_file(
        repository_ctx,
        exec_triple = triple(repository_ctx.attr.exec_triple),
        target_triple = triple(repository_ctx.attr.target_triple),
        tools_repo_name = repository_ctx.attr.tools_repo_name_template,
    )

llvm_toolchain_config_repository = repository_rule(
    implementation = _llvm_toolchain_config_repository,
    doc = "TODO",
    attrs = {
        "tools_repo_name_template": attr.string(
            doc = "",
            mandatory = True,
        ),
        "version": attr.string(
            doc = "",
            mandatory = True,
            values = LLVM_VERSIONS.keys(),
        ),
        "exec_triple": attr.string(
            doc = "",
            mandatory = True,
        ),
        "target_triple": attr.string(
            doc = "",
            mandatory = True,
        ),
        "action_configs": attr.string_list(
            doc = "",
        ),
        "artifact_name_patterns": attr.string_list(
            doc = "",
        ),
        "cxx_builtin_include_directories": attr.string_list(
            doc = "",
        ),
        "make_variables": attr.string_list(
            doc = "",
        ),
    },
)

def _sanitize_host_name(target_host):
    return target_host if target_host != "*" else "common"

def llvm_toolchain_repository(
        name,
        version,
        exec_triple,
        target_triple,
        host = "*",
        features = [],
        action_configs = [],
        artifact_name_patterns = [],
        cxx_builtin_include_directories = [],
        make_variables = [],
        target_compatible_with = None,
        exec_compatible_with = None):
    """_summary_

    Args:
        name (_type_): _description_
        version (_type_): _description_
        exec_triple (_type_): _description_
        target_triple (_type_): _description_
        host (_type_): _description_
        features (list, optional): _description_. Defaults to [].
        action_configs (list, optional): _description_. Defaults to [].
        artifact_name_patterns (list, optional): _description_. Defaults to [].
        cxx_builtin_include_directories (list, optional): _description_. Defaults to [].
        make_variables (list, optional): _description_. Defaults to [].
        target_compatible_with (_type_, optional): _description_. Defaults to None.
        exec_compatible_with (_type_, optional): _description_. Defaults to None.

    Returns:
        _type_: _description_
    """

    existing_rules = native.existing_rules()

    tools_repo_name_template = "{name}__{host}-tools"

    # Download the host tools
    exec_llvm_artifacts = LLVM_VERSIONS[version].get(exec_triple)
    if not exec_llvm_artifacts:
        fail("Unexpected")

    tools_name = tools_repo_name_template.format(
        name = name,
        host = _sanitize_host_name(host),
    )

    if tools_name not in existing_rules:
        llvm_toolchain_tools_repository(
            name = tools_name,
            version = version,
            target_triple = target_triple,
            host = host,
        )

    target_llvm_artifacts = LLVM_VERSIONS[version].get(target_triple)
    if not target_llvm_artifacts:
        fail("Unexpected")

    for target_host in target_llvm_artifacts:
        tools_name = tools_repo_name_template.format(
            name = name,
            host = _sanitize_host_name(target_host),
        )

        if tools_name in existing_rules:
            continue

        llvm_toolchain_tools_repository(
            name = tools_name,
            version = version,
            target_triple = target_triple,
            host = target_host,
        )

    if target_compatible_with:
        target_compatible_with = triple_to_constraint_set(target_triple)

    if exec_compatible_with:
        exec_compatible_with = triple_to_constraint_set(exec_triple)

    llvm_toolchain_config_repository(
        name = name,
        tools_repo_name_template = tools_repo_name_template,
        version = version,
        features = features,
        exec_triple = exec_triple,
        target_triple = target_triple,
        action_configs = action_configs,
        artifact_name_patterns = artifact_name_patterns,
        cxx_builtin_include_directories = cxx_builtin_include_directories,
        make_variables = make_variables,
        target_compatible_with = target_compatible_with,
        exec_compatible_with = exec_compatible_with,
    )

    return "@{}//:toolchain".format(name)

def _toolchain_set_repository_impl(repository_ctx):
    repository_ctx.file("WORKSPACE.bazel", """workspace(name = "{}")""".format(
        repository_ctx.name,
    ))

    repository_ctx.file("BUILD.bazel", """exports_files(["defs.bzl"])""")
    repository_ctx.file("defs.bzl", "ALL_TOOLCHAINS = {}\n".format(
        json.encode_indent(repository_ctx.attr.toolchains, indent = " " * 4),
    ))

toolchain_set_repository = repository_rule(
    doc = (
        "Generates a toolchain-bearing repository that declares the toolchains from some other " +
        "toolchain repositories."
    ),
    attrs = {
        "toolchains": attr.string_list(
            doc = "The list of toolchains.",
            mandatory = True,
        ),
    },
    implementation = _toolchain_set_repository_impl,
)

def llvm_toolchain_set_repository(
        name,
        version,
        exec_triple,
        target_triple,
        target_compatible_with = None,
        exec_compatible_with = None,
        **kwargs):
    hosts = LLVM_VERSIONS[version].get(exec_triple)
    if not hosts:
        fail("{} is not available for llvm {}. Available triples are: {}".format(
            exec_triple,
            version,
            LLVM_VERSIONS[version].keys(),
        ))

    if hosts.keys() == ["*"]:
        return [llvm_toolchain_repository(
            name = name,
            exec_triple = exec_triple,
            target_triple = target_triple,
            version = version,
            host = "*",
            target_compatible_with = target_compatible_with,
            exec_compatible_with = exec_compatible_with,
            **kwargs
        )]

    if target_compatible_with == None:
        target_compatible_with = triple_to_constraint_set(target_triple)

    if exec_compatible_with == None:
        exec_compatible_with = triple_to_constraint_set(exec_triple)

    toolchains = []
    for host in hosts:
        if host == "*":
            toolchain_name = name
            extra_constraints = []
        else:
            toolchain_name = "{}-{}".format(name, host)
            host_name = host.split("-", maxsplit = 1)[0]
            extra_constraints = [
                "@cc_toolchains//constraints/os:{}".format(host_name),
                "@cc_toolchains//constraints/os:{}".format(host),
            ]

        toolchains.append(llvm_toolchain_repository(
            name = toolchain_name,
            exec_triple = exec_triple,
            target_triple = target_triple,
            version = version,
            host = host,
            exec_compatible_with = exec_compatible_with + extra_constraints,
            target_compatible_with = target_compatible_with,
            **kwargs
        ))

    toolchain_set_repository(
        name = name,
        toolchains = toolchains,
    )

    return toolchains
