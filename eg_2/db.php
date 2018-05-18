<?php

$db = mysqli_connect("localhost", "root", "", "demo") or die(mysqli_error($db));

function login($userid, $password)
{
	global $db;
	$userid = addslashes($userid);
	$password = addslashes($password);
	$q = "select 1 from users where userid = '$userid' and password = '$password'";
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
	{
		//echo mysqli_error($db);
		return FALSE;
	}
	if (mysqli_num_rows($res) == 0)
	{
		//echo "Login: 0 rows";
		return FALSE;
	}
	
	$sessionid = sha1(microtime() . mt_rand());
	$q = "insert into sessions(userid, sessionid, sessiontime) values ('$userid', '$sessionid', unix_timestamp())";
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
		return FALSE;
	
	$_SESSION[sessionid] = $sessionid;
		
	return TRUE;
}

function sessionValid()
{
	global $db;
	$q = "select 1 from sessions where sessionid = '". addslashes($_SESSION['sessionid']) ."'";
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
		return FALSE;
	if (mysqli_num_rows($res) == 0)
		return FALSE;
	return TRUE;
}

function usernameFromSession()
{
	global $db;
	$q = "select username from users where userid = (select userid from sessions where sessionid = '" . addslashes($_SESSION['sessionid']) ."')";
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
	{
		echo mysqli_error($db);
		return FALSE;
	}
	if (mysqli_num_rows($res) == 0)
	{
		echo "usernameFromSession: 0 rows";
		return FALSE;
	}
	$row = mysqli_fetch_assoc($res);
	return $row['username'];
}

function addFileName($diskname, $alias)
{
	global $db;
	$diskname = addslashes($diskname);
	$alias = addslashes($alias);
	$q = "insert into files (diskname, alias) values ('$diskname', '$alias')";
	//echo $q;
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
		return mysqli_error($db);
	return "OK";
}

function getFileName($alias)
{
	global $db;
	$alias = addslashes($alias);
	$q = "select diskname from files where alias = '$alias'";
	//echo $q;
	$res = mysqli_query($db, $q);
	if (mysqli_errno($db))
		return FALSE;
	if (mysqli_num_rows($res) == 0)
		return FALSE;
	$row = mysqli_fetch_assoc($res);
	return $row['diskname'];
}
