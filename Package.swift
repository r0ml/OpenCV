// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v11), .iOS(.v16), .macCatalyst(.v16)
  ],
  products: [
    .library(name: "OpenCV",
             targets: ["OpenCV"]
             ),
    .library(
      name: "OpenCVY",
      targets: ["OpenCVY" ]),
  ],
  targets: [
    .target(name: "OpenCVY",
            dependencies: ["OpenCVX"],
            path: "swiftWrapper",
            swiftSettings: [.interoperabilityMode(.Cxx)]
            ),
    .target(name: "OpenCVX",
            dependencies: ["OpenCV"],
//            dependencies: ["OpenCVlocal"],
            path: "wrapper",
//            swiftSettings: [.interoperabilityMode(.Cxx)],
            cSettings: [.unsafeFlags(["-std=c++11"])],
            linkerSettings: [.linkedFramework("OpenCV")]
            ),

     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.6/OpenCV.xcframework.zip",
                  checksum: "8d4eca8955cbf22f9487c147de91ea7169a83a864dde8ca3d04107cca38f0df4"),
/*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */
  ]
)

