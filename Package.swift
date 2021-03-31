// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NumPy-iOS",
    products: [
        .library(
            name: "NumPy-iOS",
            targets: ["libnumpy", "libnpymath", "libnpysort", "Link", "NumPySupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("kivy-ios")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.1-20210331/libnumpy.xcframework.zip", checksum: "d01a51a52a650711d808ad7dddecf021b2c31d00abedff280cac7ad4a1a2a606"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.1-20210331/libnpymath.xcframework.zip", checksum: "baeda208f67d383b8cd2dea2cfbc4c235daaf808ea13f5df7e6f51ca764e256d"),
        .binaryTarget(name: "libnpysort", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.1-20210331/libnpysort.xcframework.zip", checksum: "08f122f543849ecffeac6b1c14dbb0625e5b7cfb3175eef128045a8884dcd5e6"),
        .target(
            name: "Link",
            dependencies: ["libnumpy", "libnpymath", "libnpysort", "Python-iOS"],
            linkerSettings: [.linkedFramework("Accelerate")]),
        .target(
            name: "NumPySupport",
            dependencies: ["Python-iOS"],
            resources: [.copy("site-packages")]),
        .testTarget(
            name: "NumPy-iOSTests",
            dependencies: ["NumPySupport"]),
    ]
)
