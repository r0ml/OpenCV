
if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
fi

# you might need to sign here at some point...
# If you do codesign, do that BEFORE you zip it up
#
# codesign --timestamp -v --sign "Apple Development: ...your_id_here ..." OpenCV.xcframework

cd build_xcframework
rm -f OpenCV.xcframework.zip

ditto -c -k --sequesterRsrc --keepParent OpenCV.xcframework OpenCV.xcframework.zip
export vers=$1
sed -I '' 's/\(download\/\).*\(\/\)/\1'$vers'\2/' ../Package.swift
swift package compute-checksum OpenCV.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' ../Package.swift
