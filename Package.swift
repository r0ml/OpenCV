// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v15), .iOS(.v18), .macCatalyst(.v18)
  ],
  products: [
    .library(name: "OpenCV",
             targets: ["OpenCV"]
             ),
  ],
  targets: [
     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/5.0.2/OpenCV.xcframework.zip",
                  checksum: "0e314c21eb9fdb74ad7ba3657614faff8ccffcb0a1f812abed461d948ebc8612"),
  ]
)

