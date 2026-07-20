#!/bin/sh

# build scripts require "python" in the PATH -- Sonoma has python3.
# in order to successfully build, a "python" has to be installed in /usr/local/bin  which runs python3

rm -rf build_xcframework

export OPENCV_EXTRA_CMAKE_ARGS="-DCPU_BASELINE=NEON;FP16 -DCPU_DISPATCH=NEON_FP16;NEON_BF16;NEON_DOTPROD -DCMAKE_XCODE_ATTRIBUTE_CLANG_EXTRACT_API=NO -DOPENCV_DNN_ONNX_IMPORTER=ON -DWITH_PROTOBUF=ON"

python3 opencv/platforms/apple/build_xcframework.py --out ./build_xcframework --debug \
 --contrib opencv_contrib --framework_name=OpenCV --build_only_specified_archs \
 --macosx_deployment_target "15.0" \
 --iphoneos_deployment_target "18.0" \
 --catalyst_archs "arm64" \
 --iphoneos_archs "arm64" \

# --iphonesimulator_archs "arm64" \
# --macos_archs "arm64" \

# --disable-bitcode \
# --visionos_archs "arm64" --visionsimulator_archs "arm64" \

# cd build_xcframework/OpenCV.xcframework
# rm */OpenCV.framework/Modules
