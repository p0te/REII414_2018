<?php
error_reporting(E_ALL | E_STRICT);
ini_set('display_errors', 'On');
echo(10);
		// Create connection
		$servername = "localhost";
		$username = "root";
		$password = "root";
		$dbname = "saleco2_0";
		$conn = new mysqli($servername, $username, $password, $dbname);

		// Check connection
		if ($conn->connect_error) {
			die("Connection failed: " . $this->conn->connect_error);
		} 
		$db_out = $conn->query("select * from registeredusers") ;
		while($row = $db_out->fetch_row())
		{
		echo($row[2].'<br/>');
		}
?>


<form action ='index.php' method = "get">
<h2>Login</h2>
<fieldset>
 <label for='Username' >username : </label><br/> 
<input type="text" name="username"><br>
 <label for='password' >Password : </label><br/>  
 <input type="password" name="password"> <br>




<input type="submit" value="Login">
<input type='hidden' name='submitted' id='submitted' value='1'/>
</fieldset>
</form>
