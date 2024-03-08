
if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
fi

cd build_xcframework
zip -y -r OpenCV.xcframework.zip OpenCV.xcframework
export vers=$1
sed -I '' 's/\(download\/\).*\(\/\)/\1'$vers'\2/' ../Package.swift
swift package compute-checksum OpenCV.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' ../Package.swift
