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
      name: "SwiftOpenCV",
      targets: ["SwiftOpenCV" ]),
  ],
  targets: [
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

     .binaryTarget(name: "OpenCV",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.1/OpenCV.xcframework.zip",
                  checksum: "c404fa253fff9a2e44755d22510af269392b64acea8b97eabd7295982b962d81"),
/*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */
  ]
)

