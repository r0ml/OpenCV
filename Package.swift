// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v15), .iOS(.v18), // .macCatalyst(.v18)
  ],
  products: [
    .library(name: "OpenCV",
             targets: ["OpenCV"]
             ),
  ],
  targets: [
     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/5.0.0/OpenCV.xcframework.zip",
                  checksum: "178fb8f90aa991809ba576f4514636ca8637f309a7a047b0fc2a8c581440b83b"),
  ]
)

