<?php
require('db.php');
session_start();
if (array_key_exists('filename', $_GET))
{
	if (($diskname = getFilename($_GET['filename'])) !== FALSE)
	{
		$diskname = "uploads/$diskname";
		if (file_exists($diskname))
		{
			//header('Content-Description: File Transfer');
			//header('Content-Type: application/octet-stream');
			//header('Content-Disposition: attachment; filename="'.$_GET['filename'].'"');
			header('Content-Type: image/jpeg');
			header('Expires: 0');
			header('Cache-Control: must-revalidate');
			header('Pragma: public');
			header('Content-Length: ' . filesize($diskname));
			readfile($diskname);
		}
	}
}
?>