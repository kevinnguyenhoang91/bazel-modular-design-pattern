workspace(name = "modular_pattern_example_workspace")

local_repository(
    name = "modular_pattern_example",
    path = ".",
)

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)
load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "git_repository",
)

# Apple Bazel Rules Dependency

RULES_APPLE_VERSION = "v3.3.0.rules_apple.3.2"

RULES_APPLE_SHA = "0b8bd9f3a4a9a49dc1f50c6e3720625f78f0204449a620a7a5bca136059f29e2"

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = RULES_APPLE_SHA,
    strip_prefix = "rules_apple-3.3.0.rules_apple.3.2",
    urls = ["https://github.com/diesel-engineer/rules_apple/archive/%s.tar.gz" % RULES_APPLE_VERSION],
)

git_repository(
    name = "build_bazel_apple_support",
    commit = "501b4afb27745c4813a88ffa28acd901408014e4",
    remote = "https://github.com/bazelbuild/apple_support.git",
)

# Swift Bazel Rules Depenency

RULES_SWIFT_VERSION = "vinone-0.13.5"

RULES_SWIFT_SHA = "bff012f95292a24adb98495d2983203cfb2fc179af08d6a9affb0b84b5540c90"

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

TULSI_VERSION = "v3.3.0.tulsi.3"

TULSI_SHA = "5a3a35dba5ecb14fa64e13d25f56f6b8d10add926a5ca5b0d17034513bba5564"

http_archive(
    name = "tulsi",
    sha256 = TULSI_SHA,
    strip_prefix = "tulsi-3.3.0.tulsi.3",
    urls = ["https://github.com/kevinnguyenhoang91/tulsi/archive/%s.tar.gz" % TULSI_VERSION],
)

# Other dependencies

load(
    "@modular_pattern_example//lib:register_libraries.bzl",
    "library",
)

library("Lottie", "3.1.6")


