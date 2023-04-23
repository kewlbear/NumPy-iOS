// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NumPy-iOS",
    products: [
        .library(
            name: "NumPy-iOS",
            targets: ["libnumpy", "libnpymath", "libnpyrandom", "Link", "NumPySupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/Python-iOS.git", from: "0.1.1-b"),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", path: "kivy-ios/libnumpy.xcframework"),
        .binaryTarget(name: "libnpymath", path: "kivy-ios/libnpymath.xcframework"),
        .binaryTarget(name: "libnpyrandom", path: "kivy-ios/libnpyrandom.xcframework"),
        .target(
            name: "Link",
            dependencies: ["libnumpy", "libnpymath", "libnpyrandom", "Python-iOS"],
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
