# PowerPC Media Center 7 (PPCMC 7)

_By Alex Free_

PowerPC Media Center 7 is an advanced media streamer, downloader, and conversion application in active development targeting PowerPC Macs running Mac OS X 10.3.9 and above. PPCMC 7 is a fork of the original [PPCMC 6](https://macintoshgarden.org/apps/ppc-media-center-watch-modern-internet-video-ppc-macs-running-104105) by 'Hugh Downs' ([OpenSourceMac](https://macintoshgarden.org/users/opensourcemac) of Macintosh Garden). When the original PPCMC had it's final update on 1/18/2020, PPCMC 7.0 was released on 2/25/2020 and has been developed by myself ever since. Many new features and changes have been added in that time.

| [GitHub](https://github.com/alex-free/powerpc-media-center) | [Homepage](https://alex-free.github.io/ppcmc7) | [Macintosh Garden](http://macintoshgarden.org/apps/ppc-media-center-7x-youtube-streamer-downloader-convertor) | [MacRumors Thread](https://forums.macrumors.com/threads/2-17-2021-ppcmc-7-2-2-beta-youtube-twitch-streaming-downloading-file-conversion-web-interface-more-for-panther-604-g3-g4-g5.2224743/) |


## Table Of Contents

* [Downloads](#downloads)

* [Installation](#installation)

* [Using The App](#using-the-app)

* [FFplay](#ffplay)

* [Supported External Media Players](#supported-external-media-players)

* [Streaming YouTube Videos](#streaming-youtube-videos)

* [Streaming YouTube Live Streams](#streaming-youtube-live-streams)

* [Streaming Twitch Live Streams](#streaming-twitch-live-streams)

* [Downloading YouTube Videos In The App](#downloading-youtube-videos-in-the-app)

* [Downloading SoundCloud Audio Tracks In The App](#downloading-soundcloud-audio-tracks-in-the-app)

* [Converting Local Files](#converting-local-files)

* [Misc Options](#misc-options)

* [Using The Web Interface](#usingthewebinterface)

* [Downloading YouTube Videos With The Web Interface](#downloading-youtube-videos-with-the-web-interface)

* [Streaming Web Interface Files](#streaming-web-interface-files)

* [Bundled Programs](#bundled)

* [Licenses](#licenses)

* [Building](build.md)

* [Credits](credits.md)

# Downloads

### Version 7.2.7 (11/7/2024)

Changes:

* Can choose from YouTube-dl or YouTube-dlp when setting your preferences on Tiger and Leopard. For Panther only YouTube-dl is available and you are not prompted for this selection. YouTube-dlp is currently more advanced then YouTube-dl and can download many more different formats and resolutions then the original YouTube-dl can.

* Updates either YouTube-dl or YouTube-dlp with cURL pointed to the latest commit. Get the fastest fixes and improvements as they are committed to the source tree, before any release is even put out with said changes.

* Updated the included YouTube-dl and YouTube-dlp in the app to the latest commits.

* Removed git, cdrdao, and CD burning features. 

* Smaller app size due to implementing executable stripping of debug symbols (or configuration for building without them when possible).

* Updated python to version 3.10.15 for the Tiger build.

* Updated python to version 3.6.15 for the Panther build.

* Updated OpenSSL to version 1.1.1w.

* Updated SSL certificates to the latest 9/24/2024 extraction.

* Updated cURL to the latest version, 8.10.1.

* Updated FFmpeg/FFplay/FFprobe to version 4.4.5.

* Added the latest version of LibPSL, 0.21.5. Used by cURL.

* Added the latest version of libiconv, 1.17 for the Tiger build.

* Added libiconv version 1.11.1 for the Panther build.

* Added the latest version of libFFI, v3.4.5 for the Tiger build.

* Updated Zlib to the latest version, 1.3.1.

* Fixed multiple GUI bugs that did not have a default selection highlighted.

* Cleaned up and simplified apple script code.

* Better default options selected in GUI menus.

* FFplay now detaches from PPCMC.app for local media file playback.

* Simplified YouTube streaming options to not ask for a resolution, since only 360p is possible to stream. Other resolutions can be downloaded still. 

* Improved FFplay args. `-fast` is now used. `-autoexit` is also used to close the player when playback is complete automatically.

* Improved local file name handling for playing media files. Many more local video files will now open correctly with i.e. FFplay.

* Fixed web interface to work with Python 3.6.15 (Panther) and Python 3.10.15 (Tiger).

* Web interface now offers 360p H.264 MP4 and 720p H.264 MP4 options. Great for ancient iOS devices.

* Improved web interface installer/uninstaller and wcli.

* Web interface now supports multiple concurrent connections at one time.

* Rewritten build system.

* Build system no longer requires sudo or root privileges at all.

* Build system now works even if MacPorts is installed (MacPorts is neither required or used by the PPCMC 7 custom build system).

* Enabled all arches in LameVMX.

* Documentation rewritten in markdown.

----------------------------------------------------------------------------

*   [ppcmc-v7.2.7-panther.zip](https://github.com/alex-free/powerpc-media-center/releases/download/v7.2.7/ppcmc-v7.2.7-panther.zip) _For G3, G4, and G5 PowerPC Macs on Mac OS X 10.3.9._

*   [ppcmc-v7.2.7-tiger.zip](https://github.com/alex-free/powerpc-media-center/releases/download/v7.2.7/ppcmc-v7.2.7-tiger.zip) _For G3, G4, and G5 PowerPC Macs on Mac OS X 10.4.0 - 10.5.8._

Fast G4 with 512MBs of RAM or better is recommended.

[Previous versions](changelog.md).

## Installation

1) Copy `PPCMC.app` into your `/Applications` folder. If you try to run PPCMC.app anywhere but the /Applications folder and or rename PPCMC.app you will be prompted to change it to `/Applications/PPCMC.app`.

2) Double click PPCMC.app (at `/Applications/PPCMC.app`). The next couple of steps involve setting your preferences.

3) Select  the media player you'd like to use.

4) Select if you want videos to start in full screen automatically. 

5) If you have a newer G4, and selected FFplay as your media player,  you will be asked if you want to apply more aggressive optimizations to FFplay at the cost of playback quality.

6) If your on Tiger, you will be asked what YouTube downloader to use. YouTube-dlp is currently more powerful and supports more resolutions and media file formats then the original YouTube-dl, so it is recommended to use YouTube-dlp. Panther users are not prompted for this because they can currently only use YouTube-dl.

7) Once you finish setting your preferences, PPCMC.app will close itself. Start it again to begin use. PowerPC Media Center remembers your preferences after you set them. To change them at any time select the `Edit Preferences` main menu function in the app.

8) Optionally, you may want to also enable the web interface (if you don't, your done installation). This provides a way to use many of the same features of the app over your local network using a web browser. The web interface works on all kinds of browsers and platforms. It has been so far tested successfully on:

| Browser | OS |
|---------|----|
| Netscape Navigator 4 | Mac OS 9 |
| Internet Explorer 5 | Mac OS 9 |
| Classilla | Mac OS 9 |
| Safari | Mac OS X 10.3 |
| Safari | Mac OS X 10.4 |
| Safari | Mac OS X 10.5 |
| Safari | iOS 4.1 |
| Safari | iOS 17.3 |
| TenFourFox | Mac OS X 10.4.11 |
| Chromium | Linux |
| Firefox | Linux |

To install the web interface:

9) Open `PPCMC.app` and select the `Web Interface` option.

10) Select either the `Install` or `Uninstall` option.

11) In the new Terminal window, enter your account password for sudo privileges if prompted to complete installation of the web interface.
to
12) Open System Preferences and click on `Sharing`.

13) Enable `Web Sharing`.

## Using The App

PowerPC Media Center uses URLs to stream or download content. After you select an option that needs a URL to function, PPCMC check if it can automatically get a URL through one of the below options:

* Safari's current loaded page. Google search still works on old Safari versions well enough to find some YouTube videos, and you just need it to load the video URL successfully (it will show as an empty page) for the Safari integration to work.

* A URL copied to the clipboard.

* A URL entered into a text box displayed by PPCMC if no URL can be obtained in one of the above mentioned methods.

## FFplay

PPCMC 7 comes bundled with FFplay, a modern and lightweight media player optimized for PowerPC Macs. 

Controls:

q, ESC              quit

f                   toggle full screen

p, SPC              pause

m                   toggle mute

9, 0                decrease and increase volume respectively

/, *                decrease and increase volume respectively

a                   cycle audio channel in the current program

v                   cycle video channel

t                   cycle subtitle channel in the current program

c                   cycle program

w                   cycle video filters or show modes

s                   activate frame-step mode

left/right          seek backward/forward 10 seconds or to custom interval if -seek_interval is set

down/up             seek backward/forward 1 minute

page down/page up   seek backward/forward 10 minutes

right mouse click   seek to percentage in file corresponding to fraction of width

left double-click   toggle full screen

## Supported External Media Players

If you do not want to use FFplay, you can use one of the following external media players:

* [QuickTime version 7.3.1+](http://macintoshgarden.org/apps/quicktime-7). Available for Mac OS X 10.3.9-10.5.8. Currently only supported by the `Stream YouTube Video In QuickTime` option.

* [VLC version 0.8.6i+](http://www.videolan.org/vlc/download-macosx.html). The last official VLC versions for Panther (0.8.6i) and Tiger (0.9.1) are very outdated compared to the last version for Leopard (2.0.1). Because of this, Twitch streaming may have incompatibility issues if using a VLC version older then 2.0.1.

* [Mplayer version 1.3+](https://forums.macrumors.com/threads/01-feb-2020-smtube-20-1-0-os-x-10-4-alternative-for-youview-mactubes-mobile-youtube-installer.2104767/). Requires Mac OS X 10.4.11.

## Streaming YouTube Videos

Ended YouTube live streams and regular YouTube videos can be streamed by all supported media players at 360p. Other resolutions are not currently possible due to YouTube changes. Additional resolution options are available if you [download the video](#downloading-youtube-videos-in-the-app) instead of streaming it.

## Streaming YouTube Live Streams

FFplay, VLC, and Mplayer can stream YouTube live streams. Youtube live streams thar are currently live can be streamed in many more formats then regular videos or ended live streams. 144p, 240p, 360p, 480p, and 720p are all available. 

## Streaming Twitch Live Streams

FFplay, VLC, and Mplayer can stream Twitch live streams. Twitch live streams can be streamed at 160p, 240p, 360p, 480p, and 720p.

## Downloading YouTube Videos In The App

The 'Download YouTube Video(s) as MP4 H.264' category provides options that directly download specific formats YouTube provides and combines them into one MP4 H.264 file. These files can later be played back by any media player and hardware that is up to the task. YouTube videos can be downloaded in 144p, 240p, 360p, 480p, 720p, and 1080p (if the video is offered by YouTube in said format). There is also a 'best' option which will most likely not be playable on your PowerPC Mac.

YouTube-dl is currently unable to download most formats besides 360p. YouTube-dlp is able to download most formats as long as the video is provided in it by YouTube.

The 'Download+Convert YouTube Video(s) for QuickTime 6' option exists to create media playable on systems which do not support H.264 (QuickTime 6). This option can output:

* 144p MP4 Part 2.

* 240p MP4 Part 2

* 360p MP4 Part 2.

* 480p MP4 Part 2.

* 240p MP1 (300 MHZ G3).

* MP3 @320KB/s Bitrate.

The 240p and 360p options have a video bitrate limit of 500KB/s. The 480p options have a video bitrate limit of 1MB.

If the current URL is a channel or playlist instead of a single video, using `'Download YouTube Video(s) as MP4 H.264', 'Download+Convert YouTube Video(s) for QuickTime 6', or the 'Download YouTube Video(s) as M4A' option will download every video on the channel not in a playlist or the entire playlist. If a video in a Playlist is deleted or removed it will simply be skipped and the specified option will continue.

## Downloading SoundCloud Audio Tracks In The App

PPCMC 7 can download music from sound cloud as 128kbs MP3 files. If the current URL is a  play list instead of a single track, it will download every track in said play list. If a track in the play list is deleted or removed it will simply be skipped and the specified option will continue.

## Converting Local Files

The Convert Media File option supports the following output formats listed below.

* 240p MPEG 1

* 360p MPEG 1

* 480p MPEG 1

* 240p MP4 Part 2

* 360p MP4 Part 2

* 480p MP4 Part 2

* 720p MP4 Part 2

* MP3 @320KB/s Birtate

* MP3 @128KB/s Birtate

* MP3 @96KB/s Birtate

* Mono MP3 @320KB/s Birtate

* Mono MP3 @128KB/s Birtate

* Mono MP3 @96KB/s Birtate

The 240p and 360p options have a video bitrate limit of 500KB/s. The 480p options have a video bitrate limit of 1MB. The 720p options have a video bitrate limit of 3MB. These specifications were chosen for compatibility and performance reasons.

## Misc Options

The `Open PPCMC Shell` option starts a Terminal.app window configured for use with the PPCMC 7 [dependency programs](#bundled-programs) in the $PATH. This allows you to use OpenSSL, Python, CURL, or any other program within PPCMC.

The About option displays the versions of PPCMC's dependency programs.

The Display URL option allows you to view websites within the web page using up to TLS 1.3. HTML, mostly text based pages work best. Viewing websites in this way is static. Websites that partially work include wikipedia.org, macintoshgarden.com (even downloads), macos9lives.com, and YouTube.com (no streaming obviously). Keep in mind this results in something broken but most times readable and better then nothing.

## Using The Web Interface

After [installing the web interface](#installation), it will be available on your local network to all your devices. You can figure out the URL to go to from the System Preferences Sharing section, it will be displayed after Web Sharing is turned on.

Then using any computer in the same local network, load that URL but append `ppcmcw` in a Web browser. Example, if you have `10.0.0.72` in System Preferences, load `10.0.0.72/ppcmcw` in the web browser.

Multiple concurrent requests and downloads are supported. A fast G4 does well with 2 simultaneous connections.

## Downloading YouTube Videos With The Web Interface

1) Select any of the download options presented on the web interface homepage.

2) The new page will contain a text box, paste any YouTube link into it and click the Go button. This may take quite a few minutes, all depending on length of video, specified file type, and speed of the server running it.

3) After the process completes, the browser will stop loading and the output of all commands used to complete your request will be displayed. 

4) Click the Downloads link in the web interface to go to the dl directory. This directory contains any videos downloaded via the web interface, which can be downloaded directly to your Mac. This can be cleared by clicking the delete all button on the home page.

## Streaming Web Interface Files

Media files can be streamed directly from the dl directory of the web interface with a compatible web browser. Alternatively you can copy the URL, and open the URL in a media player such as QuickTime 6 (if the format is supported by the media player).

Keep in mind that streaming larger files (i.e. 720p) could be limited by the speed of your PPC Mac and or it's original slow HDD if you still have that.

## Bundled Programs

PowerPC Media Center would not be possible without the work of many others, and their awesome projects all listed below.

* [OpenSSL v1.1.1w](https://openssl-library.org/news/openssl-1.1.1-notes/index.html). Released September 11th 2023, latest of the v1.1.1 branch.

* [Curl v8.10.1](https://curl.se/download.html). Latest version.

* Panther SDL2. This is my fork of SDL version 2.0.3 with changes for Mac OS X 10.3.9 and Mac OS X 10.4.x compatibility.

* [FFMPEG v4.4.5](https://ffmpeg.org/download.html). This includes FFplay and FFprobe. Released 7/29/2024, latest of the v4.4 branch.

* [Python v3.10.15](https://www.python.org/downloads/release/python-31015/). Released 9/7/2024, it is the latest of the v3.10 branch. This is only used for the Tiger builds. 

* [Python v3.6.15](https://www.python.org/downloads/release/python-3615/). Released 9/4/2021, it is the latest of the v3.6 branch. This is only used for the Panther builds. 

* [LAMEVMX v3.100](https://github.com/classilla/lamevmx). A fork of [Lame](https://lame.sourceforge.io/). Latest version.

* [Zlib v1.3.1](https://zlib.net). Latest version.

* [Mozilla's CA PEM (9/24/2024)](https://curl.se/docs/caextract.html). Latest certificates, extracted by the cURL project from Mozilla.

* [LibFFI v3.4.5](https://sourceware.org/libffi/). Latest version. Only needed for Tiger build.

* [Libiconv v1.17](https://www.gnu.org/software/libiconv/). Latest version. Only used for Tiger build.

* [Libiconv v1.11.1](https://www.gnu.org/software/libiconv/). Older version only used for Panther build.

* [AtomicParsley v0.9.0](http://atomicparsley.sourceforge.net). Latest version.

* [YouTube-dl](https://github.com/ytdl-org/youtube-dl). PPCMC7 pulls the latest commit from the master branch of the repo, and ships with the latest commit at the time of release.

* [YouTube-dlp](https://github.com/yt-dlp/yt-dlp). PPCMC7 pulls the latest commit from the master branch of the repo, and ships with the latest commit at the time of release. YouTube-dlp is only available for the Tiger build.

## Licenses

PPCMC itself is released into the Public Domain, see the file [unlicense.md](unlicense.md).

Other open source programs distributed and used by PPCMC 7 are under different licenses, please see the directory named `licenses` in each release.
