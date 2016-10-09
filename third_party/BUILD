cc_library(
    name = "cudnn",
    deps = select({
        "//tools/toolchain:x86_64_gcc4_cuda7"   :   ["//external:cudnn_x86_64"],
        "//tools/toolchain:x86_64_gcc4_cuda8"   :   ["//external:cudnn_x86_64_cuda8"],
        "//tools/toolchain:x86_64_gcc5_cuda8"   :   ["//external:cudnn_x86_64_cuda8"],
        "//conditions:default"                  :   [],
        }) + if_armv7(                              ["//external:cudnn_armv7"]
        ) + if_aarch64(                             ["//external:cudnn_aarch64"]
        ),
    visibility = ["//visibility:public"],
    )
