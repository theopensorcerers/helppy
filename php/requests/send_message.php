<?php

/**
 * creates request message
 */
require '../db.php';
header('Content-type: application/json');


$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$username = isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username'];
$requestID = $db->real_escape_string(trim(isset($_GET['requestID']) ? $_GET['requestID'] : $_POST['requestID']));
$to = $db->real_escape_string(trim(isset($_GET['to']) ? $_GET['to'] : $_POST['to']));
$body = $db->real_escape_string(isset($_GET['message_body']) ? $_GET['message_body'] : $_POST['message_body']);

if ($userID == '' || $to == '' || $body == '' ) {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));

    return false;
}

if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "You have already send this message"));
      return false;
  }
  /* free result set */
  $result->close();
} 

$subject = "Discussion";


$query = "INSERT INTO `message` (`requestID`, `from`, `to`, `subject`, `body`) VALUES ($requestID, $userID, $to, '$subject', '$body');";
if ($result = $db->query($query)) {
  $db->commit();
    echo json_encode(array("success" => true, "msg" => "Message added", "href" => "/message.php"));
    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add message to the database <br>$db->error<pre><code>$query</code></pre>" ));
    return false;
    /* free result set */
    $result->close();
}

?>