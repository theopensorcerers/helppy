<?php
/**
* Registers a new account
*/

require '../db.php';

$username = $db->real_escape_string($_GET['username'] ? $_GET['username'] : $_POST['username']);
$forename = $db->real_escape_string($_GET['forename'] ? $_GET['forename'] : $_POST['forename']);
$surname = $db->real_escape_string($_GET['surname'] ? $_GET['surname'] : $_POST['surname']);
$email = $db->real_escape_string($_GET['email'] ? $_GET['email'] : $_POST['email']);
$password = md5($_GET['password'] ? $_GET['password'] : $_POST['password']);
$passwordcheck = md5($_GET['passwordcheck'] ? $_GET['passwordcheck'] : $_POST['passwordcheck']);
$description = $db->real_escape_string($_GET['description'] ? $_GET['description'] : $_POST['description']);

if ($password != $passwordcheck) {
    $regerror = "your passwords do not match";
}

if ($username == '' || $email == '' || $password == '' || $passwordcheck == '') {
    echo "Please provide all the required fields";
    return false;
}

$query = "SELECT email FROM users WHERE (email='$email')";
if ($result = $db->query($query)) {
    
    /* fetch object array */
    if ($row = $result->fetch_row()) {
        echo 'This email is already registered.';
    }
    
    /* free result set */
    $result->close();
    return false;
}

$query = "SELECT username FROM users WHERE (username='$username')";
if ($result = $db->query($query)) {
    
    /* fetch object array */
    if ($row = $result->fetch_row()) {
        echo 'This username is already taken.';
    }
    
    /* free result set */
    $result->close();
    return false;
}

$query = "INSERT INTO users (username, forename, surname, email, password, description) VALUES ('$username','$forename','$surname','$email','$password','$description')";
if ($result = $db->query($query)) {
    echo "Account created";
    
    /* free result set */
    $result->close();
    return true;
} else {
    echo "Failed to create user in database";
    
    /* free result set */
    $result->close();
    return false;
}
?>









