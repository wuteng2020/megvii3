package(default_visibility = ['//tools/toolchain/v3:__pkg__'])

filegroup(
  name = 'gcc',
  srcs = [
    '//tools/toolchain/v3/v3-tx1:gcc',
    'crosstool_wrapper_driver_is_not_gcc',
    '@cuda_7_0_archive//:compiler_pieces',
    '@cuda_7_0_aarch64libs_archive//:compiler_pieces',
  ],
)
