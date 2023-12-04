// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenCV",
    platforms: [
      .macOS(.v11), .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OpenCV",
            targets: ["OpenCV", "OpenCVRemote", "OpenCVLocal"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OpenCV"),
        /*
        .testTarget(
            name: "OpenCVTests",
            dependencies: ["OpenCV"]),
         */
        .binaryTarget(name: "OpenCVLocal", path: "build_xcframework/OpenCV.xcframework"),
        .binaryTarget(name: "OpenCVRemote",
                      url: "",
                      checksum: "7cff905c62527736bef01fd356703a2d750c8a9190f9e0dd568b34f55b9b79d5"),
    ]
)
