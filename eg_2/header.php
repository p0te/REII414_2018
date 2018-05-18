w?php
session_start();
if (!isset($_SESSION['sessionid']))
	die(header("Location: index.php"));

require("db.php");

if (!sessionValid())
	die(header("Location: index.php"));


echo "Hello " . usernameFromSession() . "<br>";
?>
<a href="startpage.php">Home</a>&nbsp;&nbsp;
<a href="upload.php">Upload stuff</a><br>
<hr>
