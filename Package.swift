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
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("kivy-ios")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20211111000853/libnumpy.xcframework.zip", checksum: "6a420ac88cfb01aef2f68d5ad0b3c96961c6534c27cb0b5f3d1e3d28d32f2383"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20211111000853/libnpymath.xcframework.zip", checksum: "8ca873f890f011a9c3f3e3d396dc542aacd569a069e6ec2e71c1bad40abc2a63"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20211111000853/libnpyrandom.xcframework.zip", checksum: "dd4251ac17b05e0e0ad4bc501c236d2515ed25ac3ef3514259e66a466f45da95"),
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
