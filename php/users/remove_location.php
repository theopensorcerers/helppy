<?php

/**
 * Remove location of user to database
 */

require '../db.php';
header('Content-type: application/json');

$this_userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$locationID = $db->real_escape_string(trim(isset($_GET['locationID']) ? $_GET['locationID'] : $_POST['locationID']));

if ($userID == '' || $locationID == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

if ($userID != $this_userID) {
    echo json_encode(array("success" => false, "msg" => "Trying to remove details for a different user"));
    return false;
}


$query = "SELECT locationID FROM locations WHERE userID = $userID AND locationID = $locationID";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "No such location found in the database"));
      return false;
  }
  /* free result set */
  $result->close();
} 


$query = "DELETE FROM user_locations WHERE userID = $userID AND locationID = $locationID";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Location deleted", "href" => "window.location"));
    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to remove from to database"));
    return false;
    /* free result set */
    $result->close();
}

?>
