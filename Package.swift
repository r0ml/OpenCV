// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v11), .iOS(.v16), .macCatalyst(.v16)
  ],
  products: [
    .library(
      name: "OpenCV",
      targets: ["OpenCV"]),
  ],
  targets: [
    .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.5/OpenCV.xcframework.zip",
                  checksum: "ce8a55b3a4793fa9dea1791fe6a7c6124b06614340438d921652542fffe3dbd1"),
    /*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
     */
  ]
)

