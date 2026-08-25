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
                  url: "https://github.com/r0ml/OpenCV/releases/download/5.0.5/OpenCV.xcframework.zip",
                  checksum: "197030f79217b3cafdd69026d9ea8b04e45709fb28e4ae969db7237cc37d8be8"),
  ]
)

