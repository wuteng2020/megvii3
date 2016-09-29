def load_toolchain_libraries():
    native.new_http_archive(
        name = "toolchain_v3_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-4.9.4.tar.bz2",
        sha256 = "95181c81c72b764034b8598eecc5e319441b8edbbaadd7b404a33b19997d93d5",
        build_file = "tools/toolchain/v3/v3.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_gcc5_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-5.4.0-r1.tar.bz2",
        sha256 = "521dfbce6d2b4bff0365bdaf07bee081813325c66c4d3ca2a72a3c1504e75316",
        build_file = "tools/toolchain/v3/v3.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_tk1_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-tk1-4.8.5.tar.bz2",
        sha256 = "17aee8f574f39d99fd243147cf4a9bb18c6987581dde9cf36b7eba2754fbe2b4",
        build_file = "tools/toolchain/v3/v3-tk1.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_tx1_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/toolchain-v3-tx1-4.9.3.tar.bz2",
        sha256 = "d2dd6195db99641a1248f1b7f2fe522459290fce74c05e34cbfda37c0fb94aeb",
        build_file = "tools/toolchain/v3/v3-tx1.BUILD",
        )

    native.new_http_archive(
        name = "android_ndk_r12b_armv7_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/android-ndk-r12b-armv7-api14.tar.bz2",
        sha256 = "94c8d38e5e3bd0d844cfbab481786439bc50551576d6096ed5391ec607c19e15",
#    url = "http://master.br.megvii-inc.com/download/yangyi/android-ndk-r12b-armv7.tar.bz2",
#    sha256 = "2bff93fc35b518a1967f0ffea8136425cac00b6f8bb0da9d1d383627ef8581cc",
        build_file = "tools/toolchain/android-ndk-r12b/armv7.BUILD",
        )

    native.new_http_archive(
        name = "android_ndk_r12b_aarch64_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/android-ndk-r12b-aarch64.tar.bz2",
        sha256 = "6e91d9ef7801e3d0481d8927cd51992ff5eba6214425912e66699d11f74d3dab",
        build_file = "tools/toolchain/android-ndk-r12b/aarch64.BUILD",
        )

    native.new_http_archive(
        name = "ios_sdk_7_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/ios-sdk-7.3.1.tar.bz2",
        sha256 = "fae34c7203d71edc4a7fb914e9cd0eecdf8bb871293607d80788e9c5a1099e53",
        build_file = "tools/toolchain/ios-sdk-7/ios-sdk.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_cctools_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/v3-ios-cctools.tar.bz2",
        sha256 = "e83203e2a86e21e8055e32c7cdeb236f29a06955a98af01b21ef60473229e5fe",
        build_file = "tools/toolchain/ios-sdk-7/cctools.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_clang_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/v3-clang-3.9.tar.bz2",
        sha256 = "0b9316ca97cef5eba17f58aa4d552c40efcb33c74a36a55d46928518ade93b6f",
        build_file = "tools/toolchain/v3/v3-clang.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_xar_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/v3-xar.tar.bz2",
        sha256 = "771859bd83dc77593770d497ff898983da80c8f4426f8bb993476ee3217e43d5",
        build_file = "tools/toolchain/ios-sdk-7/xar.BUILD",
        )

    native.new_http_archive(
        name = "cuda_6_5_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-6.5.45-minimal.tar.bz2",
        sha256 = "99412822a852c4288c5646c04ab03ac263496be1c58cacc2e319f090492c5378",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_7_0_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.0.74-minimal.tar.bz2",
        sha256 = "56f94f2f81d6c42b65170686dc7ddb605dd66dfeacbc6dc999763e36f466f3d8",
        build_file = "tools/toolchain/cuda-minimal.BUILD", # Reusing existing BUILD files
        )

    native.new_http_archive(
        name = "cuda_7_5_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.5.14-minimal.tar.bz2",
        sha256 = "45472a3b3276ccf8114ff187af2325e4c105cd9bf5686a0139cf5eb3381b11e6",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_8_0_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-8.0.27-minimal.tar.bz2",
        sha256 = "1e80618b6a7eacfe8a35bce8ed0ac8782783d6aff9f32d147474c01ce3fe1589",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_6_5_armv7libs_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-6.5.53-armv7libs.tar.bz2",
        sha256 = "d9f732853629a7917b6937fbe1d3e45263fa042540ee3dbf70a565e78f951218",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_7_0_aarch64libs_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.0.76-aarch64libs.tar.bz2",
        sha256 = "84b7d6357420b6cd15594c7e50817840188e7f68426735e8c387ae349916f45c",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_7_5_x86_64libs_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-7.5.14-x86_64libs.tar.bz2",
        sha256 = "9f15de08a08ff125b7f3893d05855615ca71842b6cc1c725da40fe496c50f998",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_8_0_x86_64libs_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cuda-8.0.27-x86_64libs.tar.bz2",
        sha256 = "91ec4d6e2f5f24f0d217ab6a77d1dc6f42aba3b15a8801f0da0c9796f249c65f",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_4_x86_64_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-4.0.7.tar.bz2",
        sha256 = "0e62f211f606b413d9326ab1e63fe6203b87fb235cf6cbd0d996251f2ed55fd4",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_x86_64_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.1.3.tar.bz2",
        sha256 = "f42d2bbad8ce3d96f0dc964dde429db8eadb5719b7a07fb89ea906d39b326024",
#    url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.0.5.tar.bz2",
#    sha256 = "02203308c7c51b7202719670850b773e1f051b1fada3faa4b965e32a2b2f06a7",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_x86_64_cuda8_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-x86_64-5.1.5-cuda8.tar.bz2",
        sha256 = "e6aed4fe736e834de5cfbb6e56f6e4899d1f816e354edf3a00b69288bde46e5b",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_armv7_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-armv7-4.0.7.tar.bz2",
        sha256 = "9c4d348f6eda0455f0461beeeac57cb6672631198681db144abe2ff8ff213771",
        build_file = "third_party/cudnn-armv7.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_aarch64_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/cudnn-aarch64-4.0.7.tar.bz2",
        sha256 = "bb3ddb695bf4bf64bafe54519bb9c7f678889f3b60a0b8d3d574373debb5bd5c",
        build_file = "third_party/cudnn-x86_64.BUILD", # Reusing existing BUILD files
        )

    native.new_http_archive(
        name = "nasm_archive",
        url = "http://master.br.megvii-inc.com/download/yangyi/nasm-2.12.02.tar.bz2",
        sha256 = "00b0891c678c065446ca59bcee64719d0096d54d6886e6e472aeee2e170ae324",
        build_file = "tools/toolchain/nasm.BUILD",
        strip_prefix = "nasm-2.12.02",
        )
    native.bind(
        name = "cudnn_x86_64",
        actual = "@cudnn_x86_64_archive//:cudnn",
        )

    native.bind(
        name = "cudnn_x86_64_cuda8",
        actual = "@cudnn_x86_64_cuda8_archive//:cudnn",
        )

    native.bind(
        name = "cudnn_armv7",
        actual = "@cudnn_armv7_archive//:cudnn",
        )

    native.bind(
        name = "cudnn_aarch64",
        actual = "@cudnn_aarch64_archive//:cudnn",
        )
