root_prefix_dir = "external/opencv3_archive"

opencv_common_copts = [
    "-D__OPENCV_BUILD=1",
    "-Wno-unused-result",
    ] + if_mobile([
    "-Wno-unused-const-variable",
    "-Wno-self-assign",
    ]) + if_ios_armv7([
    "-U__ARM_FP16_FORMAT_IEEE",
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
        "include/opencv_tests_config.hpp",
        ],
    includes = [
        "modules/ts/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/ts/src/",
        ] + opencv_common_copts,
    visibility = ["//visibility:public"],
    deps = [
        "//:headers",
        "//:highgui",
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
        ] + opencv_common_copts,
    visibility = ["//visibility:public"],
    deps = [
        "//:headers",
        "//:core_cu",
        "@zlib_archive//:zlib",
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
        ] + opencv_common_copts,
    deps = [
        "//:headers",
        "//external:thrust",
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
        ] + opencv_common_copts,
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
        ] + opencv_common_copts,
    visibility = ["//visibility:public"],
    deps = [
        ":imgcodecs",
        ":videoio",
        ":core",
        ],
)
genrule(
    name = "configure",
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
    cmd = "echo '\"OpenCV3 Megvii3 Edition\"' > $(@D)/version_string.inc",
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
        "include/opencl_kernels_calib3d.hpp",
        "include/opencl_kernels_core.hpp",
        "include/opencl_kernels_features2d.hpp",
        "include/opencl_kernels_flann.hpp",
        "include/opencl_kernels_highgui.hpp",
        "include/opencl_kernels_imgcodec.hpp",
        "include/opencl_kernels_imgproc.hpp",
        "include/opencl_kernels_objdetect.hpp",
        "include/opencl_kernels_photo.hpp",
        "include/opencl_kernels_stitching.hpp",
        "include/opencl_kernels_superres.hpp",
        "include/opencl_kernels_video.hpp",
        "include/opencl_kernels_videoio.hpp",
        ],
    cmd = "touch $(@D)/%s/custom_hal.hpp; for x in $(@D)/%s/opencl_kernels_{calib3d,core,features2d,flann,highgui,imgproc,imgcodec,objdetect,photo,stitching,superres,video,videoio}.hpp; do echo -e '#include \"opencv2/core/ocl.hpp\"\n#include \"opencv2/core/ocl_genbase.hpp\"\n#include \"opencv2/core/opencl/ocl_defs.hpp\"\n' > $$x; done" % ("include/", "include/"),
)

genrule(
    name = "generate_opencv_tests_config_hpp",
    outs = [
        "include/opencv_tests_config.hpp",
        ],
    cmd = "echo -e '#define OPENCV_INSTALL_PREFIX \"/usr/megvii\"\n#define OPENCV_TEST_DATA_INSTALL_PATH \"share/OpenCV/testdata\"' > $(@D)/opencv_tests_config.hpp",
)

cc_megvii_shared_object(
    name = "opencv_standalone",
    deps = [
        ":calib3d",
        ":core",
        ":cudabgsegm",
        ":cudafilters",
        ":cudaimgproc",
        ":cudaarithm",
        ":cudacodec",
        ":cudafeatures2d",
        ":cudaobjdetect",
        ":cudaoptflow",
        ":cudastereo",
        ":cudawarping",
        ],
)

[[cc_library(
    name = module_name + "_cu",
    srcs = if_cuda(glob([
        "modules/" + module_name + "/src/**/*.cu",
        "modules/" + module_name + "/src/**/*.hpp",
        "modules/" + module_name + "/src/**/*.h",
        ])),
    includes = [
        "modules/" + module_name + "/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/" + module_name + "/src/",
        "-std=c++03",
        ] + opencv_common_copts,
    deps = [
        ":core",
        "//external:thrust",
        ],
), cc_library(
    name = module_name,
    srcs = if_cuda(glob([
        "modules/" + module_name + "/src/**/*.cpp",
        "modules/" + module_name + "/src/**/*.hpp",
        "modules/" + module_name + "/src/**/*.h",
        ])) if module_name.startswith("cuda") else glob([
        "modules/" + module_name + "/src/**/*.cpp",
        "modules/" + module_name + "/src/**/*.hpp",
        "modules/" + module_name + "/src/**/*.h",
        ]),
    copts = [
        "-I" + root_prefix_dir + "/modules/" + module_name + "/src/",
        ] + opencv_common_copts,
    visibility = ["//visibility:public"],
    deps = [
        ":" + module_name + "_cu",
        ] + deps,
)] for module_name, deps in [
    ("cudafilters", [
        ":imgproc",
        ":cudaarithm",
        ]),
    ("cudaimgproc", []),
    ("cudaarithm", []),
    ("cudabgsegm", []),
    ("cudacodec", []),
    ("cudafeatures2d", [
        ":cudaarithm",
        ":cudafilters",
        ":cudawarping",
        ":features2d",
        ]),
    ("cudaobjdetect", [
        ":cudaarithm",
        ":cudawarping",
        ":objdetect",
        ]),
    ("cudaoptflow", [
        ":cudaarithm",
        ":cudawarping",
        ":video",
        ]),
    ("cudastereo", []),
    ("cudawarping", []),
    ["video", [
        ":imgproc",
        ]],
    ["photo", [
        ":imgproc",
        ]],
    ["objdetect", [
        ":imgproc",
        ]],
    ["imgcodecs", [
        ":imgproc",
        "@jpeg_archive//:jpeg",
        "@png_archive//:png",
        ]],
    ["calib3d", []],
    ["features2d", [
        ":flann",
        ":imgproc",
        ]],
    ["flann", []],
    ["imgproc", []],
    ["superres", []],
    ["stitching", [
        ":imgproc",
        ":features2d",
        ]],
    ["shape", []],
]]

[[cc_library(
    name = module_name + "_test_lib",
    srcs = glob([
        "modules/" + module_name + "/test/*",
        ]),
    includes = [
        "modules/" + module_name + "/include/",
        ],
    copts = [
        "-I" + root_prefix_dir + "/modules/" + module_name + "/src/",
        ] + opencv_common_copts,
    visibility = ["//visibility:public"],
    deps = deps + [
        "//:ts",
        "//:" + module_name,
        ],
), cc_megvii_test(
    name = module_name + "_test",
    deps = [
        ":" + module_name + "_test_lib",
        ],
    size = "enormous",
)] for module_name, deps in [
    ("core", [
            ]),
    ("calib3d", [
            "//:flann",
            "//:imgcodecs",
            "//:imgproc",
            "//:videoio",
            "//:features2d",
            ]),
    ("features2d", [
            "//:imgcodecs",
            ]),
    ("flann", []),
    ("imgcodecs", []),
    ("objdetect", []),
    ("photo", []),
    ("shape", []),
    ("stitching", []),
    ("superres", []),
    ("video", []),
    ("imgproc", [
            "//:imgcodecs",
            ]),
    ("cudaarithm", []),
    ("cudabgsegm", []),
    ("cudacodec", []),
    ("cudafeatures2d", []),
    ("cudafilters", []),
    ("cudaimgproc", []),
    ("cudaobjdetect", []),
    ("cudaoptflow", []),
    ("cudastereo", [
            "//:calib3d",
            ]),
    ("cudawarping", []),
]]
