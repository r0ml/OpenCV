// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v18), .iOS(.v18), .macCatalyst(.v18)
  ],
  products: [
    .library(name: "OpenCV",
             targets: ["OpenCV"]
             ),
  ],
  targets: [
     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.12.1/OpenCV.xcframework.zip",
                  checksum: "7396cdb9cd39c9f281460fd2d568a77286d198285457f922f646f589d841e9dd"),
  ]
)

