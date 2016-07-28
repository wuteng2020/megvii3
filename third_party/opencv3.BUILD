prefix_dir = "opencv-3.1.0"
root_prefix_dir = "external/opencv3_archive/" + prefix_dir

cc_library(
    name = "core",
    hdrs = glob([
        prefix_dir + "/include/**/*.h",
        prefix_dir + "/include/**/*.hpp",
        prefix_dir + "/modules/core/include/**/*.h",
        prefix_dir + "/modules/core/include/**/*.hpp",
        ]) + [
        ":configure",
        ":opencv_modules",
        ],
    srcs = glob([
        prefix_dir + "/modules/core/src/*.cpp",
        prefix_dir + "/modules/core/src/*.hpp",
        prefix_dir + "/modules/dynamicuda/include/**/*.hpp",
        ]) + [
        ":version_string",
        ":generated_files",
        ],
    includes = [
        prefix_dir + "/include/",
        prefix_dir + "/modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-I" + root_prefix_dir + "/modules/dynamicuda/include/",
        "-I$(GENDIR)/" + root_prefix_dir + "/generated/",
        "-D__OPENCV_BUILD=1",
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
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ],
)

cc_library(
    name = "imgcodecs",
    hdrs = glob([
        prefix_dir + "/modules/imgcodecs/include/**/*.h",
        prefix_dir + "/modules/imgcodecs/include/**/*.hpp",
        ]),
    srcs = glob([
        prefix_dir + "/modules/imgcodecs/src/*.cpp",
        prefix_dir + "/modules/imgcodecs/src/*.hpp",
        ]),
    includes = [
        prefix_dir + "/modules/imgcodecs/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/imgcodecs/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":imgproc",
        ":core",
        ],
)

videoio_srcs = [
    "cap.cpp",
    "cap_images.cpp",
    "cap_mjpeg_encoder.cpp",
    "cap_mjpeg_decoder.cpp",
    ]

cc_library(
    name = "videoio",
    hdrs = glob([
        prefix_dir + "/modules/videoio/include/**/*.h",
        prefix_dir + "/modules/videoio/include/**/*.hpp",
        ]),
    srcs = [
        prefix_dir + "/modules/videoio/src/" + filename for filename in videoio_srcs
        ] + glob([
        prefix_dir + "/modules/videoio/src/*.hpp",
        ]),
    includes = [
        prefix_dir + "/modules/videoio/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/videoio/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":imgcodecs",
        ":core",
        ],
)

cc_library(
    name = "highgui",
    hdrs = glob([
        prefix_dir + "/modules/highgui/include/**/*.h",
        prefix_dir + "/modules/highgui/include/**/*.hpp",
        ]),
    srcs = glob([
        prefix_dir + "/modules/highgui/src/*.hpp",
        ]) + [
        prefix_dir + "/modules/highgui/src/window.cpp",
        ],
    includes = [
        prefix_dir + "/modules/highgui/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/highgui/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":imgcodecs",
        ":videoio",
        ":core",
        ],
)

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
        prefix_dir + "/generated/version_string.inc",
        ],
    cmd = "echo '\"built by bazel\"' > $(@D)/version_string.inc",
)

genrule(
    name = "opencv_modules",
    outs = [
        prefix_dir + "/include/opencv2/opencv_modules.hpp",
        ],
    cmd = "echo -e '#define HAVE_OPENCV_CORE\n#define HAVE_OPENCV_IMGCODECS\n#define HAVE_OPENCV_IMGPROC\n' > $(@D)/opencv_modules.hpp",
)

genrule(
    name = "generated_files",
    outs = [
        prefix_dir + "/include/custom_hal.hpp",
        prefix_dir + "/include/opencl_kernels_core.hpp",
        prefix_dir + "/include/opencl_kernels_imgproc.hpp",
        prefix_dir + "/include/opencl_kernels_imgcodec.hpp",
        ],
    cmd = "touch $(@D)/%s/custom_hal.hpp; for x in $(@D)/%s/opencl_kernels_{core,imgproc,imgcodec}.hpp; do echo -e '#include \"opencv2/core/ocl.hpp\"\n#include \"opencv2/core/ocl_genbase.hpp\"\n#include \"opencv2/core/opencl/ocl_defs.hpp\"\n' > $$x; done" % (prefix_dir + "/include/", prefix_dir + "/include/"),
)

