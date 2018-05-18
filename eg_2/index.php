<?php
if (isset($_POST['username']) && isset($_POST['password']))
{
	session_start();
	require("db.php");
	if (login($_POST['username'], $_POST['password']))
		die(header("Location: startpage.php"));
}
?>

<form method="post" action="index.php">
<input type="text" name="username"><br>
<input type="password" name="password"><br>
<input type="submit" value="Login">
</form>