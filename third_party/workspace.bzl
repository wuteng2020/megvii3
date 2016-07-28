def megvii3_workspace(path_prefix = "third_party/"):
    native.new_http_archive(
        name = "zlib_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/zlib-1.2.8.tar.gz",
        sha256 = "36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d",
        build_file = path_prefix + "zlib.BUILD",
        )

    native.new_http_archive(
        name = "jpeg_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/jpegsrc.v9a.tar.gz",
        sha256 = "3a753ea48d917945dd54a2d97de388aa06ca2eb1066cbfdc6652036349fe05a7",
        build_file = path_prefix + "jpeg.BUILD",
        )
  
    native.new_http_archive(
        name = "png_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/libpng-v1.2.53.zip",
        sha256 = "c35bcc6387495ee6e757507a68ba036d38ad05b415c2553b3debe2a57647a692",
        build_file = path_prefix + "png.BUILD",
        )

    native.new_http_archive(
        name = "opencv2_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/opencv-2.4.13.zip",
        sha256 = "fa6a45f635f4e1dbc982b8ccc93206650e7fc584b2f3dd945759ce28b047b94f",
        build_file = path_prefix + "opencv2.BUILD",
        )

    native.new_http_archive(
        name = "opencv3_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/opencv-3.1.0.zip",
        sha256 = "1f6990249fdb82804fff40e96fa6d99949023ab0e3277eae4bd459b374e622a4",
        build_file = path_prefix + "opencv3.BUILD",
        )
    
    native.new_http_archive(
        name = "gtest_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/gtest-1.7.0.zip",
        sha256 = "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d",
        build_file = path_prefix + "gtest.BUILD",
        )

    native.new_http_archive(
        name = "intel_mkl_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/intel-mkl-static-11.3.3.zip",
        sha256 = "e37e6865e3071c3ea6fb2784a06262b4779f7c9b1774f80edf836ebeb840a6c1",
        build_file = path_prefix + "intel-mkl.BUILD",
        )
