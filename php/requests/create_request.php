<?php

/**
 * creates request message
 */
require '../db.php';
header('Content-type: application/json');

// status is 1 by default (created)
$statusID = '1';

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$username = isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username'];
$to = $db->real_escape_string(trim(isset($_GET['helper_ID']) ? $_GET['helper_ID'] : $_POST['helper_ID']));
$skillID = $db->real_escape_string(trim(isset($_GET['request_skill_ID']) ? $_GET['request_skill_ID'] : $_POST['request_skill_ID']));
$body = $db->real_escape_string(isset($_GET['request_body']) ? $_GET['request_body'] : $_POST['request_body']);
$start_date = $db->real_escape_string(trim(isset($_GET['request_start_date']) ? $_GET['request_start_date'] : $_POST['request_start_date']));
$end_date = $db->real_escape_string(trim(isset($_GET['request_end_date']) ? $_GET['request_end_date'] : $_POST['request_end_date']));

if ($userID == '' || $to == '' || $skillID == '' || $body == '' || $start_date == '' || $end_date == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = <<<EOF
SELECT 
    skillID
FROM
    requests
        INNER JOIN
    request_skills USING (requestID)
WHERE
    (`from` = $userID 
        AND `to` = $to
        AND `skillID` = $skillID
        AND `statusID` = $statusID)
EOF;

if ($result = $db->query($query)) {
  /* fetch object array */
  if ($row = $result->fetch_row()) {
      echo json_encode(array("success" => false, "msg" => "You have already an outstanding request of the same skill for this user"));
      return false;
  }
  /* free result set */
  $result->close();
} 

$subject = "[helppy] $username needs your help";


// create request entry
$requestID;
$query = "INSERT INTO requests (`from`, `to`, `start_date`, `end_date`, `statusID`) VALUES ($userID, $to, '$start_date', '$end_date', $statusID);";
if ($result = $db->query($query)) {	
	$requestID = $db->insert_id;
	// defer commit, do not return success yet
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add request to database <br>$db->error<pre><code>$query</code></pre>"));
    return false;
}	

$query = "INSERT INTO `user_requests` (`userID`, `requestID`) VALUES ($userID, $requestID);";		
if (!$result = $db->query($query)) {
    echo json_encode(array("success" => false, "msg" => "Failed to link request to user in the database <br>$db->error<pre><code>$query</code></pre>"));
    return false;
}

$query = "INSERT INTO `request_skills` (`skillID`, `requestID`) VALUES ($skillID, $requestID);";       
if (!$result = $db->query($query)) {
    echo json_encode(array("success" => false, "msg" => "Failed to link request to skill in the database <br>$db->error<pre><code>$query</code></pre>"));
    return false;
}


$query = "INSERT INTO `message` (`requestID`, `from`, `to`, `subject`, `body`) VALUES ($requestID, $userID, $to, '$subject', '$body');";
if ($result = $db->query($query)) {
	$db->commit();
    echo json_encode(array("success" => true, "msg" => "Request added", "href" => "$baseurl/message/$requestID"));
   	return true;
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to add message to the database <br>$db->error<pre><code>$query</code></pre>" ));
    return false;
}

?>