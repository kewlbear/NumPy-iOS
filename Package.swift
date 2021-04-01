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
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401061219/libnumpy.xcframework.zip", checksum: "a97451931ce6d83daebd12e29890af2f109ab8df0549b1ec320f5ea933de373d"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401061219/libnpymath.xcframework.zip", checksum: "197f512f3e95c3639d848d516fdffc37bad9bfc052d252fd15320aa2712ae1ae"),
        .binaryTarget(name: "libnpysort", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401061219/libnpysort.xcframework.zip", checksum: "a435d41bf22a89b8b3d8126ce6ec650a44b71344bd1335038829a6b9a8350dc5"),
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
