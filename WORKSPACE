workspace(name = "megvii3")

new_http_archive(
    name = "zlib_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/zlib-1.2.8.tar.gz",
    sha256 = "36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d",
    build_file = "third_party/zlib.BUILD",
    strip_prefix = "zlib-1.2.8",
    )

new_http_archive(
    name = "jpeg_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/libjpeg-turbo-1.5.0.tar.gz",
    sha256 = "9f397c31a67d2b00ee37597da25898b03eb282ccd87b135a50a69993b6a2035f",
    build_file = "third_party/jpeg.BUILD",
    strip_prefix = "libjpeg-turbo-1.5.0",
    )

new_http_archive(
    name = "png_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/libpng-v1.2.53.zip",
    sha256 = "c35bcc6387495ee6e757507a68ba036d38ad05b415c2553b3debe2a57647a692",
    build_file = "third_party/png.BUILD",
    strip_prefix = "libpng-1.2.53",
    )

new_http_archive(
    name = "opencv2_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/opencv-2.4.13.zip",
    sha256 = "fa6a45f635f4e1dbc982b8ccc93206650e7fc584b2f3dd945759ce28b047b94f",
    build_file = "third_party/opencv2.BUILD",
    strip_prefix = "opencv-2.4.13",
    )

new_http_archive(
    name = "opencv3_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/opencv-3.1.0.zip",
    sha256 = "1f6990249fdb82804fff40e96fa6d99949023ab0e3277eae4bd459b374e622a4",
    build_file = "third_party/opencv3.BUILD",
    strip_prefix = "opencv-3.1.0",
    )

new_http_archive(
    name = "gtest_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/gtest-1.7.0.zip",
    sha256 = "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d",
    build_file = "third_party/gtest.BUILD",
    strip_prefix = "gtest-1.7.0",
    )

new_http_archive(
    name = "intel_mkl_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/intel-mkl-static-11.3.3.zip",
    sha256 = "e37e6865e3071c3ea6fb2784a06262b4779f7c9b1774f80edf836ebeb840a6c1",
    build_file = "third_party/intel-mkl.BUILD",
    )

new_http_archive(
    name = "toolchain_v3_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-4.9.3.tar.bz2",
    sha256 = "a87667bf3f80c8d31a6a336f2f6fe9aa129323af41957220eb35a073430822f4",
    build_file = "tools/toolchain/v3/v3.BUILD",
    )

new_http_archive(
    name = "toolchain_v3_tk1_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-tk1-4.8.5.tar.bz2",
    sha256 = "17aee8f574f39d99fd243147cf4a9bb18c6987581dde9cf36b7eba2754fbe2b4",
    build_file = "tools/toolchain/v3/v3-tk1.BUILD",
    )

new_http_archive(
    name = "toolchain_v3_tx1_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-tx1-4.9.3.tar.bz2",
    sha256 = "d2dd6195db99641a1248f1b7f2fe522459290fce74c05e34cbfda37c0fb94aeb",
    build_file = "tools/toolchain/v3/v3-tx1.BUILD",
    )

new_http_archive(
    name = "android_ndk_r12b_armv7_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/android-ndk-r12b-armv7.tar.bz2",
    sha256 = "2bff93fc35b518a1967f0ffea8136425cac00b6f8bb0da9d1d383627ef8581cc",
    build_file = "tools/toolchain/android-ndk-r12b/armv7.BUILD",
    )

new_http_archive(
    name = "android_ndk_r12b_aarch64_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/android-ndk-r12b-aarch64.tar.bz2",
    sha256 = "6e91d9ef7801e3d0481d8927cd51992ff5eba6214425912e66699d11f74d3dab",
    build_file = "tools/toolchain/android-ndk-r12b/aarch64.BUILD",
    )

new_http_archive(
    name = "cuda_6_5_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-6.5.45-minimal.tar.bz2",
    sha256 = "99412822a852c4288c5646c04ab03ac263496be1c58cacc2e319f090492c5378",
    build_file = "tools/toolchain/cuda-minimal.BUILD",
    )

new_http_archive(
    name = "cuda_7_0_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.0.74-minimal.tar.bz2",
    sha256 = "56f94f2f81d6c42b65170686dc7ddb605dd66dfeacbc6dc999763e36f466f3d8",
    build_file = "tools/toolchain/cuda-minimal.BUILD", # Reusing existing BUILD files
    )

new_http_archive(
    name = "cuda_7_5_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.5.14-minimal.tar.bz2",
    sha256 = "45472a3b3276ccf8114ff187af2325e4c105cd9bf5686a0139cf5eb3381b11e6",
    build_file = "tools/toolchain/cuda-minimal.BUILD",
    )

new_http_archive(
    name = "cuda_8_0_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-8.0.27-minimal.tar.bz2",
    sha256 = "1e80618b6a7eacfe8a35bce8ed0ac8782783d6aff9f32d147474c01ce3fe1589",
    build_file = "tools/toolchain/cuda-minimal.BUILD",
    )

