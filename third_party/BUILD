cc_library(
    name = "cudnn",
    deps = if_x86_64([
        "//external:cudnn_x86_64",
        ]) + if_armv7([
        "//external:cudnn_armv7",
        ]) + if_aarch64([
        "//external:cudnn_aarch64",
        ]),
    visibility = ["//visibility:public"],
    )
