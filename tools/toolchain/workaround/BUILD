package(default_visibility = ['//visibility:public'])

filegroup(
    name = "ios_select",
    srcs = ios_select([
        "is_ios",
        ], [
        "is_not_ios",
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
        ]) + if_armv7([
        "armv7",
        ]) + if_aarch64([
        "aarch64",
        ]),
    )
