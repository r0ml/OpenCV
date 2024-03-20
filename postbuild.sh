
if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
fi

# Add in the privacy manifest that Apple's demanding for valid apps
#
THIS_SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PRIVACY_FOLDER="${THIS_SCRIPT_DIR}/privacy"
XCFRAMEWORK_FOLDER="${THIS_SCRIPT_DIR}/build_xcframework/OpenCV.xcframework"

# macOS
XF="${XCFRAMEWORK_FOLDER}/macos-arm64_x86_64/OpenCV.framework"
mkdir -p ${XF}/Versions/A/Resources
cp ${PRIVACY_FOLDER}/PrivacyInfo.xcprivacy ${XF}/Versions/A/Resources
plutil -insert CFBundleExecutable -string OpenCV ${XF}/Versions/A/Resources/Info.plist
cp ${XF}/Versions/A/Resources/Info.plist ${XF}/

# Mac Catalyst
XF="${XCFRAMEWORK_FOLDER}/ios-arm64_x86_64-maccatalyst/OpenCV.framework"
mkdir -p ${XF}/Versions/A/Resources
cp ${PRIVACY_FOLDER}/PrivacyInfo.xcprivacy ${XF}/Versions/A/Resources
plutil -insert CFBundleExecutable -string OpenCV ${XF}/Versions/A/Resources/Info.plist
cp ${XF}/Versions/A/Resources/Info.plist ${XF}/

# iOS
XF="${XCFRAMEWORK_FOLDER}/ios-arm64/OpenCV.framework"
cp ${PRIVACY_FOLDER}/PrivacyInfo.xcprivacy ${XF}/
plutil -insert CFBundleExecutable -string OpenCV ${XF}/Versions/A/Resources/Info.plist
cp ${XF}/Versions/A/Resources/Info.plist ${XF}/

# iOS simulator
XF="${XCFRAMEWORK_FOLDER}/ios-arm64_x86_64-simulator/OpenCV.framework"
cp ${PRIVACY_FOLDER}/PrivacyInfo.xcprivacy ${XF}/
plutil -insert CFBundleExecutable -string OpenCV ${XF}/Versions/A/Resources/Info.plist
cp ${XF}/Versions/A/Resources/Info.plist ${XF}/

# you might need to sign here at some point...
# If you do codesign, do that BEFORE you zip it up
#
# codesign --timestamp -v --sign "Apple Development: ...your_id_here ..." OpenCV.xcframework

cd build_xcframework
rm -f OpenCV.xcframework.zip

# zip -y -r OpenCV.xcframework.zip OpenCV.xcframework

# zip works, but ditto is just a bit more robust for including contents that
# Apple's fraameworks get all bent out of shape about. This setup doesn't
# look like it stricly needs it - but if you ever include another framework
# in here, it inflates incorrectly with zip.

ditto -c -k --sequesterRsrc --keepParent OpenCV.xcframework OpenCV.xcframework.zip
export vers=$1
sed -I '' 's/\(download\/\).*\(\/\)/\1'$vers'\2/' ../Package.swift
swift package compute-checksum OpenCV.xcframework.zip | xargs -I '{}' sed -I '' 's/\(checksum: "\).*\("\)/\1{}\2/' ../Package.swift
