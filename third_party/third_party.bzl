def load_third_party_libraries():
    native.new_http_archive(
        name = "zlib_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/zlib-1.2.8.tar.gz",
        sha256 = "36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d",
        build_file = "third_party/zlib.BUILD",
        strip_prefix = "zlib-1.2.8",
        )

    native.new_http_archive(
        name = "jpeg_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/libjpeg-turbo-1.5.1.tar.gz",
        sha256 = "c15a9607892113946379ccea3ca8b85018301b200754f209453ab21674268e77",
        build_file = "third_party/jpeg.BUILD",
        strip_prefix = "libjpeg-turbo-1.5.1",
        )

    native.new_http_archive(
        name = "png_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/libpng-1.6.25.tar.gz",
        sha256 = "67fef52fc70f21cd9efbb4fc9e74c1ed4eec770e5dc3dbfa6788212798967459",
        build_file = "third_party/png.BUILD",
        strip_prefix = "libpng-1.6.25",
        )

    native.new_http_archive(
        name = "opencv2_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/opencv-2.4.13.zip",
        sha256 = "fa6a45f635f4e1dbc982b8ccc93206650e7fc584b2f3dd945759ce28b047b94f",
        build_file = "third_party/opencv2.BUILD",
        strip_prefix = "opencv-2.4.13",
        )

    native.new_http_archive(
        name = "opencv3_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/opencv-3.1.0.zip",
        sha256 = "1f6990249fdb82804fff40e96fa6d99949023ab0e3277eae4bd459b374e622a4",
        build_file = "third_party/opencv3.BUILD",
        strip_prefix = "opencv-3.1.0",
        )

    native.new_http_archive(
        name = "gtest_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/gtest-1.7.0.zip",
        sha256 = "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d",
        build_file = "third_party/gtest.BUILD",
        strip_prefix = "gtest-1.7.0",
        )

    native.new_http_archive(
        name = "intel_mkl_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/intel-mkl-static-11.3.3.zip",
        sha256 = "e37e6865e3071c3ea6fb2784a06262b4779f7c9b1774f80edf836ebeb840a6c1",
        build_file = "third_party/intel-mkl.BUILD",
        )

    native.new_http_archive(
        name = "thrust_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/thrust-1.8.2-r1.tar.bz2",
        sha256 = "785fd9a9a16dfc67323aa5f457f549308cc173aacc5989311aed98b2700b37a7",
        build_file = "third_party/thrust.BUILD",
        )

    native.new_http_archive(
        name = "utf8_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/utf8_v2_3_4.zip",
        sha256 = "3373cebb25d88c662a2b960c4d585daf9ae7b396031ecd786e7bb31b15d010ef",
        build_file = "third_party/utf8.BUILD",
        strip_prefix = "source",
        )

    native.new_http_archive(
        name = "eigen_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/eigen-3.3-beta2.tar.bz2",
        sha256 = "aa1a436a67caec348f76ba8f9bba5c5532286d6a1c49e8301c5d72dc6a8c7ecb",
        build_file = "third_party/eigen.BUILD",
        strip_prefix = "eigen-eigen-69d418c06999",
        )

    native.new_http_archive(
        name = "flatbuffers_archive",
        url = "https://github.com/google/flatbuffers/archive/v1.4.0.tar.gz",
        sha256 = "d3355f0adcc16054afcce4a3eac90b9c26f926be9a65b2e158867f56ab689e63",
        build_file = "third_party/flatbuffers.BUILD",
        strip_prefix = "flatbuffers-1.4.0",
        )

    native.new_http_archive(
        name = "boost_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/boost_1_61_0.tar.bz2",
        sha256 = "a547bd06c2fd9a71ba1d169d9cf0339da7ebf4753849a8f7d6fdb8feee99b640",
        build_file = "third_party/boost.BUILD",
        strip_prefix = "boost_1_61_0",
        )

    native.bind(
        name = "opencv3_core",
        actual = "@opencv3_archive//:core",
        )

    native.bind(
        name = "opencv3_imgproc",
        actual = "@opencv3_archive//:imgproc",
        )

    native.bind(
        name = "opencv3_highgui",
        actual = "@opencv3_archive//:highgui",
        )

    native.bind(
        name = "opencv3_imgcodecs",
        actual = "@opencv3_archive//:imgcodecs",
        )

    native.bind(
        name = "opencv3_photo",
        actual = "@opencv3_archive//:photo",
        )

    native.bind(
        name = "opencv3_headers",
        actual = "@opencv3_archive//:headers",
        )

    native.bind(
        name = "gtest",
        actual = "@gtest_archive//:gtest",
        )

    native.bind(
        name = "gtest_main",
        actual = "@gtest_archive//:gtest_main",
        )

    native.bind(
        name = "intel-mkl",
        actual = "@intel_mkl_archive//:intel-mkl",
        )

    native.bind(
        name = "jpeg",
        actual = "@jpeg_archive//:jpeg",
        )

    native.bind(
        name = "png",
        actual = "@png_archive//:png",
        )

    native.bind(
        name = "thrust",
        actual = "@thrust_archive//:thrust",
        )

    native.bind(
        name = "utf8",
        actual = "@utf8_archive//:utf8",
        )

    native.bind(
        name = "boost",
        actual = "@boost_archive//:boost",
        )

    native.bind(
        name = "boost_system",
        actual = "@boost_archive//:system",
        )

    native.bind(
        name = "boost_filesystem",
        actual = "@boost_archive//:filesystem",
        )

    native.bind(
        name = "boost_date_time",
        actual = "@boost_archive//:date_time",
        )

    native.bind(
        name = "boost_thread",
        actual = "@boost_archive//:thread",
        )
