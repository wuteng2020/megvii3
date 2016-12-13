def check_version(expected_versions):
    if "bazel_version" in dir(native) and native.bazel_version:
        current_bazel_version = native.bazel_version
        if not current_bazel_version in expected_versions:
            fail("\nCurrent Bazel version is {}, expected {}\n".format(
                    native.bazel_version, expected_versions))
    else:
        fail("\nCurrent Bazel version is unknown, expected {}\n".format(
                expected_versions))
