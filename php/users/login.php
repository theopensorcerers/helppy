<?php session_start();
/**
* Login a user
*/

require '../db.php';

// "hybrid" variables can take both GET and POST for more flexibility
$username = $_GET['username'] ? $_GET['username'] : $_POST['username'];
$password = md5($_GET['password'] ? $_GET['password'] : $_POST['password']);

if($username == '') {
	echo 'Username did not reach the server';
} else if($password == '') {
	echo 'Password did not reach the server';
} else {
	$query = "SELECT userID, username, email FROM users WHERE (password='$password' AND username='$username')";
	if ($result = $db->query($query)) {
		if ($row = $result->fetch_assoc()) {
			setcookie('userID', $row['userID'], time()+604800, '/');
			setcookie('username', $row['username'], time()+604800, '/');
			setcookie('email', $row['email'], time()+604800, '/');
	        if (!isset($_COOKIE['userID'])) {
	        	$_SESSION['userID']=$row['userID'];
				$_SESSION['username']=$row['username'];
				$_SESSION['email']=$row['email'];
			}
			header('location:../../index.php');
		} else {
			echo "Invalid credentials";
		}
		/* free result set */
	    $result->close();
	    return false;
	} else {
		echo 'Unable to check credentials';
	}
}
?>
