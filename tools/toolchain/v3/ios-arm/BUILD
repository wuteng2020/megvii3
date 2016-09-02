package(default_visibility = [
        '//tools/toolchain/v3:__pkg__',
        ])

filegroup(
  name = 'ar',
  srcs = [
    '@toolchain_v3_cctools_archive//:ar',
    'ios-ar',
  ],
)

filegroup(
  name = 'as',
  srcs = [
    '@toolchain_v3_cctools_archive//:as',
    'ios-as',
  ],
)

filegroup(
  name = 'cpp',
  srcs = [
    'ios-cpp',
  ],
)

filegroup(
  name = 'gcc',
  srcs = [
    '@toolchain_v3_clang_archive//:clang',
    'ios-gcc',
  ],
)

filegroup(
  name = 'g++',
  srcs = [
    '@toolchain_v3_clang_archive//:clang++',
    'ios-g++',
  ],
)

filegroup(
  name = 'gcov',
  srcs = [
    'ios-gcov',
  ],
)

filegroup(
  name = 'ld',
  srcs = [
    '@toolchain_v3_cctools_archive//:ld',
    'ios-ld',
  ],
)

filegroup(
  name = 'objcopy',
  srcs = [
    'ios-objcopy',
  ],
)

filegroup(
  name = 'objdump',
  srcs = [
    'ios-objdump',
  ],
)

filegroup(
  name = 'strip',
  srcs = [
    '@toolchain_v3_cctools_archive//:strip',
    'ios-strip',
  ],
)

filegroup(
    name = 'compiler_pieces',
    srcs = [
    '@toolchain_v3_cctools_archive//:compiler_pieces',
    '@toolchain_v3_clang_archive//:compiler_pieces',
    '@toolchain_v3_xar_archive//:compiler_pieces',
    '@ios_sdk_7_archive//:compiler_pieces',
    ],
)
