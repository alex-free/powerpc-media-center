<!DOCTYPE html>

<html>
<head>
    <title>
        Display URL
    </title>
</head>
  

<body style="text-align:center;">

<p>Turning off JavaScript may be necessary. Most of the page may be horribly broken regardless.</p>


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
        exec("/Applications/PPCMC.app/bin/curl {$value} &",$o);
print_r($o);
} else { 
	echo "Enter a URL.";
}
?>      

</html>