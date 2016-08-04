package(default_visibility = ['//visibility:public'])

filegroup(
    name = 'gcc',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-gcc',
    ],
)

filegroup(
    name = 'g++',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-g++',
    ],
)

filegroup(
    name = 'ar',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-ar',
    ],
)

filegroup(
    name = 'as',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-as',
    ],
)

filegroup(
    name = 'cpp',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-cpp',
    ],
)

filegroup(
    name = 'gcov',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-gcov',
    ],
)

filegroup(
    name = 'ld',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-ld',
    ],
)

filegroup(
    name = 'nm',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-nm',
    ],
)

filegroup(
    name = 'objcopy',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-objcopy',
    ],
)

filegroup(
    name = 'objdump',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-objdump',
    ],
)

filegroup(
    name = 'strip',
    srcs = [
        'usr/bin/aarch64-tx1-linux-gnu-strip',
    ],
)

filegroup(
    name = 'compiler_pieces',
    srcs = glob([
        'usr/**',
        'lib/**',
        'lib64/**',
    ], exclude = [
        'usr/aarch64-tx1-linux-gnu/lib64/libstdc++.so*',
        'usr/aarch64-tx1-linux-gnu/lib64/libgomp.so*',
    ]),
)

