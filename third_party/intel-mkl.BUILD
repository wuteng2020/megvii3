licenses(["reciprocal"])

cc_library(
    name = "intel-mkl",
    deps = if_x86_64([
        ":intel-mkl-64",
        ]) + if_x86_32([
        ":intel-mkl-32",
        ]),
    visibility = ["//visibility:public"],
    )

cc_library(
    name = "intel-mkl-64",
    srcs = [
               "lib/intel64_lin/libmkl_core_sequential_intel_ilp64.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    defines = [
                "MKL_ILP64",
                ],
)

#The following code were used for merging static libraries but we now use pre-merged ones.

# Refer to ./utils/ar_mkl.BUILD

cc_library(
    name = "intel-mkl-32",
    srcs = [
               "lib/ia32_lin/libmkl_core_sequential_intel_32.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    deps = [
        "@//third_party/intel-mkl:workarounds",
        ],
)

#The following code were used for merging static libraries but we now use pre-merged ones.

# Refer to ./utils/ar_mkl.BUILD
