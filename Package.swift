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
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-102342/libnumpy.xcframework.zip", checksum: "394df2389aad4678e25ae8f05cea4e0ffb315ea005227761b2b32e4f9a633863"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-102342/libnpymath.xcframework.zip", checksum: "82736cfe5a1f5f95d7210f405873e5219553baf52069b6f98dbf9f9378dee908"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-102342/libnpyrandom.xcframework.zip", checksum: "34fc83a5cfc4bc6b0fc02662cf74c8065ed796e0c78e964f1fb0a598c6224012"),
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
