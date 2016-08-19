package(default_visibility = ['//visibility:public'])

cc_toolchain_suite(
    name = 'toolchain',
    toolchains = {
        "k8|gcc": ":cc-compiler-v3",
        "k8|gcc_cuda": ":cc-compiler-v3-gpu",
        "k8|gcc_cuda8": ":cc-compiler-v3-gpu-cuda8",
        "tk1|gcc": ":cc-compiler-v3-tk1",
        "tk1|gcc_cuda": ":cc-compiler-v3-tk1-gpu",
        "tx1|gcc": ":cc-compiler-v3-tx1",
        "tx1|gcc_cuda": ":cc-compiler-v3-tx1-gpu",
        "android_armv7|clang": ":cc-compiler-android-armv7",
        "android_aarch64|clang": ":cc-compiler-android-aarch64",
    },
)

filegroup(
    name = 'v3_all_files',
    srcs = [
        ':v3_compiler_files',
        ':v3_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
        '//tools/toolchain/v3/v3:strip',
    ],
)

filegroup(
    name = 'v3_gpu_all_files',
    srcs = [
        ':v3_gpu_compiler_files',
        ':v3_gpu_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
        '//tools/toolchain/v3/v3:strip',
    ],
)

filegroup(
    name = 'v3_gpu_cuda8_all_files',
    srcs = [
        ':v3_gpu_cuda8_compiler_files',
        ':v3_gpu_cuda8_linker_files',
        '//tools/toolchain/v3/v3:compiler_pieces',
        '//tools/toolchain/v3/v3:strip',
    ],
)

filegroup(
    name = 'v3_tk1_all_files',
    srcs = [
        ':v3_tk1_compiler_files',
        ':v3_tk1_linker_files',
        '//tools/toolchain/v3/v3-tk1:compiler_pieces',
        '//tools/toolchain/v3/v3-tk1:strip',
    ],
)

filegroup(
    name = 'v3_tk1_gpu_all_files',
    srcs = [
        ':v3_tk1_gpu_compiler_files',
        ':v3_tk1_gpu_linker_files',
        '//tools/toolchain/v3/v3-tk1:compiler_pieces',
        '//tools/toolchain/v3/v3-tk1:strip',
    ],
)

filegroup(
    name = 'v3_tx1_all_files',
    srcs = [
        ':v3_tx1_compiler_files',
        ':v3_tx1_linker_files',
        '//tools/toolchain/v3/v3-tx1:compiler_pieces',
        '//tools/toolchain/v3/v3-tx1:strip',
    ],
)

