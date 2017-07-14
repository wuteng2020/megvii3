def load_third_party_libraries(repo):
    native.new_http_archive(
        name = "zlib_archive",
        url = repo + "/zlib-1.2.11.tar.gz",
        sha256 = "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
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
        url = repo + "/opencv-2.4.13.2.tar.gz",
        sha256 = "4b00c110e6c54943cbbb7cf0d35c5bc148133ab2095ee4aaa0ac0a4f67c58080",
        build_file = "third_party/opencv2.BUILD",
        strip_prefix = "opencv-2.4.13.2",
        )

    native.new_http_archive(
        name = "opencv3_archive",
        url = repo + "/opencv-3.2.0.tar.gz",
        sha256 = "b9d62dfffb8130d59d587627703d5f3e6252dce4a94c1955784998da7a39dd35",
        build_file = "third_party/opencv3.BUILD",
        strip_prefix = "opencv-3.2.0",
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
        url = repo + "/intel-mkl-static-2017.3.196-premerged.tar.bz2",
        sha256 = "3cd133f89ac64047390152113060f91bf2d9609343f88d4f99c641f7949a4f6a",
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
        url = repo + "/utfcpp-2.3.5.tar.gz",
        sha256 = "f3ffe0ef6c02f48ebafe42369cbd741e844143baad27c13baad1cd14b863983d",
        build_file = "third_party/utf8.BUILD",
        strip_prefix = "utfcpp-2.3.5/source",
        )

    native.new_http_archive(
        name = "eigen_archive",
        url = repo + "/eigen-3.3.4.tar.bz2",
        sha256 = "dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6",
        build_file = "third_party/eigen.BUILD",
        strip_prefix = "eigen-eigen-5a0156e40feb",
        )

    native.new_http_archive(
        name = "flatbuffers_archive",
        url = repo + "/flatbuffers-1.6.0.tar.gz",
        sha256 = "768c50ebf5823f8cde81a9e38ffff115c8f5a5d031a37520d0024e7b9c6cd22e",
        build_file = "third_party/flatbuffers.BUILD",
        strip_prefix = "flatbuffers-1.6.0",
        )

    native.new_http_archive(
        name = "boost_archive",
        url = repo + "/boost_1_64_0.tar.bz2",
        sha256 = "7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332",
        build_file = "third_party/boost.BUILD",
        strip_prefix = "boost_1_64_0",
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
        url = repo + "/xz-5.2.3.tar.bz2",
        sha256 = "fd9ca16de1052aac899ad3495ad20dfa906c27b4a5070102a2ec35ca3a4740c1",
        build_file = "third_party/xz.BUILD",
        strip_prefix = "xz-5.2.3",
        )

    native.new_http_archive(
        name = "pybind11_archive",
        url = repo + "/pybind11-2.1.1.tar.gz",
        sha256 = "f2c6874f1ea5b4ad4ffffe352413f7d2cd1a49f9050940805c2a082348621540",
        build_file = "third_party/pybind11.BUILD",
        )

    native.new_http_archive(
        name = "python35m_headers_archive",
        url = repo + "/python-3.5.2-headers.tar.bz2",
        sha256 = "b5b20a206a06b5ea7ad537c4611aebdfb7880acd249cdaf469ff5a8e0e832b69",
        build_file = "third_party/python-3.5m-headers.BUILD",
        )

    native.new_http_archive(
        name = "google_benchmark_archive",
        url = repo + "/google-benchmark-1.1.0.zip",
        sha256 = "3f5321836cf531e621e0187ccbb1d836cd909994ed00c102a41385cbc1254e4e",
        build_file = "third_party/google-benchmark.BUILD",
        strip_prefix = "benchmark-1.1.0",
        )

    native.http_archive(
        name = "com_github_gflags_gflags",
        url = repo + "/gflags-2.2.1.tar.gz",
        sha256 = "ae27cdbcd6a2f935baa78e4f21f675649271634c092b1be01469440495609d0e",
        strip_prefix = "gflags-2.2.1",
        )

    native.new_http_archive(
        name = "ceres_solver_archive",
        url = repo + "/ceres-solver-1.12.0.tar.gz",
        sha256 = "745bfed55111e086954126b748eb9efe20e30be5b825c6dec3c525cf20afc895",
        build_file = "third_party/ceres-solver.BUILD",
        strip_prefix = "ceres-solver-1.12.0",
        )

    native.new_http_archive(
        name = "glog_archive",
        url = repo + "/glog-0.3.5.tar.gz",
        sha256 = "7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0",
        build_file = "third_party/glog.BUILD",
        strip_prefix = "glog-0.3.5",
        )

    native.bind(
        name = "opencv3_core",
        actual = "@opencv3_archive//:core",
        )

    native.bind(
        name = "opencv3_calib3d",
        actual = "@opencv3_archive//:calib3d",
        )

    native.bind(
        name = "opencv3_features2d",
        actual = "@opencv3_archive//:features2d",
        )

    native.bind(
        name = "opencv3_flann",
        actual = "@opencv3_archive//:flann",
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
        name = "opencv3_objdetect",
        actual = "@opencv3_archive//:objdetect",
        )

    native.bind(
        name = "opencv3_photo",
        actual = "@opencv3_archive//:photo",
        )

    native.bind(
        name = "opencv3_shape",
        actual = "@opencv3_archive//:shape",
        )

    native.bind(
        name = "opencv3_stitching",
        actual = "@opencv3_archive//:stitching",
        )

    native.bind(
        name = "opencv3_superres",
        actual = "@opencv3_archive//:superres",
        )

    native.bind(
        name = "opencv3_video",
        actual = "@opencv3_archive//:video",
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
        name = "opencv3_cudafeatures2d",
        actual = "@opencv3_archive//:cudafeatures2d",
        )

    native.bind(
        name = "opencv3_cudafilters",
        actual = "@opencv3_archive//:cudafilters",
        )

    native.bind(
        name = "opencv3_cudaimgproc",
        actual = "@opencv3_archive//:cudaimgproc",
        )

    native.bind(
        name = "opencv3_cudaobjdetect",
        actual = "@opencv3_archive//:cudaobjdetect",
        )

    native.bind(
        name = "opencv3_cudaoptflow",
        actual = "@opencv3_archive//:cudaoptflow",
        )

    native.bind(
        name = "opencv3_cudastereo",
        actual = "@opencv3_archive//:cudastereo",
        )

    native.bind(
        name = "opencv3_cudawarping",
        actual = "@opencv3_archive//:cudawarping",
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

    native.bind(
        name = "google-benchmark",
        actual = "@google_benchmark_archive//:benchmark",
        )
    
    native.bind(
        name = "gflags",
        actual = "@com_github_gflags_gflags//:gflags",
        )
    
    native.bind(
        name = "glog",
        actual = "@glog_archive//:glog",
        )
