
cd build_xcframework
zip -r OpenCV.xcframework.zip OpenCV.xcframework
swift package compute-checksum OpenCV.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' ../Package.swift
