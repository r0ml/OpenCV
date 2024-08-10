#!/bin/sh

# build scripts require "python" in the PATH -- Sonoma has python3.
# in order to successfully build, a "python" has to be installed in /usr/local/bin  which runs python3

# arm7 architecture fails to build
# it's OK if this never works

# as near as I can make out, objc support and Swift support are mutually exclusive.
# Ergo, I need either --without objc or --disable-swift .
# If both are missing, objc support fails to build with complaint about missing CMAKE_Swift_COMPILER .  Setting the SWIFTC environment variable doesn't help.
# Given that I'm more interested in Swift support than objc support, I went with --without objc .
# would like to get this working someday

python3 opencv/platforms/apple/build_xcframework.py --out ./build_xcframework --debug --contrib opencv_contrib --framework_name=OpenCV --build_only_specified_archs --iphoneos_archs "arm64" --iphonesimulator_archs "arm64,x86_64" --iphoneos_deployment_target "16.0" --macos_archs "arm64,x86_64" --catalyst_archs "arm64,x86_64" # --visionos_archs "arm64" --visionsimulator_archs "arm64"# --without objc # --disable-swift

# cd build_xcframework/OpenCV.xcframework
# rm */OpenCV.framework/Modules
