package(default_visibility = ['//visibility:public'])

cc_toolchain_suite(
    name = 'toolchain',
    toolchains = {
        "k8|gcc": ":cc-compiler-v3-gcc5",
        "k8|gcc_cuda": ":cc-compiler-v3-gcc5-gpu-cuda8",
        "k8_gcc4|gcc": ":cc-compiler-v3",
        "k8_gcc4|gcc_cuda": ":cc-compiler-v3-gpu",
        "k8_gcc4_cuda8|gcc_cuda": ":cc-compiler-v3-gpu-cuda8",
        "piii|gcc": ":cc-compiler-v3-piii",
        "windows_x86_32|xclang": ":cc-compiler-v3-windows-x86-32-xclang",
        "windows_x86_64|xclang": ":cc-compiler-v3-windows-x86-64-xclang",
	    "windows_x86_64_cuda|xclang_cuda": ":cc-compiler-v3-windows-x86-64-xclang-cuda8",
        "tk1|gcc": ":cc-compiler-v3-tk1",
        "tk1|gcc_cuda": ":cc-compiler-v3-tk1-gpu",
        "c3s|gcc": ":cc-compiler-v3-c3s",
        "tx1|gcc": ":cc-compiler-v3-tx1",
        "tx1|gcc_cuda": ":cc-compiler-v3-tx1-gpu",
        "android_armv7|clang": ":cc-compiler-android-armv7",
        "android_aarch64|clang": ":cc-compiler-android-aarch64",
        "android_piii|clang": ":cc-compiler-android-piii",
        "android_piii_sse3|clang": ":cc-compiler-android-piii-sse3",
        "ios_armv7|clang": ":cc-compiler-ios-armv7",
        "ios_aarch64|clang": ":cc-compiler-ios-aarch64",
    },
)

filegroup(
    name = 'toolchain_files',
    srcs = select({
        "//tools/toolchain:linux_x86_64_gcc4":      [":v3_all_files"],
        "//tools/toolchain:linux_x86_64_gcc4_cuda7":[":v3_gpu_all_files"],
        "//tools/toolchain:linux_x86_64_gcc4_cuda8":[":v3_gpu_cuda8_all_files"],
        "//tools/toolchain:linux_x86_64_gcc5":      [":v3_gcc5_all_files"],
        "//tools/toolchain:linux_x86_64_gcc5_cuda8":[":v3_gcc5_gpu_cuda8_all_files"],
        "//tools/toolchain:linux_x86_32":           [":v3_piii_all_files"],
        "//tools/toolchain:windows_x86_64_xclang":   [":v3_windows_all_files"],
        "//tools/toolchain:windows_x86_64_xclang_cuda8":   [":v3_windows_all_files"],
        "//tools/toolchain:windows_x86_32_xclang":   [":v3_windows_all_files"],
        "//tools/toolchain:tk1_gcc":                [":v3_tk1_all_files"],
        "//tools/toolchain:tk1_gcc_cuda":           [":v3_tk1_gpu_all_files"],
        "//tools/toolchain:c3s_gcc":                [":v3_tk1_all_files"],
        "//tools/toolchain:tx1_gcc":                [":v3_tx1_all_files"],
        "//tools/toolchain:tx1_gcc_cuda":           [":v3_tx1_gpu_all_files"],
        "//tools/toolchain:android_armv7":          [":android_armv7_all_files"],
        "//tools/toolchain:android_aarch64":        [":android_aarch64_all_files"],
        "//tools/toolchain:android_x86_32":         [":android_piii_all_files"],
        "//tools/toolchain:android_x86_32_sse3":    [":android_piii_all_files"],
        "//tools/toolchain:ios_armv7":              [":ios_arm_all_files"],
        "//tools/toolchain:ios_aarch64":            [":ios_arm_all_files"],
        }),
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
    name = 'v3_gcc5_all_files',
    srcs = [
        ':v3_gcc5_compiler_files',
        ':v3_gcc5_linker_files',
        '//tools/toolchain/v3/v3-gcc5:compiler_pieces',
        '//tools/toolchain/v3/v3-gcc5:strip',
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
    name = 'v3_gcc5_gpu_cuda8_all_files',
    srcs = [
        ':v3_gcc5_gpu_cuda8_compiler_files',
        ':v3_gcc5_gpu_cuda8_linker_files',
        '//tools/toolchain/v3/v3-gcc5:compiler_pieces',
        '//tools/toolchain/v3/v3-gcc5:strip',
    ],
)

filegroup(
    name = 'v3_piii_all_files',
    srcs = [
        ':v3_piii_compiler_files',
        ':v3_piii_linker_files',
        '//tools/toolchain/v3/v3-piii:compiler_pieces',
        '//tools/toolchain/v3/v3-piii:strip',
    ],
)

filegroup(
    name = 'v3_windows_all_files',
    srcs = [
        ':v3_windows_compiler_files',
        ':v3_windows_linker_files',
    ],
	)

filegroup(
    name = 'v3_tk1_all_files',
    srcs = [
        ':v3_tk1_compiler_files',
        ':v3_tk1_linker_files',
        '//tools/toolchain/v3/v3-tk1-gcc5:compiler_pieces',
        '//tools/toolchain/v3/v3-tk1-gcc5:strip',
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
    name = 'v3_gcc5_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-gcc5:gcc",
        "//tools/toolchain/v3/v3-gcc5:ld",
        "//tools/toolchain/v3/v3-gcc5:as",
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
    name = 'v3_gcc5_gpu_cuda8_compiler_files',
    srcs = [
        ":v3_gcc5_compiler_files",
        "//tools/toolchain/v3/v3-gcc5-gpu-cuda8:gcc",
    ],
)

filegroup(
    name = 'v3_piii_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-piii:gcc",
        "//tools/toolchain/v3/v3-piii:ld",
        "//tools/toolchain/v3/v3-piii:as",
    ],
)

filegroup(
    name = 'v3_windows_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-windows:gcc",
        "//tools/toolchain/v3/v3-windows:ld",
        "//tools/toolchain/v3/v3-windows:as",
    ],
)

