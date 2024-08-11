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
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.10.1/OpenCV.xcframework.zip",
                  checksum: "35c6a516d1d2d23b0012dc7f1e8123cfa77c33b769f41727bf16d608f68ef207"),
/*
     .binaryTarget(name: "OpenCV",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
 */

  ]
)

