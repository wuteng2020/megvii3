root_prefix_dir = "external/opencv3_archive"

cc_library(
    name = "headers",
    hdrs = glob([
        "include/**/*.h",
        "include/**/*.hpp",
        "modules/*/include/**/*.h",
        "modules/*/include/**/*.hpp",
        ]) + [
        ":configure",
        ],
    includes = [
        "include/",
        ] + glob([
        "modules/*/include",
        ], exclude_directories=0),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "core",
    hdrs = [
        ":opencv_modules",
        ],
    srcs = glob([
        "modules/core/src/*.cpp",
        "modules/core/src/*.hpp",
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
        "-I$(GENDIR)/" + root_prefix_dir + "/generated/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        "//:headers",
        "//:core_cu",
        "@zlib_archive//:zlib",
        "@jpeg_archive//:jpeg",
        "@png_archive//:png",
        ],
)

cc_library(
    name = "core_cu",
    hdrs = [
        ":opencv_modules",
        ],
    srcs = if_cuda(glob([
        "modules/core/src/cuda/*",
        ]) + [
        ":version_string",
        ":generated_files",
        ]),
    includes = [
        "include/",
        "modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-I$(GENDIR)/" + root_prefix_dir + "/generated/",
        "-D__OPENCV_BUILD=1",
        ],
    deps = [
        "//:headers",
        "//external:thrust",
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

cc_library(
    name = "photo",
    hdrs = glob([
        "modules/photo/include/**/*.h",
        "modules/photo/include/**/*.hpp",
        ]),
    srcs = glob([
        "modules/photo/src/*.cpp",
        "modules/photo/src/*.hpp",
        ]),
    includes = [
        "modules/photo/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/photo/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":imgproc",
        ":core",
        ],
)

cc_library(
    name = "cudaimgproc",
    hdrs = glob([
        "modules/cudaimgproc/include/**/*.h",
        "modules/cudaimgproc/include/**/*.hpp",
        ]),
    srcs = if_cuda(glob([
        "modules/cudaimgproc/src/*.cpp",
        "modules/cudaimgproc/src/*.hpp",
        "modules/cudaimgproc/src/*.h",
        ])),
    includes = [
        "modules/cudaimgproc/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudaimgproc/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "cudaimgproc_cu",
        ],
)

cc_library(
    name = "cudaimgproc_cu",
    hdrs = glob([
        "modules/cudaimgproc/include/**/*.h",
        "modules/cudaimgproc/include/**/*.hpp",
        ]),
    srcs = if_cuda(glob([
        "modules/cudaimgproc/src/cuda/*.cu",
        "modules/cudaimgproc/src/cuda/*.h",
        "modules/cudaimgproc/src/*.h",
        ])),
    includes = [
        "modules/cudaimgproc/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudaimgproc/src/",
        "-D__OPENCV_BUILD=1",
        "-std=c++03",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ],
)

cc_library(
    name = "cudabgsegm",
    hdrs = glob([
        "modules/cudabgsegm/include/**/*.h",
        "modules/cudabgsegm/include/**/*.hpp",
        ]),
    srcs = if_cuda(glob([
        "modules/cudabgsegm/src/*.cpp",
        "modules/cudabgsegm/src/*.hpp",
        "modules/cudabgsegm/src/*.h",
        ])),
    includes = [
        "modules/cudabgsegm/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudabgsegm/src/",
        "-D__OPENCV_BUILD=1",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "cudabgsegm_cu",
        ],
)

cc_library(
    name = "cudabgsegm_cu",
    hdrs = glob([
        "modules/cudabgsegm/include/**/*.h",
        "modules/cudabgsegm/include/**/*.hpp",
        ]),
    srcs = if_cuda(glob([
        "modules/cudabgsegm/src/cuda/*.cu",
        "modules/cudabgsegm/src/cuda/*.h",
        "modules/cudabgsegm/src/*.h",
        ])),
    includes = [
        "modules/cudabgsegm/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudabgsegm/src/",
        "-D__OPENCV_BUILD=1",
        "-std=c++03",
        ],
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "//external:thrust",
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
    cmd = cuda_select("echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n#define BUILD_SHARED_LIBS\n#define HAVE_PTHREADS\n#define HAVE_PTHREADS_PF\n#define HAVE_CUDA\n#define HAVE_CUFFT\n#define CUDA_ARCH_BIN \"\"\n#define CUDA_ARCH_PTX \"\"\n#define CUDA_ARCH_FEATURES \"\"\n' > $(@D)/cvconfig.h",
        "echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n#define BUILD_SHARED_LIBS\n#define HAVE_PTHREADS\n#define HAVE_PTHREADS_PF\n' > $(@D)/cvconfig.h"),
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
    cmd = cuda_select("echo -e '#define HAVE_OPENCV_CORE\n#define HAVE_OPENCV_IMGCODECS\n#define HAVE_OPENCV_IMGPROC\n#define HAVE_OPENCV_HIGHGUI\n#define HAVE_OPENCV_VIDEOIO\n#define HAVE_OPENCV_PHOTO\n#define HAVE_OPENCV_CUDEV\n' > $(@D)/opencv_modules.hpp",
        "echo -e '#define HAVE_OPENCV_CORE\n#define HAVE_OPENCV_IMGCODECS\n#define HAVE_OPENCV_IMGPROC\n#define HAVE_OPENCV_HIGHGUI\n#define HAVE_OPENCV_VIDEOIO\n#define HAVE_OPENCV_PHOTO\n' > $(@D)/opencv_modules.hpp"),
)

genrule(
    name = "generated_files",
    outs = [
        "include/custom_hal.hpp",
        "include/opencl_kernels_core.hpp",
        "include/opencl_kernels_imgproc.hpp",
        "include/opencl_kernels_imgcodec.hpp",
        "include/opencl_kernels_videoio.hpp",
        "include/opencl_kernels_highgui.hpp",
        "include/opencl_kernels_photo.hpp",
        ],
    cmd = "touch $(@D)/%s/custom_hal.hpp; for x in $(@D)/%s/opencl_kernels_{core,imgproc,imgcodec,videoio,highgui,photo}.hpp; do echo -e '#include \"opencv2/core/ocl.hpp\"\n#include \"opencv2/core/ocl_genbase.hpp\"\n#include \"opencv2/core/opencl/ocl_defs.hpp\"\n' > $$x; done" % ("include/", "include/"),
)

cc_megvii_shared_object(
    name = "opencv_standalone",
    deps = [
        ":core",
        ":imgproc",
        ":imgcodecs",
        ":videoio",
        ":photo",
        ":cudaimgproc",
        ":cudabgsegm",
        ],
)