filegroup(
    name = 'v3_tk1_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1-gcc5:gcc",
        "//tools/toolchain/v3/v3-tk1-gcc5:ld",
        "//tools/toolchain/v3/v3-tk1-gcc5:as",
    ],
)

filegroup(
    name = 'v3_tk1_gpu_compiler_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1:gcc",
        "//tools/toolchain/v3/v3-tk1:ld",
        "//tools/toolchain/v3/v3-tk1:as",
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
    name = 'v3_gcc5_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-gcc5:gcc",
        "//tools/toolchain/v3/v3-gcc5:ld",
        "//tools/toolchain/v3/v3-gcc5:ar",
        '//tools/toolchain/v3/v3-gcc5:compiler_pieces',
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
    name = 'v3_gcc5_gpu_cuda8_linker_files',
    srcs = [
        ":v3_gcc5_linker_files",
        "//tools/toolchain/v3/v3-gcc5-gpu-cuda8:gcc",
    ],
)

filegroup(
    name = 'v3_piii_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-piii:gcc",
        "//tools/toolchain/v3/v3-piii:ld",
        "//tools/toolchain/v3/v3-piii:ar",
        '//tools/toolchain/v3/v3-piii:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_windows_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-windows:gcc",
        "//tools/toolchain/v3/v3-windows:ld",
        "//tools/toolchain/v3/v3-windows:ar",
        "//tools/toolchain/v3/v3-windows:strip",
        '//tools/toolchain/v3/v3-windows:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_tk1_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1-gcc5:gcc",
        "//tools/toolchain/v3/v3-tk1-gcc5:ld",
        "//tools/toolchain/v3/v3-tk1-gcc5:ar",
        '//tools/toolchain/v3/v3-tk1-gcc5:compiler_pieces',
    ],
)

