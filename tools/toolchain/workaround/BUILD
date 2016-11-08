package(default_visibility = ['//visibility:public'])

filegroup(
    name = "os_select",
    srcs = os_select([
        "linux",
        ], [
        "android",
        ], [
        "ios",
        ]),
    )

filegroup(
    name = "wibu_enabled_select",
    srcs = wibu_enabled_select([
        "is_wibu_enabled",
        ], [
        "is_not_wibu_enabled",
        ]),
    )

filegroup(
    name = "arch_select",
    srcs = if_x86_64([
        "x86_64",
        ]) + if_x86_32([
        "x86_32",
        ]) + if_x86_32_sse3([
        "x86_32_sse3",
        ]) + if_armv7([
        "armv7",
        ]) + if_aarch64([
        "aarch64",
        ]),
    )

filegroup(
    name = "compilation_mode_select",
    srcs = compilation_mode_select([
        "fastbuild",
        ], [
        "dbg",
        ], [
        "opt",
        ])
    )
