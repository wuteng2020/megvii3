root_prefix_dir = "external/opencv2_archive/"

genrule(
    name = "configure",
    srcs = glob(
        ["**/*"],
    ),
    outs = [
        "include/cvconfig.h",
        ],
    cmd = "echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n' > $(@D)/cvconfig.h",
)

genrule(
    name = "version_string",
    outs = [
        "version_string/version_string.inc",
        ],
    cmd = "echo '\"built by bazel\"' > $(@D)/version_string.inc",
)

cc_library(
    name = "core",
    hdrs = glob([
        "include/**/*.h",
        "include/**/*.hpp",
        "modules/core/include/**/*.h",
        "modules/core/include/**/*.hpp",
        ]) + [
        ":configure",
        ":version_string",
        ],
    srcs = glob([
        "modules/core/src/*.cpp",
        "modules/core/src/*.hpp",
        "modules/dynamicuda/include/**/*.hpp",
        ]),
    includes = [
        "include/",
        "modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-I" + root_prefix_dir + "/modules/dynamicuda/include/",
        "-I$(GENDIR)/" + root_prefix_dir + "/version_string/",
        ],
    visibility = ["//visibility:public"],
    deps = [
        "@zlib_archive//:zlib",
        "@jpeg_archive//:jpeg",
        "@png_archive//:png",
        ],
)

cc_library(
    name = "imgproc",
    hdrs = glob([
        "modules/imgproc/include/**/*.h",
        "modules/imgproc/include/**/*.hpp",
        ]),
    srcs = glob([
        "modules/imgproc/src/*.cpp",
        "modules/imgproc/src/**/*.hpp",
        "modules/imgproc/src/*.h",
        ]),
    includes = [
        "modules/imgproc/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/imgproc/src/",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ],
)

highgui_srcs = [
    "cap.cpp",
    "cap_images.cpp",
    "loadsave.cpp",
    "utils.cpp",
    "window.cpp",
    "grfmt_base.cpp",
    "grfmt_jpeg.cpp",
    "grfmt_png.cpp",
    "grfmt_imageio.cpp",
    ]

cc_library(
    name = "highgui",
    hdrs = glob([
        "modules/highgui/include/**/*.h",
        "modules/highgui/include/**/*.hpp",
        ]),
    srcs = [
        "modules/highgui/src/" + filename for filename in highgui_srcs
        ] + glob([
        "modules/highgui/src/*.hpp",
        ]),
    includes = [
        "modules/highgui/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/highgui/src/",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":imgproc",
        ":core",
        ],
)
