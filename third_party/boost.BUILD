package(default_visibility = ["//visibility:public"])

cc_library(
    name = "boost",
    hdrs = glob([
        "boost/**/*.hpp",
        "boost/**/*.h",
        "boost/**/*.ipp",
    ]),
    includes = [
        ".",
    ],
)

sub_libraries = [
    "date_time",
    "filesystem",
    "system",
    ]

sub_libraries_deps = {
    "filesystem": [":system"],
    }

[cc_library(
    name = sub,
    srcs = glob([
        "libs/%s/src/**/*.cpp" % sub,
        "libs/%s/src/**/*.hpp" % sub,
        "libs/%s/src/**/*.h" % sub,
        "libs/%s/src/**/*.ipp" % sub,
        ]),
    deps = [
        ":boost",
    ] + (sub_libraries_deps[sub] if sub in sub_libraries_deps else []),
) for sub in sub_libraries]

cc_library(
    name = "thread",
    srcs = glob([
        "libs/thread/src/*.cpp",
        "libs/thread/src/pthread/once.cpp",
        "libs/thread/src/pthread/thread.cpp",
        ]),
    hdrs = [
        "libs/thread/src/pthread/once_atomic.cpp"
        ],
    deps = [
        ":boost",
        ":system",
        ],
    copts = [
        "-Iexternal/boost_archive/libs/thread/src/pthread",
        ],
    defines = [
        "BOOST_THREAD_VERSION=4",
        ],
    )
