<?php

/**
 * close request message
 */
require '../db.php';
header('Content-type: application/json');

// status is 4 when the request is closed
$statusID = 4;

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$username = isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username'];
$requestID = $db->real_escape_string(isset($_GET['requestID']) ? $_GET['requestID'] : $_POST['requestID']);
$body = $db->real_escape_string(isset($_GET['feedback_body']) ? $_GET['feedback_body'] : $_POST['feedback_body']);
$duration = $db->real_escape_string(isset($_GET['duration']) ? $_GET['duration'] : $_POST['duration']);
$rating = $db->real_escape_string(isset($_GET['rating']) ? $_GET['rating'] : $_POST['rating']);


if ($userID == '' || $requestID == '' || $body == '' || $rating == '' || $duration == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "SELECT requestID FROM requests WHERE (requestID = $requestID AND statusID = $statusID);";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      $result->close();
      echo json_encode(array("success" => false, "msg" => "You have already closed this collaboration"));
      return false;
  }
  /* free result set */
  $result->close();
} 

$subject = "Collaboration with [helppy] $username is finished";

// create feedback entry
$feedbackID;
$query = "INSERT INTO feedback (`requestID`, `duration`, `rating`, `body`) VALUES ($requestID, '$duration', '$rating', '$body');";
if ($result = $db->query($query)) {	
	// defer commit, do not return success yet
} else {
  echo json_encode(array("success" => false, "msg" => "Failed to add feedback to database <br>$db->error<pre><code>$query</code></pre>"));
  return false;
}

$query = "UPDATE requests SET statusID = $statusID WHERE requestID = $requestID;";
if ($result = $db->query($query)) {	
	$db->commit();
  echo json_encode(array("success" => true, "msg" => "Collaboration closed", "href" => "/message.php"));
  return true;
} else {
  echo json_encode(array("success" => false, "msg" => "Failed to modify status to database <br>$db->error<pre><code>$query</code></pre>"));
  return false;
}	

?>