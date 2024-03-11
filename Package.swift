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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.8/OpenCV.xcframework.zip",
                  checksum: "ba36affcab42b16be481c10a038de8b252bd203f489e12b15a507a2b228da2f9"),
/*
     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */
  ]
)

