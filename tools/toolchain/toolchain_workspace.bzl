def load_toolchain_libraries(repo):
    native.new_http_archive(
        name = "toolchain_v3_archive",
        url = repo + "/toolchain-v3-4.9.4.tar.bz2",
        sha256 = "95181c81c72b764034b8598eecc5e319441b8edbbaadd7b404a33b19997d93d5",
        build_file = "tools/toolchain/v3/v3.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_gcc5_archive",
        url = repo + "/toolchain-v3-5.4.0-r3.tar.bz2",
        sha256 = "df00d7862d9993303776ec7c7976a60a5dd98df3068af83c48d472889569dab8",
        build_file = "tools/toolchain/v3/v3.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_piii_archive",
        url = repo + "/toolchain-v3-piii-5.4.0-r1.tar.bz2",
        sha256 = "09c98eee0d558a2b86e2086b641f1d5087ff6175a4f00697ada9b2c4078abbed",
        build_file = "tools/toolchain/v3/v3-piii.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_tk1_archive",
        url = repo + "/toolchain-v3-tk1-4.8.5-r2.tar.bz2",
        sha256 = "96819fb997f5fc1c0a6f02ebb7556ef57347d040f955ee15de280ff8f3b8ea96",
        build_file = "tools/toolchain/v3/v3-tk1.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_tk1_gcc5_archive",
        url = repo + "/toolchain-v3-tk1-5.4.0.tar.bz2",
        sha256 = "a077642b73f0a87150f19c501bec89b0fb005cb2772a3dc9760613e7cef3cb62",
        build_file = "tools/toolchain/v3/v3-tk1.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_tx1_archive",
        url = repo + "/toolchain-v3-tx1-5.4.0-r1.tar.bz2",
        sha256 = "e6e6741e3446c9be5e2e385e3f71af75031c5d01c1d07f40cdca61cfb1a40193",
        build_file = "tools/toolchain/v3/v3-tx1.BUILD",
        )

    native.new_http_archive(
        name = "android_ndk_r14b_armv7_archive",
        url = repo + "/android-ndk-r14b-armv7-api14.tar.bz2",
        sha256 = "8fee555effc6e08863c55902ad9349b3c06cde3f4d605bc491d37b4a80aee511",
        build_file = "tools/toolchain/android-ndk-r14b/armv7.BUILD",
        )

    native.new_http_archive(
        name = "android_ndk_r14b_aarch64_archive",
        url = repo + "/android-ndk-r14b-aarch64-api21.tar.bz2",
        sha256 = "130cde27cc67fc193eb9e51686d393a82a5717335dd49dcad23ca0f328a45785",
        build_file = "tools/toolchain/android-ndk-r14b/aarch64.BUILD",
        )

    native.new_http_archive(
        name = "android_ndk_r14b_piii_archive",
        url = repo + "/android-ndk-r14b-x86_32-api14.tar.bz2",
        sha256 = "c244b407e9a32cfdd078acdb0278ae0359cdbedb0136d75591312cdc9173d18c",
        build_file = "tools/toolchain/android-ndk-r14b/piii.BUILD",
        )

    native.new_http_archive(
        name = "ios_sdk_8_archive",
        url = repo + "/ios-sdk-8.2.1.tar.bz2",
        sha256 = "549f80037c3ceac0fe2cfb4843f890a4d908fc72102ab074576c5a69ceb57202",
        build_file = "tools/toolchain/ios-sdk-8/ios-sdk.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_cctools_archive",
        url = repo + "/v3-ios-cctools-20170323.tar.bz2",
        sha256 = "b3a86c5456a474e9c32c8326fc3a76cd0863ad81b95177c3decd1d97f5cfaf7b",
        build_file = "tools/toolchain/ios-sdk-8/cctools.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_clang_archive",
        url = repo + "/v3-clang-3.9.tar.bz2",
        sha256 = "0b9316ca97cef5eba17f58aa4d552c40efcb33c74a36a55d46928518ade93b6f",
        build_file = "tools/toolchain/v3/v3-clang.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_v3_xar_archive",
        url = repo + "/v3-xar.tar.bz2",
        sha256 = "771859bd83dc77593770d497ff898983da80c8f4426f8bb993476ee3217e43d5",
        build_file = "tools/toolchain/ios-sdk-8/xar.BUILD",
        )

    native.new_http_archive(
        name = "toolchain_potato_archive",
        url = repo + "/potato-gcc540.tar.bz2",
        sha256 = "58f83cf0e24f9db9c1dfdb4a954b9ee9ad8ba79978c678521efbb3b988f0a28e",
        build_file = "tools/toolchain/potato/potato.BUILD",
        )

    native.new_http_archive(
        name = "cuda_6_5_archive",
        url = repo + "/cuda-6.5.45-minimal.tar.bz2",
        sha256 = "99412822a852c4288c5646c04ab03ac263496be1c58cacc2e319f090492c5378",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_7_5_archive",
        url = repo + "/cuda-7.5.14-minimal.tar.bz2",
        sha256 = "45472a3b3276ccf8114ff187af2325e4c105cd9bf5686a0139cf5eb3381b11e6",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_8_0_archive",
        url = repo + "/cuda-8.0.61-minimal.tar.bz2",
        sha256 = "e7f0d83d7e3c515dd2a524f959a34f2e8563d898d8f8c293c2f72e1c4a7d76dc",
        build_file = "tools/toolchain/cuda-minimal.BUILD",
        )

    native.new_http_archive(
        name = "cuda_6_5_armv7libs_archive",
        url = repo + "/cuda-6.5.53-armv7libs.tar.bz2",
        sha256 = "d9f732853629a7917b6937fbe1d3e45263fa042540ee3dbf70a565e78f951218",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_8_0_tx1libs_archive",
        url = repo + "/cuda-8.0.33-tx1libs.tar.bz2",
        sha256 = "c200c93d5952a1e546b63bfc4f2abfc4c200523b23e78bae6a27407d516b7baa",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_7_5_x86_64libs_archive",
        url = repo + "/cuda-7.5.14-x86_64libs.tar.bz2",
        sha256 = "9f15de08a08ff125b7f3893d05855615ca71842b6cc1c725da40fe496c50f998",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cuda_8_0_x86_64libs_archive",
        url = repo + "/cuda-8.0.61-x86_64libs.tar.bz2",
        sha256 = "19b2b606fade3c407b01df2a274b1ba664f27ccb42730f685390332a26233625",
        build_file = "tools/toolchain/cuda-libs.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_4_x86_64_archive",
        url = repo + "/cudnn-x86_64-4.0.7.tar.bz2",
        sha256 = "0e62f211f606b413d9326ab1e63fe6203b87fb235cf6cbd0d996251f2ed55fd4",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_x86_64_archive",
        url = repo + "/cudnn-x86_64-6.0.20-cuda7.5.tar.bz2",
        sha256 = "eb31ebd1b99ca9f2ea869ba4cfa54e8806461808c20f202171942bb27238064f",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_x86_64_cuda8_archive",
        url = repo + "/cudnn-x86_64-6.0.20-cuda8.tar.bz2",
        sha256 = "2c280d6d1cbc09296deaa6213f5fb8f63db61bdd0b937eea643f63cfc5bc7c6a",
        build_file = "third_party/cudnn-x86_64.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_armv7_archive",
        url = repo + "/cudnn-armv7-4.0.7.tar.bz2",
        sha256 = "9c4d348f6eda0455f0461beeeac57cb6672631198681db144abe2ff8ff213771",
        build_file = "third_party/cudnn-armv7.BUILD",
        )

    native.new_http_archive(
        name = "cudnn_aarch64_archive",
#        url = repo + "/cudnn-tx1-5.1.5.tar.bz2",
#        sha256 = "0f29777dcefb89b65c4cfab00eca63690212d9344f0db16842a2d6bf48e0573f",
        url = repo + "/cudnn-tx1-5.0.4.tar.bz2",
        sha256 = "23259bc387fbd199eea2cfb1902b10257ed9d6a8d875863167a3bf193fac3783",
        build_file = "third_party/cudnn-x86_64.BUILD", # Reusing existing BUILD files
        )

    native.new_http_archive(
        name = "nasm_archive",
        url = repo + "/nasm-2.12.02.tar.bz2",
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
