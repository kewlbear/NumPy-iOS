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
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210412051018/libnumpy.xcframework.zip", checksum: "e1f04f5e5d655877ca2bd54aa333975a1865c653c1b3562537a186156f7ce549"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210412051018/libnpymath.xcframework.zip", checksum: "416770718c9215da168a861ed98ee79fb1358a18a2cde103f79eec43a333d2f5"),
        .binaryTarget(name: "libnpysort", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210412051018/libnpysort.xcframework.zip", checksum: "c5d008e9c46aa396ac4544c67bc8cb12a44fbe87efa58967ee22bd2e4c0d1b3f"),
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
