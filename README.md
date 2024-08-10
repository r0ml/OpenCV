# OpenCV SPM Package

Every time I try to use OpenCV on an Apple platform, I lose a few days to yak shaving trying to
get it to compile and including it in my project.  The build process is convoluted and
time-consuming -- there is no way to turn it into a Swift Package.

But now, one can create [*binary* packages in SPM]( https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages ).

So here it is.

To use it, just include the package <br/>
  `https://github.com/r0ml/OpenCV.git` <br/>

The build process (see build.sh) enables both ObjC++ and Swift.
In your project, you will need to change the setting for `C++ and Objective-C interoperability` to `C++/Objective-C++`.

## Building your own version

If you wish to build your own, clone this repo (`git clone --recurse-submodules`). <br/>
You will need cmake installed (`brew install cmake`). <br/>
You will need XCode command line tools installed (`xcode-select --install`). <br/>
You will need to create a version of python called `python` installed at /usr/local/bin . <br/>
(The build scripts want an executable called `python` in the `PATH`.  
Unfortunately, if you create a link to /usr/bin/python3, it will not work! )

I have included a script called `python` in this repo which must be copied or moved to `/usr/local/bin/python`.

Then run 
```
./prepatch.sh
```

which fixes a problem with an `#include` statement in opencv.

Then run

```
./build.sh
```

Because I am using OpenCV as the name of the framework, rather than opencv2, many of the includes in the headers fail to resolve properly.  The following patch fixes that.

Run

```
./postpatch.sh
```


The built xcframework should be located at `build_xcframework/OpenCV.xcframework`.

## Deploying

After building the xcframework, one needs to 
  1) run `./postbuild.sh xxx` where xxx is the new version number of the updated package.  This will update the version number in the download URL, create the release zip file, and update the checksum in Package.swift
  2) commit the changes
  3) create a tag with the above version number for this commit
  4) 


## Alternate

If adding this SPM package seems to take way too long, you might try using the alternative package at  `https://github.com/r0ml/JustTheBinary`.  This contains a binary package with the same framework as available here, except (as the name suggests) it does not include all the stuff required to rebuild the framework.  It should load faster.

## LICENSE

Copyright (c) 1868 Charles Babbage  <br/>
Found amongst his effects by r0ml

