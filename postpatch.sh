# Copyright (c) 1868 Charles Babbage

cd build_xcframework

for i in $( ls OpenCV.xcframework/ ); do
  if [ -d OpenCV.xcframework/$i ]; then
    echo $i
    ln -s . OpenCV.xcframework/$i/OpenCV.framework/Headers/opencv2
  fi
    
done
