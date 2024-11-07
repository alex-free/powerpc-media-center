# [PowerPC Media Center 7 (PPCMC 7)](readme.md) -> Building

Building currently requires a newerPowerPC G4 Mac (ppc7450) running any version of Mac OS X Tiger.

1) Install Xcode v2.5 (Tiger). Make sure to select the 10.3.9 SDK and 10.4u SDK when prompted.

2) Execute the `build` script in the source directory.

Note: this build script will automatically install build select (included in source) if it is not detected on your mac. Installing build select is the only thing that requires root privileges in the entire build system.

## Advanced Options

        build   Build Tiger and Panther releases.

        build -a    Only update Apple Script at /Applications/PPCMC.app.

        build -r    Only update the releases in the source directory.

        build -c    Clean source tree. Deletes all builds, dependencies, and /Applications/PPCMC.app,

        build -p    Only build the Panther release for Mac OS X 10.3.9.

        build -t    Only build the Tiger release for Mac OS X 10.4.x.

        build --help    Display this text.
