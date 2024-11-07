<!DOCTYPE html>
<html>
<head>
<title>PowerPC Media Center Web Interface</title>
</head>
<body>
<p>Version 0.7 by Alex Free</p>

<a href="index.php">Clear</a> <a href="dl/">Downloads</a>

<form action="index.php" method="post">
  <input type="submit" name='delbutton' value="Delete All Downloads" />
  <input type="submit" name='dlytdlbutton' value="Download The Latest YouTube-dl" />
</form>

<?php
  if (isset($_POST['delbutton'])) {
    set_time_limit(0);
    exec("rm -rf /Library/WebServer/Documents/ppcmcw/dl/* &");
    echo "All Downloads have been deleted..."; 
  } else if (isset($_POST['dlytdlbutton'])) {
    set_time_limit(0);
    exec("/Library/WebServer/Documents/ppcmcw/bin/wcli update &",$o);
    print_r($o); 
  }
?>

<h2>Download</h2>

<ul>
    <li><a href="360p_mp4_h264.php">360p MP4 H.264</a></li>
    <li><a href="720p_mp4_h264.php">720p MP4 H.264</a></li>
</ul>

<h2>Download + Conversion</h2>

<ul>
    <li><a href="mp3.php">MP3</a></li>
    <li><a href="240p_mp1.php">240p MP1 For 300MHZ G3</a></li>
    <li><a href="144p_mp4_q6.php">144p MP4 For QuickTime 6</a></li>
    <li><a href="240p_mp4_q6.php">240p MP4 For QuickTime 6</a></li>
    <li><a href="360p_mp4_q6.php">360p MP4 For QuickTime 6</a></li>
    <li><a href="480p_mp4_q6.php">480p MP4 For QuickTime 6</a></li>
</ul>

<h2>Misc</h2>

<ul>
    <li><a href="display_url.php">Display URL In Browser, Supports TLS 1.3</a></li>
</ul>

<h2>Known Compatibility List</h2>

<p>100%</p>
<ul>
<li>Netscape Navigator 4</li>
<li>Classilla</li>
<li>Internet Explorer 5</li>
<li>TenFourFox</li>
<li>FireFox</li>
<li>Chrome</li>
<li>Safari*</li>
</ul>

<i>*Some versions of Safari may timeout if a selected option takes a long time. If this happens, the selected option will complete, check the <a href="dl/">Downloads</a> for your file.</i>

</body>
</html>
