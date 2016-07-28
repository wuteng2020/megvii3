licenses(["reciprocal"])

cc_library(
    name = "intel-mkl",
    srcs = [
               "lib/intel64_lin/libmkl_core.a",
               "lib/intel64_lin/libmkl_sequential.a",
               "lib/intel64_lin/libmkl_intel_ilp64.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    visibility = ["//visibility:public"],
    linkopts = [
                "-Wl,--start-group",
                "lib/intel64_lin/libmkl_core.a",
                "lib/intel64_lin/libmkl_sequential.a",
                "lib/intel64_lin/libmkl_intel_ilp64.a",
                "-Wl,--end-group",
                "-ldl",
                ],
    defines = [
                "MKL_ILP64",
                ],
)
