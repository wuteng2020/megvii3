package(default_visibility = ['//visibility:public'])

filegroup(
    name = 'compiler_pieces',
    srcs = glob([
        'include/**',
        'lib/**',
        'lib64/**',
    ], exclude = [
        "include/host_config.h",
        "include/cuda_runtime.h",
    ]) + [
        "generated/include/host_config.h",
        "generated/include/cuda_runtime.h",
    ],
)

genrule(
    name = 'fix_host_config',
    srcs = ["include/host_config.h"],
    outs = ["generated/include/host_config.h"],
    cmd = "sed 's/#error -- unsupported GNU version.*//g' $(location include/host_config.h) > $(@D)/host_config.h"
)

genrule(
    name = 'copy_cuda_runtime',
    srcs = ["include/cuda_runtime.h"],
    outs = ["generated/include/cuda_runtime.h"],
    cmd = "cp $(location include/cuda_runtime.h) $(@D)/cuda_runtime.h"
)
