<!DOCTYPE html>
<html>
<head>
<title>PowerPC Media Center Web Interface</title>
</head>
<body>
<p>0.6 beta by Alex Free</p>

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
    exec("/Applications/PPCMC.app/bin/curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /Applications/PPCMC.app/bin/youtube-dl 2>&1 &",$o);
    print_r($o); 
  }
?>

<ul>
<li><a href="mp3.php">1</a> - Download MP3</li>
<li><a href="240p_mp1.php">2</a> - Download 240p MP1 For 300MHZ G3</li>
<li><a href="144p_mp4_q6.php">3</a> - Download 144p MP4 For QuickTime 6</li>
<li><a href="240p_mp4_q6.php">4</a> - Download 240p MP4 For QuickTime 6</li>
<li><a href="360p_mp4_q6.php">5</a> - Download 360p MP4 For QuickTime 6</li>
<li><a href="480p_mp4_q6.php">6</a> - Download 480p MP4 For QuickTime 6</li>
<li><a href="display_url.php">7</a> - Display URL In Browser, Up To TLS 1.3</li>
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
