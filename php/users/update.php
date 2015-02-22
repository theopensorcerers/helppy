<?php

/**
 * Registers a new account
 */
require '../db.php';
header('Content-type: application/json');

$forename = $db->real_escape_string($_GET['forename'] ? $_GET['forename'] : $_POST['forename']);
$surname = $db->real_escape_string($_GET['surname'] ? $_GET['surname'] : $_POST['surname']);
$email = $db->real_escape_string($_GET['email'] ? $_GET['email'] : $_POST['email']);
$current_password = md5($_GET['current_password'] ? $_GET['current_password'] : $_POST['current_password']);
$new_password = md5($_GET['new_password'] ? $_GET['new_password'] : $_POST['new_password']);
$new_password2 = md5($_GET['new_password2'] ? $_GET['new_password2'] : $_POST['new_password2']);
$description = $db->real_escape_string($_GET['description'] ? $_GET['description'] : $_POST['description']);

$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];

// validate that password fields have all been entered
if ($current_password && ($new_password != $new_password2)) {
    echo json_encode(array("success" => false, "msg" => "your passwords do not match"));
    return false;
}

// validate that the email is valid
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(array("success" => false, "msg" => "Please provide a valid email"));
    return false;
}

// validate that the email is not taken by someone else
$query = "SELECT userID FROM users WHERE email='$email' AND userID !='$userID'";
if ($result = $db->query($query)) {
    
    /* fetch object array */
    if ($row = $result->fetch_row()) {
        echo json_encode(array("success" => false, "msg" => "This email is already registered."));
        return false;
    }
    /* free result set */
    $result->close();
}

// Update the password if the 3 fields have been provided correctly
if ($current_password && ($new_password == $new_password2)) {
    $query = "SELECT password FROM users WHERE password='$current_password' AND userID='$userID'";
    if ($result = $db->query($query)) {
        
        /* fetch object array */
        if ($row = $result->fetch_assoc()) {
            if ($row['password'] == $current_password) {
                // Update the password
                $query = "UPDATE users SET password = '$new_password';";
                $result = $db->query($query);
                echo json_encode(array("success" => true, "msg" => "Password updated"));
            }
            else {
                echo json_encode(array("success" => false, "msg" => "The current password provided doesn't match your password"));
                return false;
            }
        }
        /* free result set */
        $result->close();
    }
}

// Update the details
$query = "UPDATE users SET forename='$forename', surname='$surname', email='$email', description='$description' WHERE userID='$userID'";
if ($result = $db->query($query)) {
    $db->commit();
    echo json_encode(array("success" => true, "msg" => "Details updated"));
    /* free result set */
    $result->close();
    return true;
} else {
    echo json_encode(array("success" => true, "msg" => "Failed to update details"));
    /* free result set */
    $result->close();
    return false;
}

?>








