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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.13/OpenCV.xcframework.zip",
                  checksum: "f25597a1ce3919c618197a183cb991c7a8bed08a80bbf1ac1c553c8d916f8dee"),
/*
     .binaryTarget(name: "OpenCV",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */

  ]
)

