root_prefix_dir = "external/opencv3_archive"

cc_library(
    name = "core",
    hdrs = glob([
        "include/**/*.h",
        "include/**/*.hpp",
        "modules/core/include/**/*.h",
        "modules/core/include/**/*.hpp",
        ]) + [
        ":configure",
        ":opencv_modules",
        ],
    srcs = glob([
        "modules/core/src/*.cpp",
        "modules/core/src/*.hpp",
        "modules/dynamicuda/include/**/*.hpp",
        ]) + [
        ":version_string",
        ":generated_files",
        ],
    includes = [
        "include/",
        "modules/core/include/",
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
        "modules/imgcodecs/include/**/*.h",
        "modules/imgcodecs/include/**/*.hpp",
        ]),
    srcs = glob([
        "modules/imgcodecs/src/*.cpp",
        "modules/imgcodecs/src/*.hpp",
        ]),
    includes = [
        "modules/imgcodecs/include/",
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
        "modules/videoio/include/**/*.h",
        "modules/videoio/include/**/*.hpp",
        ]),
    srcs = [
        "modules/videoio/src/" + filename for filename in videoio_srcs
        ] + glob([
        "modules/videoio/src/*.hpp",
        ]),
    includes = [
        "modules/videoio/include/",
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
        "modules/highgui/include/**/*.h",
        "modules/highgui/include/**/*.hpp",
        ]),
    srcs = glob([
        "modules/highgui/src/*.hpp",
        ]) + [
        "modules/highgui/src/window.cpp",
        ],
    includes = [
        "modules/highgui/include/",
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
        "include/cvconfig.h",
        ],
    cmd = "echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n' > $(@D)/cvconfig.h",
)

genrule(
    name = "version_string",
    outs = [
        "generated/version_string.inc",
        ],
    cmd = "echo '\"built by bazel\"' > $(@D)/version_string.inc",
)

genrule(
    name = "opencv_modules",
    outs = [
        "include/opencv2/opencv_modules.hpp",
        ],
    cmd = "echo -e '#define HAVE_OPENCV_CORE\n#define HAVE_OPENCV_IMGCODECS\n#define HAVE_OPENCV_IMGPROC\n' > $(@D)/opencv_modules.hpp",
)

genrule(
    name = "generated_files",
    outs = [
        "include/custom_hal.hpp",
        "include/opencl_kernels_core.hpp",
        "include/opencl_kernels_imgproc.hpp",
        "include/opencl_kernels_imgcodec.hpp",
        ],
    cmd = "touch $(@D)/%s/custom_hal.hpp; for x in $(@D)/%s/opencl_kernels_{core,imgproc,imgcodec}.hpp; do echo -e '#include \"opencv2/core/ocl.hpp\"\n#include \"opencv2/core/ocl_genbase.hpp\"\n#include \"opencv2/core/opencl/ocl_defs.hpp\"\n' > $$x; done" % ("include/", "include/"),
)

