new_http_archive(
    name = "zlib_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/zlib-1.2.8.tar.gz",
    sha256 = "36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d",
    build_file = "third_party/zlib.BUILD",
    strip_prefix = "zlib-1.2.8",
    )

new_http_archive(
    name = "jpeg_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/jpegsrc.v9a.tar.gz",
    sha256 = "3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7",
    build_file = "third_party/jpeg.BUILD",
    strip_prefix = "jpeg-9a",
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
    sha256 = "c0c82e679b76c9677ceacc83b7829f1c5cf2be13a35852b14ddab04b7d869346",
    build_file = "tools/toolchain/v3.BUILD",
    )

new_http_archive(
    name = "cuda_7_5_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.5.tar.bz2",
    sha256 = "807d83f0c2b34fe2f8ab7048a556c0aed3aadaae13e2fe0dbf820214ac59c75c",
    build_file = "tools/toolchain/cuda-7.5.BUILD",
    )

new_http_archive(
    name = "cudnn_archive",
#    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.0.5.tar.bz2",
#    sha256 = "13bdf592bb20723cd4c00bcf167ad7deee185e45f511b7c032d3f05de4e1589d",
    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-4.0.7.tar.bz2",
    sha256 = "edc558fa7daf5fe1c5e6da9fea2275dcafdf982ef969d4874a8c942e7dbcda5c",
    build_file = "third_party/cudnn.BUILD",
    )

new_http_archive(
    name = "thrust_archive",
    url = "http://master.br.megvii-inc.com/download/yangyi/thrust-1.8.3-alpha.1.6070b6.tar.bz2",
    sha256 = "47a90aef6cd78436d878361d26824cfab937a071f1608b13e111dc4e593ca2ad",
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
    name = "cudnn",
    actual = "@cudnn_archive//:cudnn",
    )

bind(
    name = "thrust",
    actual = "@thrust_archive//:thrust",
    )

bind(
    name = "utf8",
    actual = "@utf8_archive//:utf8",
    )
