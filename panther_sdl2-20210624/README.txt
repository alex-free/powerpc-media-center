Panther_SDL2 is a fork of SDL2 (version 2.0.3) which is compatible with Mac OS X 10.3.9 
and Mac OS X 10.4.x. Currently SDL2 2.0.3 requires an Intel Mac OS X 10.5 mac to run, and 
the Mac OS X 10.7 SDK at the 10.5 MACOSX_DEPLOYMENT_TARGET to compile.

Panther_SDL2 takes Thomas Bernard's excellent Mac OS X 10.4 SDK Tiger patches to the next level, 
making it work at the MACOSX_DEPLOYMENT_TARGET of version 10.3, which enables Mac OS X 10.3.9 
compatibility for the first time ever (10.3.8 and below will not work with this method). Xcode 
2.5 has been tested.

Thomas Bernard's original unified patch, and my indivisual patches created from his unified patch
can be found in the folder 'thomas_bernard_sdl_2.0.3_patches'. My patches can be found in the 
directory 'sdl2_2.0.3_panther_patches'. These are all against the official SDL2 version 2.0.3 
release.

The latest FFplay and a simple hello world program have been tested to work perfectly.

== 

If you are building for a Panther target:

export MACOSX_DEPLOYMENT_TARGET=10.3
./configure --without-x --disable-joystick --disable-haptic
make
sudo make install

If you are building for Tiger:
export MACOSX_DEPLOYMENT_TARGET=10.4
./configure --without-x --disable-joystick --disable-haptic
make
sudo make install

==

Thomas BERNARD Tiger Patch:
https://gist.github.com/miniupnp/26d6e967570e5729a757

Found from this post:
https://forums.libsdl.org/viewtopic.php?p=41191