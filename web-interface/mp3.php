<!DOCTYPE html>

<html>
<head>
    <title>
        Download MP3
    </title>
</head>
  

<body style="text-align:center;">

<p>Clicking Go may take awhile to complete.</p>


<form method="get" action="<?php echo $_SERVER['PHP_SELF'];?>">
  <input type="text" name="input" />
  <input type="submit" name="submit" value="Go" />
</form>
<a href=mp3.php>Clear</a>
<a href=index.php>Home</a>
<a href="dl/">Downloads</a>
<?php
if (isset($_GET['input'])) {
	echo "URL: " . $_GET['input']; 
	$value =  $_GET['input'];
	set_time_limit(0);
        exec("/Library/WebServer/Documents/ppcmcw/bin/wcli conv_mp3 {$value} &",$o);
echo "Complete. Check the Downloads folder of the Web Interface for your file.";
print_r($o);
} else { 
	echo "Enter a YouTube URL.	";
}
?>      

</html>