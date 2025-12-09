
sed -I '' 's/\<opencv2\/core.hpp\>/\"opencv2\/core.hpp\"/' opencv/modules/core/misc/objc/common/Converters.h

sed -I '' 's/ && !TARGET_OS_MACCATALYST//'  opencv/modules/imgcodecs/src/ios_conversions.mm
