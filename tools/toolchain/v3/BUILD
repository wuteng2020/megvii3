package(default_visibility = ['//visibility:public'])

cc_toolchain_suite(
    name = 'toolchain',
    toolchains = {
        "k8|gcc": ":cc-compiler-v3",
        "k8|gcc_cuda": ":cc-compiler-v3-gpu",
        "tk1|gcc": ":cc-compiler-v3-tk1",
    },
)

filegroup(
    name = 'v3_all_files',
    srcs = [
        ':v3_compiler_files',
        ':v3_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_gpu_all_files',
    srcs = [
        ':v3_gpu_compiler_files',
        ':v3_gpu_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_tk1_all_files',
    srcs = [
        ':v3_tk1_compiler_files',
        ':v3_tk1_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3:gcc",
        "//tools/toolchain/v3/v3:ld",
        "//tools/toolchain/v3/v3:as",
    ],
)

filegroup(
    name = 'v3_gpu_compiler_files',
    srcs = [
        ":v3_compiler_files",
        "//tools/toolchain/v3/v3-gpu:gcc",
    ],
)

filegroup(
    name = 'v3_tk1_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1:gcc",
        "//tools/toolchain/v3/v3-tk1:ld",
        "//tools/toolchain/v3/v3-tk1:as",
    ],
)

filegroup(
    name = 'v3_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3:gcc",
        "//tools/toolchain/v3/v3:ld",
        "//tools/toolchain/v3/v3:ar",
        '//tools/toolchain/v3/v3:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_gpu_linker_files',
    srcs = [
        ":v3_linker_files",
        "//tools/toolchain/v3/v3-gpu:gcc",
    ],
)

filegroup(
    name = 'v3_tk1_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1:gcc",
        "//tools/toolchain/v3/v3-tk1:ld",
        "//tools/toolchain/v3/v3-tk1:ar",
        '//tools/toolchain/v3/v3-tk1:compiler_pieces',
    ],
)

cc_toolchain(
    name = 'cc-compiler-v3',
    all_files = ':v3_all_files',
    compiler_files = ':v3_compiler_files',
    cpu = 'k8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-gpu',
    all_files = ':v3_gpu_all_files',
    compiler_files = ':v3_gpu_compiler_files',
    cpu = 'k8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_gpu_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-tk1',
    all_files = ':v3_tk1_all_files',
    compiler_files = ':v3_tk1_compiler_files',
    cpu = 'tk1',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_tk1_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3:strip',
    supports_param_files = 1,
)
