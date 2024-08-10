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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.10.0/OpenCV.xcframework.zip",
                  checksum: "34dd0ee8a162eeaa758aa8bdcf8612409fcdc250adedc491499d2bfe7d09fcac"),
/*
     .binaryTarget(name: "OpenCV",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */

  ]
)

