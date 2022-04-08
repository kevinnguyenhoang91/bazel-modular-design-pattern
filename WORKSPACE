workspace(name = "modular_pattern_example_workspace")

local_repository(
    name = "modular_pattern_example",
    path = ".",
)

register_toolchains("@modular_pattern_example//:py-toolchain")

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

# Apple Bazel Rules Dependency

RULES_APPLE_VERSION = "vinone-0.21.2.2"

RULES_APPLE_SHA = "e8fccef2e28e2205308255847b98aa5e4ffb0244122eb80c2dfaa565ae1ce476"

RULES_APPLE_VERSION_PREFIX = "rules_apple-vinone-0.21.2.2"

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = RULES_APPLE_SHA,
    strip_prefix = RULES_APPLE_VERSION_PREFIX,
    urls = ["https://github.com/diesel-engineer/rules_apple/archive/%s.tar.gz" % RULES_APPLE_VERSION],
)

http_archive(
    name = "build_bazel_apple_support",
    sha256 = "02ac04ff0a0de1e891a1fa8839cc6a5957e3c4a80856545aa35a786d15aad108",
    urls = ["https://github.com/bazelbuild/apple_support/releases/download/0.9.1/apple_support.0.9.1.tar.gz"],
)

# Swift Bazel Rules Depenency

RULES_SWIFT_VERSION = "vinone-0.18.1"

RULES_SWIFT_SHA = "a065a2aabffc6e8ddee6988d407c8a2ca46a8c61c78c96d6ff07601ee5427b26"

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = RULES_SWIFT_SHA,
    strip_prefix = "rules_swift-%s" % RULES_SWIFT_VERSION,
    url = "https://github.com/kevinnguyenhoang91/rules_swift/archive/%s.tar.gz" % RULES_SWIFT_VERSION,
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@bazel_skylib//:workspace.bzl",
    "bazel_skylib_workspace",
)

bazel_skylib_workspace()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()

# Rules Go Dependency

RULES_GO_VERSION = "0.18.6"

RULES_GO_SHA = "f04d2373bcaf8aa09bccb08a98a57e721306c8f6043a2a0ee610fd6853dcde3d"

http_archive(
    name = "io_bazel_rules_go",
    sha256 = RULES_GO_SHA,
    urls = ["https://github.com/bazelbuild/rules_go/releases/download/%s/rules_go-%s.tar.gz" % (RULES_GO_VERSION, RULES_GO_VERSION)],
)

load(
    "@io_bazel_rules_go//go:deps.bzl",
    "go_register_toolchains",
    "go_rules_dependencies",
)

go_rules_dependencies()

go_register_toolchains()

# Buidifier (BUILD formatter) tools Dependency

BAZELBUILD_BUILDTOOLS_VERSION = "0.29.0"

BAZELBUILD_BUILDTOOLS_SHA = "05eb52437fb250c7591dd6cbcfd1f9b5b61d85d6b20f04b041e0830dd1ab39b3"

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = BAZELBUILD_BUILDTOOLS_SHA,
    strip_prefix = "buildtools-%s" % BAZELBUILD_BUILDTOOLS_VERSION,
    urls = ["https://github.com/bazelbuild/buildtools/archive/%s.zip" % BAZELBUILD_BUILDTOOLS_VERSION],
)

load(
    "@com_github_bazelbuild_buildtools//buildifier:deps.bzl",
    "buildifier_dependencies",
)

buildifier_dependencies()

# Tulsi Dependency

TULSI_VERSION = "tulsi-4.0.0.7"

TULSI_SHA = "27b57578ad44750dfe5d2c56c2f207003ff6073051e3461e47a802ae3e25526c"

http_archive(
    name = "tulsi",
    sha256 = TULSI_SHA,
    strip_prefix = "tulsi-tulsi-4.0.0.7",
    urls = ["https://github.com/kevinnguyenhoang91/tulsi/archive/%s.tar.gz" % TULSI_VERSION],
)

# Other dependencies

BAZEL_LINE_VERSION = "vinone-v0.2"

BAZEL_LINE_SHA = "a2eba939bef380dba4a19a0744541d9b0efb86a3f1efc365fac8e0d9e1b5e0bd"

http_archive(
    name = "rules_apple_line",
    urls = ["https://github.com/diesel-engineer/bazel_rules_apple/archive/%s.tar.gz" % BAZEL_LINE_VERSION],
    sha256 = BAZEL_LINE_SHA,
    strip_prefix = "bazel_rules_apple-%s" % BAZEL_LINE_VERSION,
)

rules_apple_line_dependencies()

load(
    "@modular_pattern_example//lib:register_libraries.bzl",
    "library",
)

library("Lottie", "3.1.6")


