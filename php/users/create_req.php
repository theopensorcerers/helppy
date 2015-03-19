<?php

/**
 * creates request message
 */
require '../db.php';
header('Content-type: application/json');



$body = $db->real_escape_string(isset($_GET['body']) ? $_GET['body'] : $_POST['body']);
$skill = $db->real_escape_string(trim(isset($_GET['reqskill']) ? $_GET['reqskill'] : $_POST['reqskill']));
 
$subject = "Help request for " . $skill ;

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];









// create request entry
$statusID;
$requestID;
$query = "INSERT INTO request_status (`name`) VALUES ('request sent');";



if ($result = $db->query($query)) {
	$statusID = $db->insert_id;
	
	$query = "INSERT INTO requests (`from`, `to`, `start_date`, `end_date`, `statusID`) VALUES (NULL, NULL, now(), NULL, $statusID);";
	
	if ($result = $db->query($query)) {
	$requestID = $db->insert_id;
	$query = "INSERT INTO `user_requests` (`userID`, `requestID`) VALUES ($userID, $requestID);";
	
	if ($result = $db->query($query)) {
		
	$query = "UPDATE `requests` SET `from`='$userID' WHERE `requestID` = '$requestID'           ;";
		
		
	if ($result = $db->query($query)) {	
    
	$query = "INSERT INTO `message` (`requestID`, `from`, `to`, `subject`, `body`) VALUES ($requestID, $userID, NULL, '$subject', '$body');";
	if ($result = $db->query($query)) {
	$db->commit();


    echo json_encode(array("success" => true, "msg" => "Request added", "href" => "window.location"));
   return true;
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => $db->error ));
    return false;
    /* free result set */
    $result->close();
}}}}}

// create user_request entry



//$query = "INSERT INTO messages (requestid, from, to, subject, body) VALUES
//('$requestid','$userid','$user','$subject','$body')


?>