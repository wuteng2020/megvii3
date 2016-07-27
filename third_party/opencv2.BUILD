prefix_dir = "opencv-2.4.13"
root_prefix_dir = "external/opencv2_archive/" + prefix_dir

genrule(
    name = "configure",
    srcs = glob(
        ["**/*"],
    ),
    outs = [
        prefix_dir + "/include/cvconfig.h",
        ],
    cmd = "echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n' > $(@D)/cvconfig.h",
)

genrule(
    name = "version_string",
    outs = [
        prefix_dir + "/version_string/version_string.inc",
        ],
    cmd = "echo '\"built by bazel\"' > $(@D)/version_string.inc",
)

cc_library(
    name = "core",
    hdrs = glob([
        prefix_dir + "/include/**/*.h",
        prefix_dir + "/include/**/*.hpp",
        prefix_dir + "/modules/core/include/**/*.h",
        prefix_dir + "/modules/core/include/**/*.hpp",
        ]) + [
        ":configure",
        ":version_string",
        ],
    srcs = glob([
        prefix_dir + "/modules/core/src/*.cpp",
        prefix_dir + "/modules/core/src/*.hpp",
        prefix_dir + "/modules/dynamicuda/include/**/*.hpp",
        ]),
    includes = [
        prefix_dir + "/include/",
        prefix_dir + "/modules/core/include/",
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
        prefix_dir + "/modules/imgproc/include/**/*.h",
        prefix_dir + "/modules/imgproc/include/**/*.hpp",
        ]),
    srcs = glob([
        prefix_dir + "/modules/imgproc/src/*.cpp",
        prefix_dir + "/modules/imgproc/src/**/*.hpp",
        prefix_dir + "/modules/imgproc/src/*.h",
        ]),
    includes = [
        prefix_dir + "/modules/imgproc/include/",
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
        prefix_dir + "/modules/highgui/include/**/*.h",
        prefix_dir + "/modules/highgui/include/**/*.hpp",
        ]),
    srcs = [
        prefix_dir + "/modules/highgui/src/" + filename for filename in highgui_srcs
        ] + glob([
        prefix_dir + "/modules/highgui/src/*.hpp",
        ]),
    includes = [
        prefix_dir + "/modules/highgui/include/",
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
