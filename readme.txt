The file 'User Guide.html' contains much more info on this project.

You'll need Xcode and PowerPC Tiger, as well as a PowerPC 7450 or better Mac.

To build everything:

sudo ./build_all --all

To just update the AppleScript and everything that does not need to be compiled (applies to previously made builds and the currently installed /Applications/PPCMC.app):

sudo ./build-all --justapp

Note About Releases:
To compress your own releases, use Archive Utility and not the zip command line program as it is not compatible on Panther!
