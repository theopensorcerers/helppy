<?php session_start();
/**
* Login a user
*/

require '../db.php';
header('Content-type: application/json');

// "hybrid" variables can take both GET and POST for more flexibility
$username = isset($_GET['username']) ? $_GET['username'] : $_POST['username'];
$password = md5(isset($_GET['password']) ? $_GET['password'] : $_POST['password']);

if($username == '') {
	echo json_encode(array("success" => false, "msg" => "Username did not reach the server"));
	return false;
} else if($password == '') {
	echo json_encode(array("success" => false, "msg" => "Password did not reach the server"));
	return false;
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
			echo json_encode(array("success" => true, "msg" => "Logged in", "href" => "window.location"));
			return true;
		} else {
			echo json_encode(array("success" => false, "msg" => "Invalid credentials"));
			return false;
		}
		/* free result set */
	    $result->close();
	} else {
		echo json_encode(array("success" => false, "msg" => "Unable to check credentials"));
		return false;
	}
}
?>
