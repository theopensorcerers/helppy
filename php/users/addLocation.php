<?php

/**
 * Adds location of user to database
 */

require '../db.php';
header('Content-type: application/json');

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$name = $db->real_escape_string(trim(isset($_GET['name']) ? $_GET['name'] : $_POST['name']));
$postcode = $db->real_escape_string(isset($_GET['postcode']) ? $_GET['postcode'] : $_POST['postcode']);
$spatial = $db->real_escape_string(trim(isset($_GET['spatial']) ? $_GET['spatial'] : $_POST['spatial']));
$point = $db->real_escape_string(trim(isset($_GET['point']) ? $_GET['point'] : $_POST['point']));

if ($name == '' || $userID == '' || $postcode == '' || $spatial == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$locationID;
$query = "SELECT locationID FROM locations WHERE spatial LIKE '%$spatial%'";
if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      $locationID = $row['locationID'];
  }
  /* free result set */
  $result->close();
} 
else {
	$query = "INSERT INTO locations (`postcode`, `spatial`, `point`) VALUES ('$postcode', '$spatial', GeomFromText( '$point'))";
	if ($result = $db->query($query)) {    
	    $locationID = $db->insert_id;
	    // defer commit, do not return success yet
	} else {
	    echo json_encode(array("success" => false, "msg" => "Failed to add location to database <pre><code>$query</code></pre>"));
	    return false;
	    /* free result set */
	    $result->close();
	}
}


$query = "INSERT INTO user_locations (userID, locationID, `name`) VALUES ($userID, $locationID, '$name')";
if ($result = $db->query($query)) {
    $db->commit();
    // commit both inserts

  	echo json_encode(array("success" => true, "msg" => "Location added", "href" => "./profile.php"));

    return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add location to database <pre><code>$query</code></pre>"));
    return false;
    /* free result set */
    $result->close();
}