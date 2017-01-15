<?php

/**
 * Adds skill to database
 */

require '../db.php';
header('Content-type: application/json');

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$categoryID = $db->real_escape_string(isset($_GET['categoryID']) ? $_GET['categoryID'] : $_POST['categoryID']);
$skill_name = $db->real_escape_string(trim(isset($_GET['skill_name']) ? $_GET['skill_name'] : $_POST['skill_name']));
$skill_description = $db->real_escape_string(trim(isset($_GET['skill_description']) ? $_GET['skill_description'] : $_POST['skill_description']));
$levelID = $db->real_escape_string(isset($_GET['levelID']) ? $_GET['levelID'] : $_POST['levelID']);

if ($categoryID == '' || $skill_name == '' || $skill_description == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "SELECT skillID FROM skills WHERE name LIKE '%$skill_name%'";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "A skill with the same name already exists"));
      return false;
  }
  /* free result set */
  $result->close();
} 

$skillID;
$query = "INSERT INTO skills (name, description) VALUES ('$skill_name', '$skill_description')";
if ($result = $db->query($query)) {    
    $skillID = $db->insert_id;
    // defer commit, do not return success yet
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add skill to database <pre><code>$query</code></pre>"));
    return false;
    /* free result set */
    $result->close();
}

$query = "INSERT INTO skill_categories (skillID, categoryID) VALUES ($skillID, $categoryID)";
if ($result = $db->query($query)) {
    $db->commit();
    // commit both inserts
    // if we have a levelID, post to a callback form that will link this skill to the user 
    if ($levelID) {
      echo json_encode(array("success" => true, "msg" => "Skill added", 
                            "post_to" => "#create_skills_callback_form", 
                            "post_data" => array("#create_skills_callback_form input[name='skillID']" => $skillID,
                                                 "#create_skills_callback_form input[name='levelID']" => $levelID)));
    } 
    else {
      echo json_encode(array("success" => true, "msg" => "Skill added", "href" => "$baseurl/profile.php"));
    }

    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add skill to database <pre><code>$query</code></pre>"));
    return false;
    /* free result set */
    $result->close();
}

?>
