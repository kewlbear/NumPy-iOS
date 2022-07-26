// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NumPy-iOS",
    products: [
        .library(
            name: "NumPy-iOS",
            targets: ["libnumpy", "libnpymath", "libnpyrandom", "NumPySupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("3.8_kivy-ios")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210504052912/libnumpy.xcframework.zip", checksum: "0ce9e9f25e127b2f2925d2046b2ac5cb0ccaa6651b64541f16b24baf81c7094b"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210504052912/libnpymath.xcframework.zip", checksum: "a2385b000e873692b4a25f891be0896518bace00bc855f4d41a1e6a4f7011eeb"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210504052912/libnpyrandom.xcframework.zip", checksum: "2e34f4f9105c1e488597c4c5e808b5adefc3d187fa07b6775bb4f0714481fe6e"),
        .target(
            name: "NumPySupport",
            dependencies: ["libnumpy", "libnpymath", "libnpyrandom", "Python-iOS"],
            resources: [.copy("site-packages")],
            linkerSettings: [
                .linkedFramework("Accelerate"),
                .unsafeFlags([
                    "-all_load"
                ])
            ]),
        .testTarget(
            name: "NumPy-iOSTests",
            dependencies: ["NumPySupport"]),
    ]
)
