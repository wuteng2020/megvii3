config_setting (
    name = "x86_64_gcc",
    values = {
        "cpu": "k8",
        "compiler": "gcc",
    },
    visibility = ["//visibility:public"],
)

config_setting (
    name = "x86_64_gcc_cuda8",
    values = {
        "cpu": "k8",
        "compiler": "gcc_cuda8",
    },
    visibility = ["//visibility:public"],
)

cc_library(
    name = "cudnn",
    deps = select({
        ":x86_64_gcc_cuda8"                 :   ["//external:cudnn_x86_64_cuda8"],
        "//tools/toolchain:x86_64_gcc_cuda" :   ["//external:cudnn_x86_64"],
        ":x86_64_gcc"                       :   ["//external:cudnn_x86_64"],
        "//conditions:default"              :   [],
        }) + if_armv7([
        "//external:cudnn_armv7",
        ]) + if_aarch64([
        "//external:cudnn_aarch64",
        ]),
    visibility = ["//visibility:public"],
    )
