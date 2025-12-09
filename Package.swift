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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.10.3/OpenCV.xcframework.zip",
                  checksum: "50dd78ae8c26c15bdc77eed9e6aefc07df68830816a5e35ead755e9355fdfe03"),
  ]
)

