# Copyright (c) 1868 Charles Babbage

cd build_xcframework

for i in $( ls OpenCV.xcframework/ ); do
  if [ -d OpenCV.xcframework/$i ]; then
    echo $i
    
    FOLD="OpenCV.xcframework/$i/OpenCV.framework"
    ln -s . ${FOLD}/Headers/opencv2
    
    # without this patch, the local framework works, but not the SPM binary package containing it
    plutil -insert CFBundleExecutable -string OpenCV ${FOLD}/Resources/Info.plist
    
    # Add in the privacy manifest that Apple is demanding for valid apps
    cp ../privacy/PrivacyInfo.xcprivacy ${FOLD}/Resources/
  fi
    
done