new_http_archive(
    name = "cuda_6_5_armv7libs_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-6.5.53-armv7libs.tar.bz2",
    sha256 = "d9f732853629a7917b6937fbe1d3e45263fa042540ee3dbf70a565e78f951218",
    build_file = "tools/toolchain/cuda-libs.BUILD",
    )

new_http_archive(
    name = "cuda_7_0_aarch64libs_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.0.76-aarch64libs.tar.bz2",
    sha256 = "84b7d6357420b6cd15594c7e50817840188e7f68426735e8c387ae349916f45c",
    build_file = "tools/toolchain/cuda-libs.BUILD",
    )

new_http_archive(
    name = "cuda_7_5_x86_64libs_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.5.14-x86_64libs.tar.bz2",
    sha256 = "9f15de08a08ff125b7f3893d05855615ca71842b6cc1c725da40fe496c50f998",
    build_file = "tools/toolchain/cuda-libs.BUILD",
    )

new_http_archive(
    name = "cuda_8_0_x86_64libs_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-8.0.27-x86_64libs.tar.bz2",
    sha256 = "91ec4d6e2f5f24f0d217ab6a77d1dc6f42aba3b15a8801f0da0c9796f249c65f",
    build_file = "tools/toolchain/cuda-libs.BUILD",
    )

new_http_archive(
    name = "cudnn_4_x86_64_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-4.0.7.tar.bz2",
    sha256 = "0e62f211f606b413d9326ab1e63fe6203b87fb235cf6cbd0d996251f2ed55fd4",
    build_file = "third_party/cudnn-x86_64.BUILD",
    )

new_http_archive(
    name = "cudnn_x86_64_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.1.3.tar.bz2",
    sha256 = "f42d2bbad8ce3d96f0dc964dde429db8eadb5719b7a07fb89ea906d39b326024",
#    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.0.5.tar.bz2",
#    sha256 = "02203308c7c51b7202719670850b773e1f051b1fada3faa4b965e32a2b2f06a7",
    build_file = "third_party/cudnn-x86_64.BUILD",
    )

new_http_archive(
    name = "cudnn_x86_64_cuda8_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.1.5-cuda8.tar.bz2",
    sha256 = "e6aed4fe736e834de5cfbb6e56f6e4899d1f816e354edf3a00b69288bde46e5b",
    build_file = "third_party/cudnn-x86_64.BUILD",
    )

new_http_archive(
    name = "cudnn_armv7_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-armv7-4.0.7.tar.bz2",
    sha256 = "9c4d348f6eda0455f0461beeeac57cb6672631198681db144abe2ff8ff213771",
    build_file = "third_party/cudnn-armv7.BUILD",
    )

new_http_archive(
    name = "cudnn_aarch64_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-aarch64-4.0.7.tar.bz2",
    sha256 = "bb3ddb695bf4bf64bafe54519bb9c7f678889f3b60a0b8d3d574373debb5bd5c",
    build_file = "third_party/cudnn-x86_64.BUILD", # Reusing existing BUILD files
    )

new_http_archive(
    name = "thrust_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/thrust-1.8.2-r1.tar.bz2",
    sha256 = "785fd9a9a16dfc67323aa5f457f549308cc173aacc5989311aed98b2700b37a7",
    build_file = "third_party/thrust.BUILD",
    )

new_http_archive(
    name = "utf8_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/utf8_v2_3_4.zip",
    sha256 = "3373cebb25d88c662a2b960c4d585daf9ae7b396031ecd786e7bb31b15d010ef",
    build_file = "third_party/utf8.BUILD",
    strip_prefix = "source",
    )

bind(
    name = "opencv3_core",
    actual = "@opencv3_archive//:core",
    )

bind(
    name = "opencv3_imgproc",
    actual = "@opencv3_archive//:imgproc",
    )

bind(
    name = "opencv3_highgui",
    actual = "@opencv3_archive//:highgui",
    )

bind(
    name = "opencv3_imgcodecs",
    actual = "@opencv3_archive//:imgcodecs",
    )

bind(
    name = "opencv3_photo",
    actual = "@opencv3_archive//:photo",
    )

bind(
    name = "opencv3_headers",
    actual = "@opencv3_archive//:headers",
    )

bind(
    name = "gtest",
    actual = "@gtest_archive//:gtest",
    )

bind(
    name = "gtest_main",
    actual = "@gtest_archive//:gtest_main",
    )

bind(
    name = "intel-mkl",
    actual = "@intel_mkl_archive//:intel-mkl",
    )

bind(
    name = "cudnn_x86_64",
    actual = "@cudnn_x86_64_archive//:cudnn",
    )

bind(
    name = "cudnn_x86_64_cuda8",
    actual = "@cudnn_x86_64_cuda8_archive//:cudnn",
    )

bind(
    name = "cudnn_armv7",
    actual = "@cudnn_armv7_archive//:cudnn",
    )

bind(
    name = "cudnn_aarch64",
    actual = "@cudnn_aarch64_archive//:cudnn",
    )

bind(
    name = "thrust",
    actual = "@thrust_archive//:thrust",
    )

bind(
    name = "utf8",
    actual = "@utf8_archive//:utf8",
    )
