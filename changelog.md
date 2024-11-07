# [PowerPC Media Center 7 (PPCMC 7)](readme.md) -> Changelog

## Table Of Contents

  * [Version 7.2.6 (12/11/2021)](#version-726-12112021)
  * [Version 7.2.5 (6/1/2021)](#version-725-612021)
  * [Version 7.2.4 (5/26/2021)](#version-724-5262021)
  * [Version 7.2.3 (3/1/2021)](#version-723-312021)
  * [Version 7.2.1 (10/29/2020)](#version-721-10292020)
  * [Version 7.2 (10/26/2020)](#version-72-10262020)
  * [Version 7.1.9 (8/15/2020)](#version-719-8152020)
  * [Version 7.1.8 (7/15/2020)](#version-718-7152020)
  * [Version 7.1.7 (7/11/2020)](#version-717-7112020)
  * [Version 7.1.6 (6/27/2020)](#version-716-6272020)
  * [Version 7.1.5 (5/11/2020)](#version-715-5112020)
  * [Version 7.1.4 (5/10/2020)](#version-714-5102020)
  * [Version 7.1.3 (5/7/2020)](#version-713-572020)
  * [Version 7.1.2 (5/7/2020)](#version-712-572020)
  * [Version 7.1.1 (4/15/2020)](#version-711-4152020)
  * [Version 7.1 (4/7/2020)](#version-71-472020)
  * [Version 7.0.9 (4/2/2020)](#version-709-42-2020)
  * [Version 7.0.8 (3/20/2020)](#version-708-3202020)
  * [Version 7.0.7 (3/20/2020)](#version-707-3202020)
  * [Version 7.0.6 (3/11/2020)](#version-706-3112020)
  * [Version 7.0.5 (3/11/2020)](#version-705-3112020)
  * [Version 7.0.4 (3/10/2020)](#version-704-3102020)
  * [Version 7.0.3 (3/4/2020)](#version-703-342020)
  * [Version 7.0.2 (2/28/2020)](#version-702-2282020)
  * [Version 7.0.1 (2/26/2020)](#version-701-2262020)
  * [Version 7.0 (2/25/2020)](#version-70-2252020)

## Version 7.2.6 (12/11/2021)

* Removed YouTube-dl and replaced it with YouTube-dlp as it is now vastly superior in speed, reliability, and accessibility to content.

* Added streaming of 144p (3GP), and 720p (MP4) for all YouTube videos. FFplay, QuickTime, VLC, and Mplayer all support this.

* Intel Mac OS X 10.4.8-10.5.8 are now supported by the new Intel native build.

* Rewrote the `Play Media File` function to be faster and to fix a bug where certain file names would cause a video to not play.

* YouTube live streams that are not live and have ended can now be played back by the `Stream YouTube Video` or `Stream YouTube Video In QuickTime` options.

* PPCMC7 now automatically applies a different FFplay configuration for ppc, ppc750, and ppc7400 Macs to boost performance over quality (thanks Dronecatcher). For ppc7450, an option is to do so is available.

* Fixed/Updated the 720p format used for streaming YouTube live streams to format 300.

* New build system rewritten for portability, faster development/modification, and enhanced functionality.

* Updated FFmpeg/FFprobe/FFplay to the latest version, 4.4.1.

* Updated OpenSSL to the latest version of the 1.1.1 branch, 1.1.1l.

* Updated the CA certificates to the latest extraction of 10-26-2021.

* Updated CDRdao to the latest version, 1.2.4.

* Updated Python to the latest version of Python 3.6, version 3.6.15.

* Updated cURL to the latest version, 7.80.0.

* Updated Git to the latest version, 2.34.1.

* Removed TenFourFox box support due to a bug with URLs being not updated.

* Updated the web interface to support Python 3.6/yt-dlp.

* Added YASM to the build tools to enable all X86 assembly optimizations available in FFmpeg for Intel Macs.

* Optimized PPCMC.app to take up less space by removing unnecessary files.

## Version 7.2.5 (6/1/2021)

* Fixed python 3.6 ssl import bug.

## Version 7.2.4 (5/26/2021)

* Fixed a bug which made QuickTime streaming not update to use a new URL.

* Fixed a bug where file conversions would have a higher bitrate then the option implied the limit was.

* Fixed a bug where G3/604 Macs would crash when using FFMPEG related features.

* Removed the Leopard optimized version to simplify and speed up future development since Panther\_SDL2 does NOT build on Leopard correctly (RUNS fine on Leopard if built on Tiger), just use the Tiger version on Leopard for right now.

* Fixed the download any url option to use the get\_url function.

* Removed highlighting of the folders PPCMC generates per user request.

* Changed youtube-dl to execute the main .py script directly with no decompression for a performance and speed boost.

* Changed youtube-dl to update to the latest git commit on GitHub directly so users can get new features and updates without waiting for it to be packaged into a release.

* Significantly optimized and cleaned up how real youtube-dl URLs are retrieved in the Apples script code by condensing the many multiple functions into just one.

* Added a new "CD Options" category to the main menu, with the following sub options: "Burn Audio CD", "Burn Data CD Or Mixed Mode Data+Audio CD", "Burn Folder Of WAVs To Audio CD", "Convert And Burn Folder Of Media Files To Audio CD", "Rip Audio CD", "Rip Data CD Or Mixed Mode Data+Audio CD". All of which use the newly included cdrdao.

* Updated FFMPEG/FFPLAY/FFPROBE to the latest version 4.4 and removed altivec patches since they are no longer needed.

* Updated the internal certificate to the latest 4-13 version extracted by the cURL project on April 13th 2021.

* Updated OpenSSL to the latest version 1.1.1k.

* Updated Curl to the latest version 7.61.1 and removed the min macosx version min patch since it is no longer needed.

* Added cdrdao v1.2.0.

* Added the latest version of git v2.31.1

* Added the latest version 0.29.2 of pkg-config.

## Version 7.2.3 (3/1/2021)

* All streaming options have been rewritten to use direct video URLs, execute in the background, and not use Terminal.app. All of these changes improve CPU/RAM usage and UX.

* Switched from the out of date LAME version 3.99.5 to the latest version 3.100 LAMEVMX by Cameron Kaiser.

* YouTube-dlc development had died, and YouTube-dl is back on GitHub so PPCMC once again uses the original YouTube-dl.

* OpenSSL has been updated to the latest 3.0 Alpha 12.

* CURL has been updated to the latest 7.75.0.

* The `ffplay-yt` wrapper now accepts an unlimited number of arguments instead of just one.

* TenFourFoxBox URL support has now been added for all URL based options.

* The CA Certificates extracted from Mozilla by cURL have been updated to the January 19th 2021 extraction.

* VLC.app can now be anywhere, not just in the `/Applications` directory. The preferences system has been updated to allow you to choose where it is.

* Python has been updated from 2.7.18 to 3.6.12, which is still getting security updates until the end of 2021.

* FFmpeg, FFplay, and FFprobe have been updated to the latest version, 4.3.2.

* There are now 3 optimized builds of PPCMC 7. 10.3.9 using the 10.4 SDK @ the 10.3 API level. 10.4.x using the 10.4 SDK @ the 10.4 API level. 10.5.x using the 10.5 SDK @ the 10.5 API level.

## Version 7.2.1 (10/29/2020)

* Better FFplay performance.

* Replaced YouTube-dl 9.20.2016 with YouTube-dlc 10.26.2020. The updater has also been changed to use YouTube-dlc, as YouTube-dl development has stopped since the DMCA.

* Rewrote and fixed the preference system. You can now also edit the media player command if you want to expand your initial preferences.

* Implemented Dronecatcher on the MacRumor forums suggestion setting the ffplay log level to quiet by default.

## Version 7.2 (10/26/2020)

* Updated cURL to latest version, 7.73.0.

* Enabled Zlib in cURL.

* Updated OpenSSL to latest version, 3.0 Alpha 7.

* Added latest version of FFplay, 4.3.1.

* Updated YouTube-dl to latest version, 2020.09.20.

* New UI and preferences in app.

* Added Panther_SDL2 release 1 (SDL2 2.0.3).

* Rewrote build system, now creates a Tiger and Panther optimized builds.

## Version 7.1.9 (8/15/2020)

* Updated OpenSSL to latest version, 3.0 Alpha 6.

* Updated FFMPEG to latest version, 4.3.1.

* Updated YouTube-dl to latest version, 2020.07.28.

* Added an option to download a YouTube video as a 720p MP4 and open in CorePlayer.

## Version 7.1.8 (7/15/2020)

YouTube live stream at 360p fix

## Version 7.1.7 (7/11/2020)

* YouTube live stream support at 144p, 240p, 360p, 480p, and 720p.

* Mplayer support.

* Updated FFMPEG to latest version, 4.3. Some altivec code is broken in version 4.3 so I have reverted 3 files to what they were in FFMPEG 4.2.3 to fix the issue. This is a workaround until the stable FFMPEG has correct altivec code.

* Added SoundCloud download option.

* Added 720p streaming of ended YouTube live streams in VLC and Mplayer.

* Support for Converting existing files to 96KB/s, 128KB/s, and 320KB/s MP3s. Mono options are also available for the above.

* Updated and fixed the 720p YouTube format for downloading YouTube videos as 720p H.264 MP4 files, which work very well on a fast G4 with Core Player.

* All VLC and Mplayer options now support full screen.

* Updated CA Certificate PEM to the latest 6/24/2020 cURL Mozilla extraction.

* Updated Curl to latest version 7.71.1.

* Official PowerPC 604 support.

## Version 7.1.6 (6/27/2020)

* Updated FFMPEG to the latest version, 4.2.3.

* Full screen option removed due to not working on Panther.

* Fixed Panther only instability.

* New HTML documentation and 'licenses' directory in releases.

* A new optimized altivec enabled FFMPEG G4/G5 only build will always be released alongside the standard G3/G4/G5 one.

* Every dependency is compiled with the Mac OS X 10.4 Universal SDK at the Mac OS X 10.3 level. Before all programs that could use the 10.3.9 SDK used it, and all others used the 10.4 Universal SDK. This change has been made so that the 10.3.9 SDK is not required for building, and does not affect compatibility whatsoever. Mac OS X 10.3.9 universal G3/G4/G5 binaries are still produced from any Leopard Mac using the build script.

* Fixed the Download 360p MP4 option.

## Version 7.1.5 (5/11/2020)

* Fixed Twitch.tv 160p stream option.

## Version 7.1.4 (5/10/2020)

* Added Twitch.tv live streaming support thanks to wicknix on the MacRumors Forums. His method allows streaming Twitch.tv live streams with VLC 0.8.6i, the last VLC version released for Mac OS X 10.3.9 panther.

* Enabled Zlib in FFMPEG compile.

* More efficient functions in app.

* Added YouTube video streaming support for VLC.

## Version 7.1.3 (5/7/2020)

* Improved the Web Interface uninstaller and installer scripts.

## Version 7.1.2 (5/7/2020)

* If a URL is required for the selected option and one is not copied to the clipboard, PPCMC will check if Safari is running. If Safari is running the URL of the last active window will be set as the URL. This means you can simply load the YouTube video's web page, and then open the PPCMC app to use the Safari URL. If Safari is not running a text input box will be presented to enter the URL manually. If Safari is running and a URL is copied to the clipboard, an option menu will be presented for the user to select either URL.

* Implemented choose file and choose directory, replacing the text input boxes of relevant features.

* Download Any URL option now can use a link copied to the clipboard.

* Updated OpenSSL to version 1.1.1g.

* Updated Curl to version 7.70.0.

* Updated Python to version 2.7.18.

* Cleaned up code and reduced complexity by implementing more universal functions.

* YouTube-dl downloader now displays the Youtube-dl version before and after download.

* Improved UX in Convert Media File option.

* Improved documentation.

* M4A option now embeds thumbnails.

* Added back full screen streaming functionality (as was in older PPCMC builds) with the new Stream Full Screen option.

* On launch the app now checks if it is running in the /Applications directory, or somewhere else. Running anywhere but the /Applications directory is not supported and a dialogue will now display informing the user if this happens.

* Added the latest version of AtomicParsley, version 0.9.0 for M4A thumbnail support.

## Version 7.1.1 (4/15/2020)

* MPEG 1 converting fixed.

* Input file paths and Output file paths specified in the Convert Media File option no longer need to be escaped with slashes. This means a file path like "~/Desktop/some media file (official file).mp4" now works.

* The Convert Media File option has been completely rewritten to include the following options: 240p MPEG 1 (Up To 500 KB/s Video Bitrate) 360p MPEG 1 (Up To 500 KB/s Video Bitrate) 480p MPEG 1 (Up To 1 MB/S Video Bitrate) 240p MP4 Part 2 (Up To 500 KB/s Video Bitrate) 360p MP4 Part 2 (Up To 500 KB/s Video Bitrate) 480p MP4 Part 2 (Up To 1 MB/s Video Bitrate) MP3 @320KB/s Bitrate.

## Version 7.1 (4/7/2020)

* Web Interface 0.5 beta, now can be ran from Mac OS X 10.4-10.6.

* New Web Interface option, Display URL. This allows you to view certain web pages up to TLS 1.3 in ancient browsers.

## Version 7.0.9 (4/2/2020)

* Web Interface 0.4 beta, a YouTube download website for ancient browsers.

* OpenSSL updated to latest version 1.1.1f.

* Download MP1 For 300MHZ G3 option added to PPCMC.app and web interface. Looks stunning on the Clamshell.

## Version 7.0.8 (3/20/2020)

* For download options that specify resolution, it is specifically requested. Note that not all resolutions may be available. If for example 480p is not available, try 360p and so on. This change has been made to prevent incompatible video formats from being downloaded.

* Added 2 new options, Download 144p MP4 and Download 144p MP4 For QuickTime 6.

## Version 7.0.7 (3/20/2020)

* All video related download options now disable the av01 video codec and forces standard MP4 x264.

* 3GP is no longer supported due to sync issues that can not be fixed.

* At the request of the original author, the download MP3 option now only downloads M4A audio which makes converting much faster for said option.

* Any MP4 x264, MP4 Part 2, or MP3 can now be converted with the Convert Media File option.

* Removed legacy, now unnecessary YouTube-dl arguments for streaming.

* Added PPCMC Shell option. You now have the full power of PPCMC's modern subsystem available at any time in a special Terminal window.

* Updated Curl to the latest version, 7.69.1.

* You can now download any URL with PPCMC using the Download Any URL option which supports up to TLS v1.3. That's right, TLS 1.3 on Panther.

## Version 7.0.6 (3/11/2020)

* Added M4A downloading.

## Version 7.0.5 (3/11/2020)

* 3GP streaming and download.

## Version 7.0.4 (3/10/2020)

* FFMPEG is now compiled with altivec disabled and for arch ppc to fix G3 support.

* Curl has been updated to the latest version, 7.69.0.

* You can now open PPC Media Center and use features that don't require a URL if you have no URL copied to the clipboard.

* When a URL is copied and PPC Media Center is opened, it is displayed as the title of the window.

* MP4 Part 2 Download and convert options for 240p, 360p, and 480p now allow videos to be played back on Mac OS 9 using QuickTime 6.1.

* Added latest Bzip2 1.0.8 for FFMPEG.

## Version 7.0.3 (3/4/2020)

* PPC-Media-Center.app is now PPCMC.app.

* OpenSSL updated to 1.1.1d.

* New Mozilla CA Certificate PEM.

* Zlib 1.2.11 is now used instead of the ancient one in Mac OS X.

* Mac OS X 10.3.9 support.

## Version 7.0.2 (2/28/2020)

* Added 240p, 360p, 480p, 720p, 1080p, download video options. These will download the best mp4 video stream and m4a audio stream up to the selected resolution and ffmpeg will make them one mp4 file.

* Added download best video quality option, to download the highest quality mp4 video stream and m4a audio stream available.

* Make MP3 Options now download 480p videos with the best mp4 video stream and m4a audio stream.

* Added about option to display the information about the installed command line utilities.

## Version 7.0.1 (2/26/2020)

* Fixed FFMPEG error.

* FFMPEG is now compiled with OpenSSL enabled.

* The build script now uses my patch to disable texi2info usage in the Makefile of FFMPEG.

* Changed build.sh detect compiled app bundles in it's directory instead for a cleaner build.

* Changed build.sh to exit on error.

## Version 7.0 (2/25/2020)

* Everything is compiled into the .app. No weird installation of multiple packages, just copy the .app to /Applications.

* All of the dependencies have been replaced with my modern compiled ones. They are openssl 1.0.2u, curl 7.68.0, the curl CA bundle, ffmpeg 4.2.2, lame 3.99.5, Python 2.7.17, and the latest YouTube-dl. All of these are compiled into the app, TenFourFox style.

* Everything uses SSL/TLS/HTTPS now.

* To compile all of the dependencies in this weird awesome way, I've included a build script in the new source release.

* You can now download the latest YouTube-dl with PPC Media Center.

* Auto Downloader now removed since rstFndr.app is not open source.
