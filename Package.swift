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
    /*
    .library(
      name: "SwiftOpenCV",
      targets: ["SwiftOpenCV" ]),
     */
  ],
  targets: [
    /*
    .target(name: "SwiftOpenCV",
            dependencies: ["OpenCV_bridge"],
            path: "swiftWrapper",
            swiftSettings: [.interoperabilityMode(.Cxx)]
            ),
    .target(name: "OpenCV_bridge",
            dependencies: ["OpenCV"],
//            dependencies: ["OpenCVlocal"],
            path: "wrapper",
            cSettings: [.unsafeFlags(["-std=c++11"])],
            linkerSettings: [.linkedFramework("OpenCV")]
            ),
     */
     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.10/OpenCV.xcframework.zip",
                  checksum: "0a70d57d8fde68b58048187c7bc58ab1613081646dd51cfee9f471e5eea58bd2"),
/*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */
  ]
)