filegroup(
    name = 'v3_tk1_gpu_linker_files',
    srcs = [
        "//tools/toolchain/v3/v3-tk1:gcc",
        "//tools/toolchain/v3/v3-tk1:ld",
        "//tools/toolchain/v3/v3-tk1:ar",
        '//tools/toolchain/v3/v3-tk1:compiler_pieces',
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
    cpu = 'k8-gcc4',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-gcc5',
    all_files = ':v3_gcc5_all_files',
    compiler_files = ':v3_gcc5_compiler_files',
    cpu = 'k8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_gcc5_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-gcc5:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-gcc5:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-gpu',
    all_files = ':v3_gpu_all_files',
    compiler_files = ':v3_gpu_compiler_files',
    cpu = 'k8-gcc4',
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
    cpu = 'k8-gcc4-cuda8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_gpu_cuda8_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-gcc5-gpu-cuda8',
    all_files = ':v3_gcc5_gpu_cuda8_all_files',
    compiler_files = ':v3_gcc5_gpu_cuda8_compiler_files',
    cpu = 'k8',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_gcc5_gpu_cuda8_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-gcc5:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-gcc5:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-piii',
    all_files = ':v3_piii_all_files',
    compiler_files = ':v3_piii_compiler_files',
    cpu = 'piii',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_piii_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-piii:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-piii:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-windows-x86-64-xclang',
    all_files = ':v3_windows_all_files',
    compiler_files = ':v3_windows_compiler_files',
    cpu = 'windows_x86_64',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_windows_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-windows:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-windows:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-windows-x86-64-xclang-cuda8',
    all_files = ':v3_windows_all_files',
    compiler_files = ':v3_windows_compiler_files',
    cpu = 'windows_x86_64_cuda',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_windows_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-windows:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-windows:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-windows-x86-32-xclang',
    all_files = ':v3_windows_all_files',
    compiler_files = ':v3_windows_compiler_files',
    cpu = 'windows_x86_32',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_windows_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-windows:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-windows:strip',
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
    objcopy_files = '//tools/toolchain/v3/v3-tk1-gcc5:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tk1-gcc5:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-v3-c3s',
    all_files = ':v3_tk1_all_files',
    compiler_files = ':v3_tk1_compiler_files',
    cpu = 'c3s',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':v3_tk1_linker_files',
    objcopy_files = '//tools/toolchain/v3/v3-tk1-gcc5:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/v3-tk1-gcc5:strip',
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

filegroup(
    name = 'android_piii_all_files',
    srcs = [
        ':android_piii_compiler_files',
        ':android_piii_linker_files',
        '//tools/toolchain/v3/ndk-piii:compiler_pieces',
        '//tools/toolchain/v3/ndk-piii:strip',
    ],
)

filegroup(
    name = 'android_piii_compiler_files',
    srcs = [
        "//tools/toolchain/v3/ndk-piii:gcc",
        "//tools/toolchain/v3/ndk-piii:ld",
        "//tools/toolchain/v3/ndk-piii:as",
    ],
)

filegroup(
    name = 'android_piii_linker_files',
    srcs = [
        "//tools/toolchain/v3/ndk-piii:gcc",
        "//tools/toolchain/v3/ndk-piii:ld",
        "//tools/toolchain/v3/ndk-piii:ar",
        '//tools/toolchain/v3/ndk-piii:compiler_pieces',
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

cc_toolchain(
    name = 'cc-compiler-android-piii',
    all_files = ':android_piii_all_files',
    compiler_files = ':android_piii_compiler_files',
    cpu = 'android-piii',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':android_piii_linker_files',
    objcopy_files = '//tools/toolchain/v3/ndk-piii:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ndk-piii:strip',
    supports_param_files = 1,
)

cc_toolchain(
    name = 'cc-compiler-android-piii-sse3',
    all_files = ':android_piii_all_files',
    compiler_files = ':android_piii_compiler_files',
    cpu = 'android-piii',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':android_piii_linker_files',
    objcopy_files = '//tools/toolchain/v3/ndk-piii:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ndk-piii:strip',
    supports_param_files = 1,
)

filegroup(
    name = 'ios_arm_all_files',
    srcs = [
        ':ios_arm_compiler_files',
        ':ios_arm_linker_files',
        '//tools/toolchain/v3/ios-arm:compiler_pieces',
        '//tools/toolchain/v3/ios-arm:strip',
    ],
)

filegroup(
    name = 'ios_arm_compiler_files',
    srcs = [
        "//tools/toolchain/v3/ios-arm:gcc",
        "//tools/toolchain/v3/ios-arm:ld",
        "//tools/toolchain/v3/ios-arm:as",
    ],
)

filegroup(
    name = 'ios_arm_linker_files',
    srcs = [
        "//tools/toolchain/v3/ios-arm:gcc",
        "//tools/toolchain/v3/ios-arm:ld",
        "//tools/toolchain/v3/ios-arm:ar",
        '//tools/toolchain/v3/ios-arm:compiler_pieces',
    ],
)

cc_toolchain(
    name = 'cc-compiler-ios-armv7',
    all_files = ':ios_arm_all_files',
    compiler_files = ':ios_arm_compiler_files',
    cpu = 'ios-armv7',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':ios_arm_linker_files',
    objcopy_files = '//tools/toolchain/v3/ios-arm:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ios-arm:strip',
    supports_param_files = 0,
)

cc_toolchain(
    name = 'cc-compiler-ios-aarch64',
    all_files = ':ios_arm_all_files',
    compiler_files = ':ios_arm_compiler_files',
    cpu = 'ios-aarch64',
    dwp_files = ':empty',
    dynamic_runtime_libs = [':empty'],
    linker_files = ':ios_arm_linker_files',
    objcopy_files = '//tools/toolchain/v3/ios-arm:objcopy',
    static_runtime_libs = [':empty'],
    strip_files = '//tools/toolchain/v3/ios-arm:strip',
    supports_param_files = 0,
)
