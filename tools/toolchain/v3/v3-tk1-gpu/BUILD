package(default_visibility = ['//tools/toolchain/v3:__pkg__'])

filegroup(
  name = 'gcc',
  srcs = [
    '//tools/toolchain/v3/v3-tk1:gcc',
    'crosstool_wrapper_driver_is_not_gcc',
    '@cuda_6_5_archive//:compiler_pieces',
    '@cuda_6_5_armv7libs_archive//:compiler_pieces',
  ],
)
