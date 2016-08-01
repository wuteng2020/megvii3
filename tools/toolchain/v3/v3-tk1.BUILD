package(default_visibility = ['//visibility:public'])

filegroup(
    name = 'gcc',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-gcc',
    ],
)

filegroup(
    name = 'g++',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-g++',
    ],
)

filegroup(
    name = 'ar',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-ar',
    ],
)

filegroup(
    name = 'as',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-as',
    ],
)

filegroup(
    name = 'cpp',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-cpp',
    ],
)

filegroup(
    name = 'gcov',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-gcov',
    ],
)

filegroup(
    name = 'ld',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-ld',
    ],
)

filegroup(
    name = 'nm',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-nm',
    ],
)

filegroup(
    name = 'objcopy',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-objcopy',
    ],
)

filegroup(
    name = 'objdump',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-objdump',
    ],
)

filegroup(
    name = 'strip',
    srcs = [
        'usr/bin/armv7a-hardfloat-linux-gnueabi-strip',
    ],
)

filegroup(
    name = 'compiler_pieces',
    srcs = glob([
        'usr/**',
        'lib64/**',
    ], exclude = [
        'usr/armv7a-hardfloat-linux-gnueabi/lib64/libstdc++.so*',
        'usr/armv7a-hardfloat-linux-gnueabi/lib64/libgomp.so*',
    ]),
)

