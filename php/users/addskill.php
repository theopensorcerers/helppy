<?php

/**
 * Adds skill to database
 */

require '../db.php';
header('Content-type: application/json');

if (isset($_COOKIE['userid'])) {$userId = ($_COOKIE["userID"]);}

$skillId = $db->real_escape_string($_GET['skillId'] ? $_GET['skillId'] : $_POST['skillId']);
$levelId = $db->real_escape_string($_GET['levelId'] ? $_GET['levelId'] : $_POST['levelId']);


if ($skillId == '' || $levelId == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
   return false;
}

//$query = "SELECT skillId FROM user_skills WHERE (userId = '$userId')";
//if ($result = $db->query($query)) {
    
    /* fetch object array */
   // if ($result == $skillId) {
   //     echo json_encode(array("success" => false, "msg" => "You have already added this skill"));
  //      return false;
  //  }
    
    /* free result set */
  //  $result->close();
//} 


$query = "INSERT INTO user_skills (userID, skillID, levelID) VALUES ('$userId', '$skillId','$levelId')";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Skill added", 
                            ));
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