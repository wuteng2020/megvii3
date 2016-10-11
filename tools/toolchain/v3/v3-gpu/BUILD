package(default_visibility = ['//tools/toolchain/v3:__pkg__'])

filegroup(
  name = 'gcc',
  srcs = [
    '//tools/toolchain/v3/v3:gcc',
    '//tools/toolchain/nvcc_wrapper:nvcc_wrapper',
    'crosstool_wrapper_driver_is_not_gcc',
    '@cuda_7_5_archive//:compiler_pieces',
    '@cuda_7_5_x86_64libs_archive//:compiler_pieces',
  ],
)
