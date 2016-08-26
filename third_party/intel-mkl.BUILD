licenses(["reciprocal"])

cc_library(
    name = "intel-mkl",
    srcs = [
               "libmkl_core_sequential_intel_ilp64.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    visibility = ["//visibility:public"],
    defines = [
                "MKL_ILP64",
                ],
)

genrule(
    name = "merge_archives",
    srcs = [
        "lib/intel64_lin/libmkl_core.a",
        "lib/intel64_lin/libmkl_sequential.a",
        "lib/intel64_lin/libmkl_intel_ilp64.a",
        ],
    outs = [
        "libmkl_core_sequential_intel_ilp64.a",
        ],
    cmd = "echo -e 'create $(@D)/libmkl_core_sequential_intel_ilp64.a\\naddlib external/intel_mkl_archive/lib/intel64_lin/libmkl_core.a\\naddlib external/intel_mkl_archive/lib/intel64_lin/libmkl_sequential.a\\naddlib external/intel_mkl_archive/lib/intel64_lin/libmkl_intel_ilp64.a\\nsave\\nend\\n' | ar -M",   
)
