def load_third_party_libraries(repo):
    native.new_http_archive(
        name = "zlib_archive",
        url = repo + "/zlib-1.2.10.tar.gz",
        sha256 = "8d7e9f698ce48787b6e1c67e6bff79e487303e66077e25cb9784ac8835978017",
        build_file = "third_party/zlib.BUILD",
        )

    native.new_http_archive(
        name = "jpeg_archive",
        url = repo + "/libjpeg-turbo-1.5.1.tar.gz",
        sha256 = "c15a9607892113946379ccea3ca8b85018301b200754f209453ab21674268e77",
        build_file = "third_party/jpeg.BUILD",
        strip_prefix = "libjpeg-turbo-1.5.1",
        )

    native.new_http_archive(
        name = "png_archive",
        url = repo + "/libpng-1.6.28.tar.gz",
        sha256 = "b6cec903e74e9fdd7b5bbcde0ab2415dd12f2f9e84d9e4d9ddd2ba26a41623b2",
        build_file = "third_party/png.BUILD",
        strip_prefix = "libpng-1.6.28",
        )

    native.new_http_archive(
        name = "opencv2_archive",
        url = repo + "/opencv-2.4.13.zip",
        sha256 = "fa6a45f635f4e1dbc982b8ccc93206650e7fc584b2f3dd945759ce28b047b94f",
        build_file = "third_party/opencv2.BUILD",
        strip_prefix = "opencv-2.4.13",
        )

    native.new_http_archive(
        name = "opencv3_archive",
        url = repo + "/opencv-3.1.0.zip",
        sha256 = "1f6990249fdb82804fff40e96fa6d99949023ab0e3277eae4bd459b374e622a4",
        build_file = "third_party/opencv3.BUILD",
        strip_prefix = "opencv-3.1.0",
        )

    native.new_http_archive(
        name = "gtest_archive",
        url = repo + "/gtest-1.8.0.tar.gz",
        sha256 = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8",
        build_file = "third_party/gtest.BUILD",
        strip_prefix = "googletest-release-1.8.0/googletest",
        )

    native.new_http_archive(
        name = "intel_mkl_archive",
        url = repo + "/intel-mkl-static-2017.0.098-premerged.tar.bz2",
        sha256 = "be6d1e9d0e0c36a6d5ccc9a08dcfc4aac557f690160a5772ce4ea39358a88f48",
        build_file = "third_party/intel-mkl.BUILD",
        )

    native.new_http_archive(
        name = "thrust_archive",
        url = repo + "/thrust-1.8.2-r1.tar.bz2",
        sha256 = "785fd9a9a16dfc67323aa5f457f549308cc173aacc5989311aed98b2700b37a7",
        build_file = "third_party/thrust.BUILD",
        )

    native.new_http_archive(
        name = "utf8_archive",
        url = repo + "/utf8_v2_3_4.zip",
        sha256 = "3373cebb25d88c662a2b960c4d585daf9ae7b396031ecd786e7bb31b15d010ef",
        build_file = "third_party/utf8.BUILD",
        strip_prefix = "source",
        )

    native.new_http_archive(
        name = "eigen_archive",
        url = repo + "/eigen-3.3-beta2.tar.bz2",
        sha256 = "aa1a436a67caec348f76ba8f9bba5c5532286d6a1c49e8301c5d72dc6a8c7ecb",
        build_file = "third_party/eigen.BUILD",
        strip_prefix = "eigen-eigen-69d418c06999",
        )

    native.new_http_archive(
        name = "flatbuffers_archive",
        url = repo + "/flatbuffers-v1.4.0.tar.gz",
        sha256 = "d3355f0adcc16054afcce4a3eac90b9c26f926be9a65b2e158867f56ab689e63",
        build_file = "third_party/flatbuffers.BUILD",
        strip_prefix = "flatbuffers-1.4.0",
        )

    native.new_http_archive(
        name = "boost_archive",
        url = repo + "/boost_1_61_0.tar.bz2",
        sha256 = "a547bd06c2fd9a71ba1d169d9cf0339da7ebf4753849a8f7d6fdb8feee99b640",
        build_file = "third_party/boost.BUILD",
        strip_prefix = "boost_1_61_0",
        )

    native.new_http_archive(
        name = "bzip2_archive",
        url = repo + "/bzip2-1.0.6.tar.gz",
        sha256 = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd",
        build_file = "third_party/bzip2.BUILD",
        strip_prefix = "bzip2-1.0.6",
        )

    native.new_http_archive(
        name = "xz_archive",
        url = repo + "/xz-5.2.2.tar.bz2",
        sha256 = "6ff5f57a4b9167155e35e6da8b529de69270efb2b4cf3fbabf41a4ee793840b5",
        build_file = "third_party/xz.BUILD",
        strip_prefix = "xz-5.2.2",
        )

    native.new_http_archive(
        name = "pybind11_archive",
        url = repo + "/pybind11-2.0.1.tar.gz",
        sha256 = "d18383097455cab02e9ff312eaf472e36ae26c3ff46e250b790ddc5ec336fa5c",
        build_file = "third_party/pybind11.BUILD",
        )

    native.new_http_archive(
        name = "python35m_headers_archive",
        url = repo + "/python-3.5.2-headers.tar.bz2",
        sha256 = "b5b20a206a06b5ea7ad537c4611aebdfb7880acd249cdaf469ff5a8e0e832b69",
        build_file = "third_party/python-3.5m-headers.BUILD",
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
        name = "opencv3_cudaimgproc",
        actual = "@opencv3_archive//:cudaimgproc",
        )

    native.bind(
        name = "opencv3_cudabgsegm",
        actual = "@opencv3_archive//:cudabgsegm",
        )

    native.bind(
        name = "opencv3_cudaarithm",
        actual = "@opencv3_archive//:cudaarithm",
        )

    native.bind(
        name = "opencv3_cudafilters",
        actual = "@opencv3_archive//:cudafilters",
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

    native.bind(
        name = "zlib",
        actual = "@zlib_archive//:zlib",
        )

    native.bind(
        name = "bz2lib",
        actual = "@bzip2_archive//:bz2lib",
        )

    native.bind(
        name = "lzma",
        actual = "@xz_archive//:lzma",
        )

    native.bind(
        name = "eigen",
        actual = "@eigen_archive//:eigen",
        )

    native.bind(
        name = "pybind11_py35m",
        actual = "@pybind11_archive//:pybind11_py35m",
        )
