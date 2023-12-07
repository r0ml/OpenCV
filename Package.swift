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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.8.2/OpenCV.xcframework.zip",
                  checksum: "ba4607c71e1e1c6e7ad9255ab5f651b251a36fdef9d0061465f300ef05955f8c"),
    /*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
     */
  ]
)

