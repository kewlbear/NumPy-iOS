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
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210416074124/libnumpy.xcframework.zip", checksum: "96261a928f6900a2125310f205d32b090351202d0643beee3b429a9db4e698bb"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210416074124/libnpymath.xcframework.zip", checksum: "deb3be8d26a92df0fc05b3681fca34fc1646471f69a2aac4211f637b53b79b90"),
        .binaryTarget(name: "libnpysort", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210416074124/libnpysort.xcframework.zip", checksum: "558a627dba2cc97a92719d61d92d4eb04aa26c0485e433a4ef7adf979e62bda2"),
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
