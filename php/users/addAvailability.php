<?php

/**
 * Adds availabilities to database
 */

require '../db.php';
//header('Content-type: application/json');

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$dayID = $db->real_escape_string(isset($_GET['dayID']) ? $_GET['dayID'] : $_POST['dayID']);
$hourID = $db->real_escape_string(isset($_GET['hourID']) ? $_GET['hourID'] : $_POST['hourID']);

if ($dayID == '' || $hourID == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "SELECT dayID hourID FROM user_availability WHERE (userID = $userID AND dayID = $dayID AND hourID = $hourID)";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "You have already added this availability"));
      return false;
  }
  /* free result set */
  $result->close();
} 


$query = "INSERT INTO user_availability (userID, dayID, hourID) VALUES ($userID, $dayID, $hourID)";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Availability added", "href" => "window.location"));
    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add availability to database"));
    return false;
    /* free result set */
    $result->close();
}

?>