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
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-094055/libnumpy.xcframework.zip", checksum: "5fbe1b82a1275f6521a5196cf25b91cf19ed4eb35de2ec259af41b6f66e4ca63"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-094055/libnpymath.xcframework.zip", checksum: "cee827d1bd5bfbb49800ac92847dd32c9ecb8210332a97017514fcb41dc337c8"),
        .binaryTarget(name: "libnpyrandom", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/v0.1.1-b20230423-094055/libnpyrandom.xcframework.zip", checksum: "44db3e4525b13fa8f12fd33b691cc0e417a8c266be3e91a50e87ded465a214ed"),
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
