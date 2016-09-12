package(default_visibility = ['//tools/toolchain/v3:__pkg__'])

filegroup(
  name = 'gcc',
  srcs = [
    '//tools/toolchain/v3/v3-gcc5:gcc',
    'crosstool_wrapper_driver_is_not_gcc',
    '@cuda_8_0_archive//:compiler_pieces',
    '@cuda_8_0_x86_64libs_archive//:compiler_pieces',
  ],
)
