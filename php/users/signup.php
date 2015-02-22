<?php

/**
 * Registers a new account
 */

require '../db.php';
header('Content-type: application/json');

$username = $db->real_escape_string($_GET['username'] ? $_GET['username'] : $_POST['username']);
$email = $db->real_escape_string($_GET['email'] ? $_GET['email'] : $_POST['email']);
$password = md5($_GET['password'] ? $_GET['password'] : $_POST['password']);
$passwordcheck = md5($_GET['passwordcheck'] ? $_GET['passwordcheck'] : $_POST['passwordcheck']);

if ($password != $passwordcheck) {
    echo json_encode(array("success" => false, "msg" => "Your passwords do not match"));
    return false;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(array("success" => false, "msg" => "Please provide a valid email"));
    return false;
}

if ($username == '' || $email == '' || $password == '' || $passwordcheck == '') {
    echo json_encode(array("success" => false, "msg" => "Please provide all the required fields"));
    return false;
}

$query = "SELECT email FROM users WHERE (email='$email')";
if ($result = $db->query($query)) {
    
    /* fetch object array */
    if ($row = $result->fetch_row()) {
        echo json_encode(array("success" => false, "msg" => "This email is already registered"));
        return false;
    }
    
    /* free result set */
    $result->close();
}

$query = "SELECT username FROM users WHERE (username='$username')";
if ($result = $db->query($query)) {
    
    /* fetch object array */
    if ($row = $result->fetch_row()) {
        echo json_encode(array("success" => false, "msg" => "This username is already taken"));
        return false;
    }
    
    /* free result set */
    $result->close();
}

$query = "INSERT INTO users (username, email, password) VALUES ('$username','$email','$password')";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Account created, you can now loggin", 
                            "post_to" => "#login_form", 
                            "post_data" => array("#username" => $username,
                                                 "#password" => $_GET['password'] ? $_GET['password'] : $_POST['password'])));
    return true;
    
    /* free result set */
    $result->close();
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to create user in database"));
    return false;
    
    /* free result set */
    $result->close();
}
?>









