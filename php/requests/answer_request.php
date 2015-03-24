<?php

/**
 * close request message
 */
require '../db.php';
header('Content-type: application/json');

// status is 4 when the request is closed

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$username = isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username'];
$requestID = $db->real_escape_string(isset($_GET['requestID']) ? $_GET['requestID'] : $_POST['requestID']);
$statusID = $db->real_escape_string(isset($_GET['statusID']) ? $_GET['statusID'] : $_POST['statusID']);


if ($userID == '' || $requestID == '' || $statusID == '' ) {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "UPDATE requests SET statusID = $statusID WHERE requestID = $requestID AND `to` = $userID;";
if ($result = $db->query($query)) {
  $db->commit();
  if ($statusID == 2) {
    echo json_encode(array("success" => true, "msg" => "Collaboration accepted", "href" => "/message.php"));
    return true;
  } else {
    echo json_encode(array("success" => true, "msg" => "Collaboration refused", "href" => "/message.php"));
    return true;
  }

} else {
  echo json_encode(array("success" => false, "msg" => "Failed to modify status to database <br>$db->error<pre><code>$query</code></pre>"));
  return false;
}	

?>