filegroup(
    name = 'v3_tx1_gpu_all_files',
    srcs = [
        ':v3_tx1_gpu_compiler_files',
        ':v3_tx1_gpu_linker_files',
        '//tools/toolchain/v3/v3-tx1:compiler_pieces',
        '//tools/toolchain/v3/v3-tx1:strip',
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
    name = 'v3_gpu_cuda8_compiler_files',
    srcs = [
        ":v3_compiler_files",
        "//tools/toolchain/v3/v3-gpu-cuda8:gcc",
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
    name = 'v3_tk1_gpu_compiler_files',
    srcs = [
        ":v3_tk1_compiler_files",
        "//tools/toolchain/v3/v3-tk1-gpu:gcc",
    ],
)

filegroup(
    name = 'v3_tx1_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-tx1:gcc",
        "//tools/toolchain/v3/v3-tx1:ld",
        "//tools/toolchain/v3/v3-tx1:as",
    ],
)

filegroup(
    name = 'v3_tx1_gpu_compiler_files',
    srcs = [
        ":v3_tx1_compiler_files",
        "//tools/toolchain/v3/v3-tx1-gpu:gcc",
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
    name = 'v3_gpu_cuda8_linker_files',
    srcs = [
        ":v3_linker_files",
        "//tools/toolchain/v3/v3-gpu-cuda8:gcc",
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

filegroup(
    name = 'v3_tk1_gpu_linker_files',
    srcs = [
        ":v3_tk1_linker_files",
        "//tools/toolchain/v3/v3-tk1-gpu:gcc",
    ],
)

filegroup(
    name = 'v3_tx1_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-tx1:gcc",
        "//tools/toolchain/v3/v3-tx1:ld",
        "//tools/toolchain/v3/v3-tx1:ar",
        '//tools/toolchain/v3/v3-tx1:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_tx1_gpu_linker_files',
    srcs = [
        ":v3_tx1_linker_files",
        "//tools/toolchain/v3/v3-tx1-gpu:gcc",
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
    name = 'cc-compiler-v3-gpu-cuda8',
    all_files = ':v3_gpu_cuda8_all_files',
    compiler_files = ':v3_gpu_cuda8_compiler_files',
    cpu = 'k8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_gpu_cuda8_linker_files',
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
    objcopy_files = '//tools/toolchain/v3/v3-tk1:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tk1:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-tk1-gpu',
    all_files = ':v3_tk1_gpu_all_files',
    compiler_files = ':v3_tk1_gpu_compiler_files',
    cpu = 'tk1',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_tk1_gpu_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-tk1:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tk1:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-tx1',
    all_files = ':v3_tx1_all_files',
    compiler_files = ':v3_tx1_compiler_files',
    cpu = 'tx1',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_tx1_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-tx1:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tx1:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-tx1-gpu',
    all_files = ':v3_tx1_gpu_all_files',
    compiler_files = ':v3_tx1_gpu_compiler_files',
    cpu = 'tx1',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_tx1_gpu_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-tx1:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tx1:strip',
    supports_param_files = 1,
)

filegroup(
    name = 'android_armv7_all_files',
    srcs = [
        ':android_armv7_compiler_files',
        ':android_armv7_linker_files',
        '//tools/toolchain/v3/ndk-armv7:compiler_pieces',
        '//tools/toolchain/v3/ndk-armv7:strip',
    ],
)

filegroup(
    name = 'android_armv7_compiler_files',
    srcs = [
        "//tools/toolchain/v3/ndk-armv7:gcc",
        "//tools/toolchain/v3/ndk-armv7:ld",
        "//tools/toolchain/v3/ndk-armv7:as",
    ],
)

filegroup(
    name = 'android_armv7_linker_files',
    srcs = [
        "//tools/toolchain/v3/ndk-armv7:gcc",
        "//tools/toolchain/v3/ndk-armv7:ld",
        "//tools/toolchain/v3/ndk-armv7:ar",
        '//tools/toolchain/v3/ndk-armv7:compiler_pieces',
    ],
)

filegroup(
    name = 'android_aarch64_all_files',
    srcs = [
        ':android_aarch64_compiler_files',
        ':android_aarch64_linker_files',
        '//tools/toolchain/v3/ndk-aarch64:compiler_pieces',
        '//tools/toolchain/v3/ndk-aarch64:strip',
    ],
)

filegroup(
    name = 'android_aarch64_compiler_files',
    srcs = [
        "//tools/toolchain/v3/ndk-aarch64:gcc",
        "//tools/toolchain/v3/ndk-aarch64:ld",
        "//tools/toolchain/v3/ndk-aarch64:as",
    ],
)

filegroup(
    name = 'android_aarch64_linker_files',
    srcs = [
        "//tools/toolchain/v3/ndk-aarch64:gcc",
        "//tools/toolchain/v3/ndk-aarch64:ld",
        "//tools/toolchain/v3/ndk-aarch64:ar",
        '//tools/toolchain/v3/ndk-aarch64:compiler_pieces',
    ],
)

cc_toolchain(
    name = 'cc-compiler-android-armv7',
    all_files = ':android_armv7_all_files',
    compiler_files = ':android_armv7_compiler_files',
    cpu = 'android-armv7',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':android_armv7_linker_files',
    objcopy_files = '//tools/toolchain/v3/ndk-armv7:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ndk-armv7:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-android-aarch64',
    all_files = ':android_aarch64_all_files',
    compiler_files = ':android_aarch64_compiler_files',
    cpu = 'android-aarch64',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':android_aarch64_linker_files',
    objcopy_files = '//tools/toolchain/v3/ndk-aarch64:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ndk-aarch64:strip',
    supports_param_files = 1,
)
