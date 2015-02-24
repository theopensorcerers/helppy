<?php

/**
 * Adds skill to database
 */

require '../db.php';
//header('Content-type: application/json');

$this_userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$userID = $db->real_escape_string(isset($_GET['userID']) ? $_GET['userID'] : $_POST['userID']);
$skillID = $db->real_escape_string(isset($_GET['skillID']) ? $_GET['skillID'] : $_POST['skillID']);
$levelID = $db->real_escape_string(isset($_GET['levelID']) ? $_GET['levelID'] : $_POST['levelID']);

if ($skillID == '' || $levelID == '' || $userID == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

if ($userID != $this_userID) {
    echo json_encode(array("success" => false, "msg" => "Trying to remove details for a different user"));
    return false;
}

$query = "SELECT skillID FROM user_skills WHERE userID = $userID AND skillID = $skillID AND levelID = $levelID";
if ($result = $db->query($query)) {
  /* fetch object array */
  if (!$row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "No such skill found in the database"));
      return false;
  }
  /* free result set */
  $result->close();
} 


$query = "DELETE FROM user_skills WHERE userID = $userID AND skillID = $skillID AND levelID = $levelID";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Skill deleted", "href" => "window.location"));
    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add skill to database"));
    return false;
    /* free result set */
    $result->close();
}

?>