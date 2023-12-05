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
            targets: ["OpenCV"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
/*        .binaryTarget(name: "OpenCVLocal",
                      path: "build_xcframework/OpenCV.xcframework"
                     ),
 */
        .binaryTarget(name: "OpenCV",
                      url: "https://github.com/r0ml/OpenCV/releases/download/4.8.1/OpenCV.xcframework.zip",
                      checksum: "7cff905c62527736bef01fd356703a2d750c8a9190f9e0dd568b34f55b9b79d5"),
    ]
)
