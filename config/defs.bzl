load(
    "@bazel_tools//tools/cpp:unix_cc_toolchain_config.bzl",
    _unix_cc_toolchain_config = "cc_toolchain_config",
)
load(
    "@bazel_tools//tools/cpp:windows_cc_toolchain_config.bzl",
    _windows_cc_toolchain_config = "cc_toolchain_config",
)

unix_cc_toolchain_config = _unix_cc_toolchain_config
windows_cc_toolchain_config = _windows_cc_toolchain_config
