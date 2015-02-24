<?php

/**
 * Adds skill to database
 */

require '../db.php';
//header('Content-type: application/json');

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$skillID = $db->real_escape_string(isset($_GET['skillID']) ? $_GET['skillID'] : $_POST['skillID']);
$levelID = $db->real_escape_string(isset($_GET['levelID']) ? $_GET['levelID'] : $_POST['levelID']);

if ($skillID == '' || $levelID == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "SELECT skillID FROM user_skills WHERE (userID = $userID AND skillID = $skillID)";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "You have already added this skill"));
      return false;
  }
  /* free result set */
  $result->close();
} 


$query = "INSERT INTO user_skills (userID, skillID, levelID) VALUES ($userID, $skillID, $levelID)";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Skill added", "href" => "window.location"));
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