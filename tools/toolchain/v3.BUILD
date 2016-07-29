package(default_visibility = ['//visibility:public'])

filegroup(
    name = 'gcc',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-gcc',
    ],
)

filegroup(
    name = 'g++',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-g++',
    ],
)

filegroup(
    name = 'ar',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-ar',
    ],
)

filegroup(
    name = 'as',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-as',
    ],
)

filegroup(
    name = 'cpp',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-cpp',
    ],
)

filegroup(
    name = 'gcov',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-gcov',
    ],
)

filegroup(
    name = 'ld',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-ld',
    ],
)

filegroup(
    name = 'nm',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-nm',
    ],
)

filegroup(
    name = 'objcopy',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-objcopy',
    ],
)

filegroup(
    name = 'objdump',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-objdump',
    ],
)

filegroup(
    name = 'strip',
    srcs = [
        'usr/bin/x86_64-megvii-linux-gnu-strip',
    ],
)

filegroup(
    name = 'compiler_pieces',
    srcs = glob([
        'usr/**',
        'lib64/**',
    ], exclude = [
        'usr/x86_64-megvii-linux-gnu/lib64/libstdc++.so*',
        'usr/x86_64-megvii-linux-gnu/lib64/libgomp.so*',
    ]),
)

