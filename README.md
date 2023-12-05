# OpenCV SPM Package

Every time I try to use OpenCV on an Apple platform, I lose a few days to yak shaving trying to
get it to compile and including it in my project.  The build process is convoluted and
time-consuming -- there is no way to turn it into a Swift Package.

But now, one can create [*binary* packages in SPM]( https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages ).

So here it is.

To use it, just include the package
  `https://github.com/r0ml/OpenCV.git`
and specify version 4.8.1 .


## Building your own version

If you wish to build your own, clone this repo (`git clone --recurse-submodules`).
You will need cmake installed (`brew install cmake`).
You will need XCode command line tools installed (`xcode-select --install`).
You will need to create a version of python called `python` installed at /usr/local/bin .
(The build scripts want an executable called `python` in the `PATH`.  
Unfortunately, if you create a link to /usr/bin/python3, it will not work! )

So I have included a script called `python` in this repo which must be copied or moved to `/usr/local/bin/python`.

Then run 
```
./build.sh
```

The built xcframework should be located at `build_xcframework/OpenCV.xcframework`.

## LICENSE

Copyright (c) 1868 Charles Babbage
Found amongst his effects by r0ml

