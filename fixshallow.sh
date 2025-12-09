#!/bin/zsh

cd OpenCV.xcframework/ios-arm64/OpenCV.framework

rm Headers Modules OpenCV Resources

mv Versions/A/OpenCV .
mv Versions/A/Resources/* .

mv Versions/A/Headers .
mv Versions/A/Modules .

rm -rf Versions

