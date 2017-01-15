<?php

/**
 * Remove availability to database
 */

require '../db.php';
//header('Content-type: application/json');

$this_userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$dayID = $db->real_escape_string(isset($_GET['dayID']) ? $_GET['dayID'] : $_POST['dayID']);
$hourID = $db->real_escape_string(isset($_GET['hourID']) ? $_GET['hourID'] : $_POST['hourID']);

if ($dayID == '' || $hourID == '' || $userID == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

if ($userID != $this_userID) {
    echo json_encode(array("success" => false, "msg" => "Trying to remove details for a different user"));
    return false;
}

$query = "SELECT hourID dayID FROM user_availability WHERE userID = $userID AND hourID = $hourID AND dayID = $dayID";
if ($result = $db->query($query)) {
  /* fetch object array */
  if (!$row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "No such availability found in the database"));
      return false;
  }
  /* free result set */
  $result->close();
} 


$query = "DELETE FROM user_availability WHERE userID = $userID AND hourID = $hourID AND dayID = $dayID";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Availability deleted", "href" => "window.location"));
    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to remove availability to database"));
    return false;
    /* free result set */
    $result->close();
}

?>
