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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.001/OpenCV.xcframework.zip",
                  checksum: "604e0d8b35fb49edfc9402e4ce5404bbc44f6b3bc111459ffbff11db59b26d36"),
/*
     .binaryTarget(name: "OpenCV",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */   
  ]
)

