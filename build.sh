#!/bin/sh

rm -rf build_xcframework

python3 opencv/platforms/apple/build_xcframework.py --out ./build_xcframework --debug \
 --contrib opencv_contrib --framework_name=OpenCV --build_only_specified_archs \
 --macosx_deployment_target "15.0" \
 --iphoneos_deployment_target "18.0" \
 --catalyst_archs "arm64" \
 --iphoneos_archs "arm64" \
 --iphonesimulator_archs "arm64" \
 --macos_archs "arm64" \

# --disable-bitcode \
# --visionos_archs "arm64" --visionsimulator_archs "arm64" \

# cd build_xcframework/OpenCV.xcframework
# rm */OpenCV.framework/Modules
