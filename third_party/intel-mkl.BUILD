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
               "libmkl_core_sequential_intel_ilp64.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
    defines = [
                "MKL_ILP64",
                ],
)

genrule(
    name = "merge_archives-64",
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

cc_library(
    name = "intel-mkl-32",
    srcs = [
               "libmkl_core_sequential_intel_32.a",
           ],
    includes = [
            "include",
            ],
    hdrs = glob(["include/*.h"]),
)

genrule(
    name = "merge_archives-32",
    srcs = [
        "lib/ia32_lin/libmkl_core.a",
        "lib/ia32_lin/libmkl_sequential.a",
        "lib/ia32_lin/libmkl_intel.a",
        ],
    outs = [
        "libmkl_core_sequential_intel_32.a",
        ],
    cmd = "echo -e 'create $(@D)/libmkl_core_sequential_intel_32.a\\naddlib external/intel_mkl_archive/lib/ia32_lin/libmkl_core.a\\naddlib external/intel_mkl_archive/lib/ia32_lin/libmkl_sequential.a\\naddlib external/intel_mkl_archive/lib/ia32_lin/libmkl_intel.a\\nsave\\nend\\n' | ar -M",   
)
