// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "OpenCV",
  platforms: [
    .macOS(.v11), .iOS(.v16), .macCatalyst(.v16)
  ],
  products: [
    .library(
      name: "OpenCVY",
      targets: ["OpenCVY"]),
  ],
  targets: [
    .target(name: "OpenCVY",
            dependencies: ["OpenCVX"],
            path: "swiftWrapper",
            swiftSettings: [.interoperabilityMode(.Cxx)]
            ),
    .target(name: "OpenCVX",
            dependencies: ["OpenCVbinary"],
            path: "wrapper",
//            swiftSettings: [.interoperabilityMode(.Cxx)],
            cSettings: [.unsafeFlags(["-std=c++11"])],
            linkerSettings: [.linkedFramework("OpenCV")]
            ),

     .binaryTarget(name: "OpenCVbinary",
                  url: "https://github.com/r0ml/OpenCV/releases/download/4.9.0/OpenCV.xcframework.zip",
                  checksum: "043b09fc4e0b192fb1ef5880a6058778277c21066f7ceac83bf9e672185c298d"),

     .binaryTarget(name: "OpenCVLocal",
                   path: "build_xcframework/OpenCV.xcframework"
     ),
  ]
)

