#!/bin/sh

# build scripts require "python" in the PATH -- Sonoma has python3.
# in order to successfully build, a "python" has to be installed in /usr/local/bin  which runs python3

rm -rf build_xcframework

python3 opencv/platforms/apple/build_xcframework.py --out ./build_xcframework --debug \
 --contrib opencv_contrib --framework_name=OpenCV --build_only_specified_archs \
 --iphoneos_archs "arm64" --iphonesimulator_archs "arm64,x86_64" --iphoneos_deployment_target "18.0" \
 --catalyst_archs "arm64,x86_64" \
 --macos_archs "arm64,x86_64" \
 --macosx_deployment_target "16.0" \
 --disable-bitcode
 # --visionos_archs "arm64" --visionsimulator_archs "arm64"

# cd build_xcframework/OpenCV.xcframework
# rm */OpenCV.framework/Modules
