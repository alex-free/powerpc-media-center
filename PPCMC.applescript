------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- A G.U.I. for the Python Script youtube-dl (http://rg3.github.io/youtube-dl/). Written by Adam Albrec (avalbrec@gmail.com) --
------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Version 6 Lite      2020 'Hugh Downs' Edition      (FINAL UPDATE 01/18/2020) 
-- Version 7 (02/25/2020)  Alex Free
-- Version 7.0.1(02/26/2020) 
-- Version 7.0.2(02/28/2020) 
-- Version 7.0.3(3/4/2020) 
-- Version 7.0.4(3/10/2020) 
-- Version 7.0.5(3/11/2020) 
-- Version 7.0.6(3/11/2020) 
-- Version 7.0.7(3/20/2020) 
-- Version 7.0.8(3/20/2020) 
-- Version 7.0.9(4/2/2020)
-- Version 7.1(4/7/2020)
-- Version 7.1.1(4/15/2020)
-- Version 7.1.2(5/7/2020)
-- Version 7.1.3(5/7/2020)
-- Version 7.1.4(5/10/2020)
-- Version 7.1.5(5/10/2020)
-- Version 7.1.6(6/27/2020)
-- Version 7.1.7(7/12/2020)
-- Version 7.1.8(7/15/2020)
-- Version 7.1.9(8/15/2020)
-- Version 7.2(10/26/2020)
-- Version 7.2.1(10/28/2020)
-- Version 7.2.3(2/26/2021)
-- Version 7.2.4(5/23/2021)
-- Version 7.2.5(5/27/2021)
-- Version 7.2.6(12/10/21)
-- Version 7.2.7 (11/5/2024)

global rdmString
global setFileExe
global thePath
global dateCurrent
global pageURL
global actionChoice
global w1
global video_p
global version
global qtLink
global pageURL
global format
global cd_file
global cpu
global youtube

set version to "7.2.7" as text
-- Functions

on get_real_link()
	set videoURL_data to paragraphs of (do shell script "export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -i -f " & format & " --get-url '" & pageURL & "'") as list
	set listTest to the number of items of videoURL_data
	
	if listTest > 1 then
		set qtLink to (the first item of videoURL_data) as list
	else
		set qtLink to videoURL_data as text
	end if
end get_real_link

on pref()
	tell application "System Events"
		if not (exists file "/Applications/PPCMC.app/vp-pref") then
			
			tell me
				activate
				set actionChoice to (choose from list {"FFplay", "VLC", "MPlayer"} with prompt "Select your media player" OK button name "OK" cancel button name "Cancel" default items "FFplay" without multiple selections allowed) as text
			end tell
			
			if actionChoice is "FFplay" then
				set cpu to ((do shell script "machine") as text)
				tell me
					activate
					set actionChoice to (choose from list {"Yes", "No"} with prompt "Do you want videos to automatically start full screen?" OK button name "OK" cancel button name "Cancel" default items "Yes" without multiple selections allowed) as text
				end tell
				
				if actionChoice is "Yes" then
					if cpu is "i486" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fs\" > /Applications/PPCMC.app/vp-pref"
					else if cpu is "ppc750" or cpu is "ppc7400" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fs -fast -vf scale=in_color_matrix=yuva420p,format=rgb32 -skip_frame 8 -skip_loop_filter 48\" > /Applications/PPCMC.app/vp-pref"
					else if cpu is "ppc7450" then
						tell me
							activate
							set actionChoice to (choose from list {"Yes (Slow PowerPC G4)", "No (Fast PowerPC G4)"} with prompt "Would you like to optimze FFplay for faster playback at a lesser quality?" OK button name "OK" cancel button name "Cancel" default items "No (Fast PowerPC G4)" without multiple selections allowed) as text
						end tell
						if actionChoice is "Yes (Slow PowerPC G4)" then
							do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fs -fast -vf scale=in_color_matrix=yuva420p,format=rgb32 -skip_frame 8 -skip_loop_filter 48\" > /Applications/PPCMC.app/vp-pref"
						else if actionChoice is "No (Fast PowerPC G4)" then
							do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fs -fast -vf scale=in_color_matrix=yuva420p,format=rgb32\" > /Applications/PPCMC.app/vp-pref"
						end if
					else if cpu is "ppc970" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -fast -autoexit -loglevel quiet -fs -fast -vf scale=in_color_matrix=yuva420p,format=rgb32\" > /Applications/PPCMC.app/vp-pref"
					end if
					
				else if actionChoice is "No" then
					if cpu is "i486" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet\" > /Applications/PPCMC.app/vp-pref"
					else if cpu is "ppc750" or cpu is "ppc7400" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fast -vf scale=in_color_matrix=yuva420p,format=rgb32 -skip_frame 8 -skip_loop_filter 48\" > /Applications/PPCMC.app/vp-pref"
					else if cpu is "ppc7450" then
						tell me
							activate
							set actionChoice to (choose from list {"Yes (Slow PowerPC G4)", "No (Fast PowerPC G4)"} with prompt "Would you like to optimze FFplay for faster playback at a lesser quality?" OK button name "OK" cancel button name "Cancel" default items "No (Fast PowerPC G4)" without multiple selections allowed) as text
						end tell
						
						if actionChoice is "Yes (Slow PowerPC G4)" then
							do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fast -vf scale=in_color_matrix=yuva420p,format=rgb32 -skip_frame 8 -skip_loop_filter 48\" > /Applications/PPCMC.app/vp-pref"
						else if actionChoice is "No (Fast PowerPC G4)" then
							do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -autoexit -loglevel quiet -fast -vf scale=in_color_matrix=yuva420p,format=rgb32\" > /Applications/PPCMC.app/vp-pref"
						end if
						
					else if cpu is "ppc970" then
						do shell script "echo \"/Applications/PPCMC.app/bin/ffplay -fast -autoexit -loglevel quiet -fast -vf scale=in_color_matrix=yuva420p,format=rgb32\" > /Applications/PPCMC.app/vp-pref"
					end if
				end if
				
			else if actionChoice is "VLC" then
				
				set vtest to "/Applications/VLC.app/Contents/MacOS/VLC" as text
				tell application "System Events"
					if not (exists file vtest) then
						set vlc_path to POSIX path of (choose folder with prompt "Seems like VLC.app is not in the /Applications directory, so where is it?")
					else
						set vlc_path to "/Applications/VLC.app"
					end if
				end tell
				
				tell me
					activate
					set actionChoice to (choose from list {"Yes", "No"} with prompt "Do you want videos to automatically start full screen?" OK button name "Yes" cancel button name "Cancel" default items "Yes" without multiple selections allowed) as text
				end tell
				if actionChoice is "Yes" then
					do shell script "echo \"" & vlc_path & "/Contents/MacOS/VLC --fullscreen\" > /Applications/PPCMC.app/vp-pref"
				else if actionChoice is "No" then
					do shell script "echo \"" & vlc_path & "/Contents/MacOS/VLC\" > /Applications/PPCMC.app/vp-pref"
				end if
				
			else if actionChoice is "Mplayer" then
				set mtest to "/opt/local/bin/mplayer" as text
				tell application "System Events"
					if not (exists file mtest) then
						(display dialog "This feature requires Mplayer (version 1.3 recommended) installed at /opt/local/bin/mplayer" buttons "OK")
						error number -128
					end if
				end tell
				tell me
					activate
					set actionChoice to (choose from list {"Yes", "No"} with prompt "Do you want videos to automatically start full screen?" OK button name "Yes" cancel button name "No" default items "Yes" without multiple selections allowed) as text
				end tell
				if actionChoice is "Yes" then
					do shell script "echo \"/opt/local/bin/mplayer -fs\" > /Applications/PPCMC.app/vp-pref"
				else if actionChoice is "No" then
					do shell script "echo /opt/local/bin/mplayer > /Applications/PPCMC.app/vp-pref"
				end if
			end if
		end if
	end tell
	
	tell application "System Events"
		if not (exists file "/Applications/PPCMC.app/yt-pref") then
			if (exists file "/Applications/PPCMC.app/bin/python3.6") then
				do shell script "echo \"python3.6 /Applications/PPCMC.app/bin/youtube-dl-master/youtube_dl/__main__.py --prefer-ffmpeg --ffmpeg-location=/Applications/PPCMC.app/bin/ffmpeg\" > /Applications/PPCMC.app/yt-pref"
				
			else
				tell me
					activate
					set actionChoice to (choose from list {"YouTube-dl", "YouTube-dlp"} with prompt "Select your YouTube downloader" OK button name "OK" cancel button name "Cancel" default items "YouTube-dlp" without multiple selections allowed) as text
				end tell
				
				if actionChoice is "YouTube-dl" then
					do shell script "echo \"python3.10 /Applications/PPCMC.app/bin/youtube-dl-master/youtube_dl/__main__.py --prefer-ffmpeg --ffmpeg-location=/Applications/PPCMC.app/bin/ffmpeg\" > /Applications/PPCMC.app/yt-pref"
				else if actionChoice is "YouTube-dlp" then
					do shell script "echo \"python3.10 /Applications/PPCMC.app/bin/yt-dlp-master/yt_dlp/__main__.py --prefer-ffmpeg --ffmpeg-location=/Applications/PPCMC.app/bin/ffmpeg\" > /Applications/PPCMC.app/yt-pref"
				end if
			end if
		end if
	end tell
	
	tell application "System Events"
		if not (exists file "/Applications/PPCMC.app/vp-pref") then
			(display dialog "You will not be able to use PowerPC Media Center until you select your video player preferences." buttons "OK")
			error number -128
		end if
	end tell
	
	tell application "System Events"
		if not (exists file "/Applications/PPCMC.app/yt-pref") then
			(display dialog "You will not be able to use PowerPC Media Center until you select your YouTube downloader preferences." buttons "OK")
			error number -128
		end if
	end tell
	
	set video_p to ((do shell script "cat /Applications/PPCMC.app/vp-pref") as text)
	set youtube to ((do shell script "cat /Applications/PPCMC.app/yt-pref") as text)
end pref

-- Creates Download folder on desktop
on date_folder()
	-- Creates Batch-Download folder on desktop (will be added to within same day of script is run more than once) & sorts list (deals with spaces, commas and line-breaks).
	set dateCurrent to ((do shell script "date '+%m-%d-%Y'") as text)
	do shell script "mkdir -p ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/"
	set outputFolder to (((path to desktop from user domain) & "PPCMC Downloads " & dateCurrent) as string) as alias
end date_folder

-- Creates tmp folder
on mktemp()
	set rdmString to ""
	repeat 7 times
		set rdmString to rdmString & some item of "abcdefghijklmnopqrstuvwxyz1234567890"
	end repeat
end mktemp

-- Creates Terminal.app window
on term()
	set dateCurrent to ((do shell script "date '+%m-%d-%Y'") as text)
	tell application "Finder" to get (path to me) as text
	set thePath to the result
	set thePath to POSIX path of thePath
	set w1 to ""
	set setFileExe to (quoted form of the POSIX path of "/usr/bin/setfile") as text
	tell application "System Events"
		set terminalRunning to count of (every process whose name is "Terminal")
		if terminalRunning is 1 then
			tell application "Terminal"
				activate
			end tell
			tell application "System Events" to keystroke "n" using command down
			tell application "Terminal"
				set background color of first window to "black"
				set cursor color of first window to "white"
				set normal text color of first window to "white"
				set bold text color of first window to "white"
				set w1 to first window
			end tell
		else
			tell application "Terminal"
				activate
			end tell
			tell application "Terminal"
				set background color of first window to "black"
				set cursor color of first window to "white"
				set normal text color of first window to "white"
				set bold text color of first window to "white"
				set w1 to first window
			end tell
		end if
	end tell
end term


on get_url()
	set pageURL to ""
	set pageURL_safari to ""
	set pageURL_clipboard to ""
	
	-- Check Safari
	tell application "System Events"
		set safari_check to count of (every process whose name is "Safari")
	end tell
	
	if safari_check is not 0 then
		try
			tell application "Safari"
				set pageURL_safari to URL of front document as text
			end tell
		end try
		
		if pageURL_safari contains "http" then
			set pageURL to pageURL_safari
		end if
		
	end if
	
	-- Check clipboard
	try
		set pageURL_clipboard to (the clipboard) as text
	end try
	
	if pageURL_clipboard contains "http" then
		set pageURL to pageURL_clipboard
	end if
	
	if pageURL_clipboard contains "http" then
		if pageURL_safari contains "http" then
			tell me
				activate
				set actionChoice to (choose from list {"Last Active Safari Window", "Clipboard"} with prompt "There is a URL copied to the clipboard, and Safari is open. What URL would you like to use?" OK button name "OK" cancel button name "Cancel" default items "Last Active Safari Window" without multiple selections allowed) as text
			end tell
			if actionChoice is "Last Active Safari Window" then
				set pageURL to pageURL_safari as text
			else if actionChoice is "Clipboard" then
				set pageURL to pageURL_clipboard as text
			end if
		end if
	else if pageURL does not contain "http" then
		set pageURL to the text returned of (display dialog "This feature requires a URL, enter one below." default answer "")
	end if
	
	-- Parse
	set pageURL to do shell script "echo " & quoted form of pageURL & " | sed 's/ htt/\\
htt/g;s/\\ //g;s/,htt/\\
htt/g;s/,//g' | awk 'NF'"
	set pageURL to do shell script "echo " & quoted form of pageURL & " | sed 's/http.*http/http/g;s/%3A/\\:/g;s/%2F/\\//g;s/%3F/?/g;s/%3D/=/g;s/%26/\\&/g'"
	--Test for more then one URL
	set multi_link_test to {}
	set pageURL_ListTest to {}
	set pageURL_ListTest to the paragraphs of pageURL
	set batchTest to ""
	set batchTest to the number of items of pageURL_ListTest
	if batchTest is greater than 1 as real then
		if multi_link_test is not {} then
			beep
			tell me
				activate
				display dialog "Use one URL at a time, multiple URLs are not supported" default button "OK"
				error number -128
			end tell
		end if
	end if
end get_url

tell application "System Events" to set terminalRunning to count of (every process whose name is "Terminal")
if terminalRunning is 0 then
	try
		do shell script "rm -R ~/.ppcmcTemp"
	end try
else
	set terminalInUse to the count (the windows of application "Terminal" whose name does not contain "bash")
	if terminalInUse is less than 1 then
		try
			do shell script "rm -R ~/.ppcmcTemp"
		end try
	end if
end if

-- Prevents time-out while waiting for user-response.
with timeout of 86400 seconds
	
	-- Start Application if everything checks out
	set btest to ""
	tell application "Finder"
		set btest to POSIX path of ((path to me as text))
	end tell
	if btest is "/Applications/PPCMC.app/" then
		pref()
		tell me
			activate
			set actionChoice to (choose from list {"Edit Preferences", "Play Media File", "Stream YouTube Video In QuickTime", "Stream YouTube Video", "Stream YouTube Live Stream", "Stream Twitch Live Stream", "Download YouTube Video(s) as MP4 H.264", "Download YouTube Video(s) As 144p 3GP", "Download+Convert YouTube Video(s) For QuickTime 6", "Download YouTube Video(s) as M4a", "Download SoundCloud MP3", "Convert Media File", "Update YouTube Downloader", "Download Any URL (Up To TLS v1.3)", "Web Interface", "Open PPCMC Shell", "Check Available Formats", "About"} with prompt "PowerPC Media Center " & version & "" OK button name "OK" cancel button name "Cancel" default items "Stream YouTube Video" without multiple selections allowed) as text
		end tell
	else if btest is not "/Applications/PPCMC.app/" then
		tell me
			activate
			(display dialog "PPCMC.app has to be in the /Applications directory to continue. Please copy it there." buttons "OK")
			set actionChoice to ""
			error number -128
		end tell
	end if
	-- Options
	
	if actionChoice is "Edit Preferences" then
		do shell script "rm -f /Applications/PPCMC.app/vp-pref; rm -f /Applications/PPCMC.app/yt-pref"
		pref()
		
	else if actionChoice is "Play Media File" then
		set play_file to POSIX path of (choose file with prompt "Select Media File")
		do shell script "" & video_p & " \"" & play_file & "\" > /dev/null 2>&1 &"
		
	else if actionChoice is "Web Interface" then
		set actionChoice to (choose from list {"Install", "Uninstall"} with prompt "Web Interface Settings" OK button name "OK" cancel button name "Cancel" default items "Install" without multiple selections allowed) as text
		if actionChoice is "Install" then
			term()
			tell application "Terminal"
				do script "clear; sudo /Applications/PPCMC.app/web-interface/install" in w1
			end tell
		else if actionChoice is "Uninstall" then
			term()
			tell application "Terminal"
				do script "clear; sudo /Applications/PPCMC.app/web-interface/uninstall" in w1
			end tell
		end if
		
	else if actionChoice is "Stream Twitch Live Stream" then
		get_url()
		set actionChoice to (choose from list {"160p", "360p", "480p", "720p"} with prompt "Select resolution for streaming: " & pageURL & " ." OK button name "OK" cancel button name "Cancel" default items "360p" without multiple selections allowed) as text
		if actionChoice is "160p" then
			set format to "160p" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "360p" then
			set format to "360p" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "480p" then
			set format to "480p" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "720p" then
			set format to "720p" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		end if
	else if actionChoice is "Stream YouTube Live Stream" then
		get_url()
		set actionChoice to (choose from list {"144p", "240p", "360p", "480p", "720p"} with prompt "Select resolution for streaming " & pageURL & " ." OK button name "OK" cancel button name "Cancel" default items "360p" without multiple selections allowed) as text
		
		if actionChoice is "144p" then
			set format to "91" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "240p" then
			set format to "92" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "360p" then
			set format to "93" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "480p" then
			set format to "94" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		else if actionChoice is "720p" then
			set format to "300" as text
			get_real_link()
			do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		end if
		
	else if actionChoice is "Convert Media File" then
		set filetoconvertpath to POSIX path of (choose file with prompt "Select file to convert")
		set convertdir to POSIX path of (choose folder with prompt "Select a destination folder for the converted file")
		set convertfile to the text returned of (display dialog "Enter a filename for the converted file (including the file extension .mpeg, .mp4, or .mp3):" default answer "")
		set convertedfilepath to convertdir & convertfile
		if convertfile contains ".mpeg" then
			set actionChoice to (choose from list {"240p MPEG 1 (Up To 500KB/s Video Bitrate)", "360p MPEG 1 (Up To 500KB/s Video Bitrate)", "480p MPEG 1 (Up To 1MB/s Video Bitrate)"} with prompt "Select resolution and bitrate for " & filetoconvertpath & " ." OK button name "OK" cancel button name "Cancel" default items "240p MPEG 1" without multiple selections allowed) as text
		else if convertfile contains ".mp4" then
			set actionChoice to (choose from list {"240p MP4 Part 2 (Up To 500KB/s Video Bitrate)", "360p MP4 Part 2 (Up To 500KB/s Video Bitrate)", "480p MP4 Part 2 (Up To 1MB/s Video Bitrate)", "720p MP4 Part 2 (Up To 3MB/s Video Bitrate)"} with prompt "Select resolution and bitrate for " & filetoconvertpath & " ." OK button name "OK" cancel button name "Cancel" default items "240p MP4 Part 2 (Up To 500KB/s Bitrate)" without multiple selections allowed) as text
		else if convertfile contains ".mp3" then
			set actionChoice to (choose from list {"MP3 @320KB/s Bitrate", "MP3 @128KB/s Bitrate", "MP3 @96KB/s Bitrate", "Mono MP3 @320KB/s Bitrate", "Mono MP3 @128KB/s Bitrate", "Mono MP3 @96KB/s Bitrate"} with prompt "Select bitrate for " & filetoconvertpath & " ." OK button name "OK" cancel button name "Cancel" default items "MP3 @320KB/s Bitrate" without multiple selections allowed) as text
		else
			(display dialog "File name extension unrecognized. Only .mpeg, .mp4, and .mp3 are currently implemented for the output file type." buttons "OK")
		end if
		
		if actionChoice is "240p MPEG 1 (Up To 500KB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 240p MPEG 1...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:240\" -b:v 500k -maxrate 500k -minrate 500k -bufsize 500k -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		else if actionChoice is "360p MPEG 1 (Up To 500KB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 360p MPEG 1...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:360\" -b:v 500k -maxrate 500k -minrate 500k -bufsize 500k -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "480p MPEG 1 (Up To 1MB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 480p MPEG 1...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:480\" -b:v 1m -maxrate 1m -minrate 1m -bufsize 1m -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		else if actionChoice is "240p MP4 Part 2 (Up To 500KB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 240p MP4 Part 2...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:240\" -vcodec mpeg4 -b:v 500k -maxrate 500k -minrate 500k -bufsize 500k -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		else if actionChoice is "360p MP4 Part 2 (Up To 500KB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 360p MP4 Part 2...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:360\" -vcodec mpeg4 -b:v 500k -maxrate 500k -minrate 500k -bufsize 500k -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		else if actionChoice is "480p MP4 Part 2 (Up To 1MB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 480p MP4 Part 2...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:480\" -vcodec mpeg4 -b:v 1m -maxrate 1m -minrate 1m -bufsize 1m -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
		else if actionChoice is "720p MP4 Part 2 (Up To 3MB/s Video Bitrate)" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to 720p MP4 Part 2...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -vf scale=\"trunc(oh*a/2)*2:720\" -vcodec mpeg4 -b:v 3m -maxrate 3m -minrate 3m -bufsize 3m -q:a 0 " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
		else if actionChoice is "MP3 @320KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 320000 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "MP3 @128KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 128000 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "MP3 @96KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 96000 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		else if actionChoice is "Mono MP3 @320KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 320000 -ac 1 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "Mono MP3 @128KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 128000 -ac 1 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "Mono MP3 @96KB/s Bitrate" then
			
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Converting Video to MP3...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/ffmpeg -i \"" & filetoconvertpath & "\" -f mp3 -ar 44100 -ab 96000 -ac 1 -vn -y  " & convertedfilepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
		end if
		
		-- End of conversion menu
		
	else if actionChoice is "Download Any URL (Up To TLS v1.3)" then
		get_url()
		set downloaddir to POSIX path of (choose folder with prompt "Select a download folder for " & pageURL & " ")
		set downloadfile to the text returned of (display dialog "Enter a filename for the downloaded file of " & pageURL & " " default answer "")
		set downloadurl2filepath to downloaddir & downloadfile
		term()
		tell application "Terminal"
			do script "clear;  echo -e \"
\"; echo -e \"
Downloading URL...\"; sleep 1; echo -e \"
\"; /Applications/PPCMC.app/bin/curl -L " & pageURL & " -o " & downloadurl2filepath & ";  &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			
		end tell
		
	else if actionChoice is "Update YouTube Downloader" then
		set youtube to ((do shell script "cat /Applications/PPCMC.app/yt-pref") as text)
		
		if youtube is "python3.6 /Applications/PPCMC.app/bin/youtube-dl-master/youtube_dl/__main__.py --prefer-ffmpeg --ffmpeg-location=/Applications/PPCMC.app/bin/ffmpeg" as text then
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Update Youtube-dl...\"; sleep 1; echo -e \"
\";  rm -Rf /Applications/PPCMC.app/bin/youtube-dl-master; echo Downloading...; /Applications/PPCMC.app/bin/curl -L -o /Applications/PPCMC.app/bin/youtube-dl-master.zip https://github.com/ytdl-org/youtube-dl/archive/refs/heads/master.zip; echo Extracting...; unzip -q /Applications/PPCMC.app/bin/youtube-dl-master.zip -d /Applications/PPCMC.app/bin;  rm /Applications/PPCMC.app/bin/youtube-dl-master.zip; echo Done!" in w1
			end tell
		else if youtube is "python3.10 /Applications/PPCMC.app/bin/yt-dlp-master/yt_dlp/__main__.py --prefer-ffmpeg --ffmpeg-location=/Applications/PPCMC.app/bin/ffmpeg" as text then
			term()
			tell application "Terminal"
				do script "clear;  echo -e \"
\"; echo -e \"
Update Youtube-dlp...\"; sleep 1; echo -e \"
\";  rm -Rf /Applications/PPCMC.app/bin/yt-dlp-master; echo Downloading...; /Applications/PPCMC.app/bin/curl -L -o /Applications/PPCMC.app/bin/yt-dlp-master.zip https://github.com/yt-dlp/yt-dlp/archive/refs/heads/master.zip; echo Extracting...; unzip -q /Applications/PPCMC.app/bin/yt-dlp-master.zip -d /Applications/PPCMC.app/bin;  rm /Applications/PPCMC.app/bin/yt-dlp-master.zip; echo Done!" in w1
			end tell
		end if
	else if actionChoice is "Open PPCMC Shell" then
		term()
		tell application "Terminal"
			do script "clear; ls /Applications/PPCMC.app/bin; echo; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; echo; echo This Terminal window has the path $PATH; echo The above programs are now available" in w1
		end tell
		
	else if actionChoice is "About" then
		term()
		tell application "Terminal"
			do script "clear; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; echo About PPC Media Center; ffplay; ffmpeg; ffprobe; curl -V; openssl version; python3 --version;  echo SDL2 version; sdl2-config --version --cflags --libs; echo YouTube-dl or YouTube-dlp version; " & youtube & " --version; AtomicParsley -v; echo Your media player command; cat /Applications/PPCMC.app/vp-pref; echo; uname -a; machine" in w1
		end tell
		
	else if actionChoice is "Stream YouTube Video" then
		get_url()
		
		set format to "18" as text
		get_real_link()
		do shell script "" & video_p & " \"" & qtLink & "\" > /dev/null 2>&1 &"
		
	else if actionChoice is "Stream YouTube Video In QuickTime" then
		get_url()
		
		set format to "18" as text
		get_real_link()
		try
			tell application "QuickTime Player"
				activate
				getURL qtLink
			end tell
		end try
		
	else if actionChoice is "Download YouTube Video(s) as MP4 H.264" then
		set actionChoice to (choose from list {"144p", "240p", "360p", "480p", "720p", "1080p", "Best Quality"} with prompt "Select Resolution" OK button name "OK" cancel button name "Cancel" default items "360p" without multiple selections allowed) as text
		if actionChoice is "144p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @144p...\"; sleep 1; echo -e \" 
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 160+140 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "240p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @240p...\"; sleep 1; echo -e \" 
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 133+140 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
			
		else if actionChoice is "360p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @360p...\"; sleep 1; echo -e \" 
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 18 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "480p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @480p...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 135+140 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "720p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @720p...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 136+140 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "1080p" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @1080p...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 137+140 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		else if actionChoice is "Best Quality" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video With Best Video And Best Audio...\"; sleep 1; echo -e \"
\"; export PATH=export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best' -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			end tell
			
		end if
	else if actionChoice is "Download YouTube Video(s) As 144p 3GP" then
		get_url()
		mktemp()
		date_folder()
		term()
		tell application "Terminal"
			do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video @144p...\"; sleep 1; echo -e \" 
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 17 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			
		end tell
		
	else if actionChoice is "Download+Convert YouTube Video(s) For QuickTime 6" then
		set actionChoice to (choose from list {"144p MP4 Part 2", "240p MP4 Part 2", "360p MP4 Part 2", "480p MP4 Part 2", "240p MP1 (300 MHZ G3)", "MP3 @320KB/s  Bitrate"} with prompt "Select Format" OK button name "OK" cancel button name "Cancel" default items "Download 480p For QuickTime 6" without multiple selections allowed) as text
		
		if actionChoice is "144p MP4 Part 2" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 160+140 --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting Video to MP4 Part 2...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -qscale 0 -vcodec mpeg4 ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mp4;   rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
			
		else if actionChoice is "240p MP4 Part 2" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 133+140 --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting Video to MP4 Part 2...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -qscale 0 -vcodec mpeg4 ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mp4;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
			
		else if actionChoice is "360p MP4 Part 2" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 134+140 --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting Video to MP4 Part 2...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -qscale 0 -vcodec mpeg4 ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mp4;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
			
		else if actionChoice is "480p MP4 Part 2" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 135+140 --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting Video to MP4 Part 2...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -qscale 0 -vcodec mpeg4 ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mp4;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
		else if actionChoice is "240p MP1 (300 MHZ G3)" then
			get_url()
			mktemp()
			date_folder()
			term()
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 133+140 --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting Video to MPEG 1...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -qscale 0 ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mpeg;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
			
			
		else if actionChoice is "MP3 @320KB/s  Bitrate" then
			
			get_url()
			mktemp()
			date_folder()
			term()
			
			tell application "Terminal"
				do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading Video to Convert...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -f 'bestaudio[ext=m4a]/best' --playlist-end 1 -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "';  echo -e \"
\"; echo -e \"
Converting M4A to MP3...\"; sleep 1; echo -e \"
\"; vidTtl=\"$(ls ~/.ppcmcTemp/" & rdmString & "/)\"; ffmpeg -i ~/.ppcmcTemp/" & rdmString & "/\"${vidTtl}\" -f mp3 -ar 44100 -ab 320000 -vn -y ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/\"${vidTtl%????}\".mp3;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Conversion Complete -\"; sleep 1; echo -e \"
\"" in w1
				
			end tell
		end if
	else if actionChoice is "Download YouTube Video(s) as M4a" then
		get_url()
		mktemp()
		date_folder()
		term()
		tell application "Terminal"
			do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading M4A...\"; sleep 1; echo -e \"
\"; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " --embed-thumbnail -f 'bestaudio[ext=m4a]/best' -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null; rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
			
		end tell
		
	else if actionChoice is "Download SoundCloud MP3" then
		get_url()
		mktemp()
		date_folder()
		term()
		tell application "Terminal"
			do script "clear; mkdir -p ~/.ppcmcTemp/" & rdmString & "/;  echo -e \"
\"; echo -e \"
Downloading SoundCloud MP3 @128KB Bitrate...\"; sleep 1; echo -e \"
\";export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -o ~/.ppcmcTemp/" & rdmString & "/\"%(title)s.%(ext)s\" '" & pageURL & "'; mv -f ~/.ppcmcTemp/" & rdmString & "/* ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ &> /dev/null;  rm -R ~/.ppcmcTemp/" & rdmString & "/; find ~/Desktop/PPCMC\\ Downloads\\ " & dateCurrent & "/ -exec " & setFileExe & " -a -E '{}' \\; &> /dev/null;  echo -e \"
\"; echo -e \"
- Download Complete -\"; sleep 1; echo -e \"
\"" in w1
		end tell
	else if actionChoice is "Check Available Formats" then
		get_url()
		term()
		tell application "Terminal"
			do script "clear; echo Available formats:; export SSL_CERT_FILE=/Applications/PPCMC.app/certs/cacert.pem; export REQUESTS_CA_BUNDLE=/Applications/PPCMC.app/certs/cacert.pem; export PATH=/Applications/PPCMC.app/bin:/bin:/sbin:/usr/bin:/usr/sbin; " & youtube & " -F " & pageURL & "" in w1
		end tell
	end if
	
	----
	-- End of Script.
	----
end timeout
