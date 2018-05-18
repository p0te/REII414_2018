<?php
require "header.php";

?>

<form enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
<input type="hidden" name="submitted" value="1">
Choose a file to upload: <input name="uploadedfile" type="file"><br>
<input type="submit" value="Upload File"><br>
</form>

<pre>
<?php
if (array_key_exists('submitted', $_POST))
{
	foreach ($_FILES as $submitname => $data)
	{
		if ($data['error'] == 0)
		{
			if (getFileName($data['name']) === FALSE)
			{
				$filename = sha1_file($data['tmp_name']);
				
				if (move_uploaded_file($data['tmp_name'], "uploads/$filename") === FALSE)
				{
					echo "ERROR: move_uploaded_file: " . $data['error'] . "<br>";
				}
				else if ($ret = addFileName($filename, $data['name']) != "OK")
				{
					echo "ERROR: addFileName:  $ret<br>";
					unlink('uploads/$filename');
				}
				else
					echo "File successfully uploaded.<br>";
			}
			else
				echo "ERROR: File already exists under this alias.<br>";
		}
		else
			echo "ERROR: Upload error ".	$data['error'] . "<br>";
	}
}

?>
</pre>