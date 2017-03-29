root_prefix_dir = "external/opencv3_archive"

ignore_known_warnings = [
    "-Wno-unused-result",
    ] + if_mobile([
    "-Wno-unused-const-variable",
    "-Wno-self-assign",
    ])

cc_library(
    name = "headers",
    hdrs = glob([
        "include/**/*.h",
        "include/**/*.hpp",
        "modules/*/include/**/*.h",
        "modules/*/include/**/*.hpp",
        ]) + [
        ":configure",
        ":opencv_modules",
        ],
    includes = [
        "include/",
        ] + glob([
        "modules/*/include",
        ], exclude_directories=0),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "ts",
    srcs = [
        "modules/ts/src/ts.cpp",
        "modules/ts/src/ts_arrtest.cpp",
        "modules/ts/src/ts_func.cpp",
        "modules/ts/src/ts_gtest.cpp",
        "modules/ts/src/ts_perf.cpp",
        "modules/ts/src/ocl_test.cpp",
        "modules/ts/src/cuda_test.cpp",
        "modules/ts/src/cuda_perf.cpp",
        "modules/ts/src/precomp.hpp",
        ],
    includes = [
        "modules/ts/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/ts/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        "//:headers",
        ],
)

cc_library(
    name = "core",
    srcs = glob([
        "modules/core/src/*.cpp",
        "modules/core/src/*.hpp",
        ]) + [
        ":version_string",
        ":generated_files",
        ],
    includes = [
        "modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-I$(GENDIR)/" + root_prefix_dir + "/generated/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
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
    srcs = if_cuda(glob([
        "modules/core/src/cuda/*",
        ])),
    includes = [
        "modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-I$(GENDIR)/" + root_prefix_dir + "/generated/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    deps = [
        "//:headers",
        "//external:thrust",
        ],
)

cc_library(
    name = "core_test_lib",
    srcs = glob([
        "modules/core/test/*",
        ]),
    includes = [
        "modules/core/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/core/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        "//:headers",
        "//:core",
        "//:ts",
        "//:imgcodecs",     # Not really needed, but we want it linkable without LTO or ffunction-section
        "//:highgui",       # Not really needed, but we want it linkable without LTO or ffunction-section
        ],
)

cc_library(
    name = "imgproc",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ],
)

cc_library(
    name = "imgcodecs",
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
        ] + ignore_known_warnings,
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":imgcodecs",
        ":core",
        ],
)

cc_library(
    name = "highgui",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":imgcodecs",
        ":videoio",
        ":core",
        ],
)

cc_library(
    name = "photo",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":imgproc",
        ":core",
        ],
)

cc_library(
    name = "cudaimgproc",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "cudaimgproc_cu",
        ],
)

cc_library(
    name = "cudaimgproc_cu",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ],
)

cc_library(
    name = "cudabgsegm",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ":cudabgsegm_cu",
        ],
)

cc_library(
    name = "cudabgsegm_cu",
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
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "//external:thrust",
        ],
)

cc_library(
    name = "cudabgsegm_test_lib",
    srcs = glob([
        "modules/cudabgsegm/test/*",
        ]),
    includes = [
        "modules/cudabgsegm/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudabgsegm/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":cudabgsegm",
        ":ts",
        ],
)

cc_library(
    name = "cudaarithm",
    srcs = if_cuda(glob([
        "modules/cudaarithm/src/*.cpp",
        "modules/cudaarithm/src/*.hpp",
        "modules/cudaarithm/src/*.h",
        ])),
    includes = [
        "modules/cudaarithm/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudaarithm/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        ":cudaarithm_cu",
        ],
)

cc_library(
    name = "cudaarithm_cu",
    srcs = if_cuda(glob([
        "modules/cudaarithm/src/cuda/*",
        "modules/cudaarithm/src/*.h",
        ])),
    includes = [
        "modules/cudaarithm/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudaarithm/src/",
        "-D__OPENCV_BUILD=1",
        "-std=c++03",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "//external:thrust",
        ],
)

cc_library(
    name = "cudafilters",
    srcs = if_cuda(glob([
        "modules/cudafilters/src/*.cpp",
        "modules/cudafilters/src/*.hpp",
        "modules/cudafilters/src/*.h",
        ])),
    includes = [
        "modules/cudafilters/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudafilters/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":imgproc",
        ":cudaarithm",
        ":cudafilters_cu",
        ],
)

cc_library(
    name = "cudafilters_cu",
    srcs = if_cuda(glob([
        "modules/cudafilters/src/cuda/*",
        "modules/cudafilters/src/*.h",
        ])),
    includes = [
        "modules/cudafilters/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudafilters/src/",
        "-D__OPENCV_BUILD=1",
        "-std=c++03",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":core",
        "//external:thrust",
        ],
)

cc_library(
    name = "cudafilters_test_lib",
    srcs = glob([
        "modules/cudafilters/test/*",
        ]),
    includes = [
        "modules/cudafilters/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/cudafilters/src/",
        "-D__OPENCV_BUILD=1",
        ] + ignore_known_warnings,
    visibility = ["//visibility:public"],
    deps = [
        ":cudafilters",
        ":ts",
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
    # FIXME: hardcoded PTX archs here is a maintainance hassle and should be moved to somewhere else.
    cmd = cuda_select("echo -e '#define HAVE_PNG\n#define HAVE_JPEG\n#define BUILD_SHARED_LIBS\n#define HAVE_PTHREADS\n#define HAVE_PTHREADS_PF\n#define HAVE_CUDA\n#define HAVE_CUFFT\n#define CUDA_ARCH_BIN \" 30 32 35 50 52 53 60 61 62\"\n#define CUDA_ARCH_PTX \" 30 32 35 50 52 53 60 61 62\"\n#define CUDA_ARCH_FEATURES \" 30 32 35 50 52 53 60 61 62\"\n' > $(@D)/cvconfig.h",
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
        ":cudafilters",
        ],
)

cc_megvii_test(
    name = "core_test",
    deps = [
        ":core_test_lib",
        ],
    args = [
        # FIXME investigate why this fails for me
        "--gtest_filter=-UMat.testTempObjects_Mat:Core_globbing.accuracy",
        ],
)

cc_megvii_test(
    name = "cudabgsegm_test",
    deps = [
        ":cudabgsegm_test_lib",
        ],
)

cc_megvii_test(
    name = "cudafilters_test",
    deps = [
        ":cudafilters_test_lib",
        ],
    args = [
        "--gtest_filter=-*KMeans*",
        ],
    size = "enormous",
)
