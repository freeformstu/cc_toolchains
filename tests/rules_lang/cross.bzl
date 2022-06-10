"""Rules cross compiling targets"""

def _platform_transition_impl(_settings, attrs):
    return {"//command_line_option:platforms": attrs.platform}

_platform_transition = transition(
    implementation = _platform_transition_impl,
    inputs = ["//command_line_option:platforms"],
    outputs = ["//command_line_option:platforms"],
)

def _cross_impl(ctx):
    target_info = ctx.attr.target[DefaultInfo]

    return [DefaultInfo(
        file = target_info.files,
        runfiles = ctx.runfiles(
            files = target_info.default_runfiles,
        ),
    )]

_cross = rule(
    implementation = _cross_impl,
    doc = "A rule for transitioning targets to a new platform",
    attrs = {
        "platform": attr.string(
            doc = "The platform to transition to.",
            mandatory = True,
        ),
        "target": attr.label(
            doc = "The target to transition.",
            mandatory = True,
        ),
        "_allowlist_function_transition": attr.label(
            default = Label("//tools/allowlists/function_transition_allowlist"),
        ),
    },
    cfg = _platform_transition,
    incompatible_use_toolchain_transition = True,
)

_ENABLE_CROSS = False

def cross(**kwargs):
    if _ENABLE_CROSS:
        _cross(**kwargs)
