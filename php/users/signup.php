<?php

/**
 * Registers a new account
 */

require '../db.php';
header('Content-type: application/json');

$username = $db->real_escape_string(isset($_GET['username']) ? $_GET['username'] : $_POST['username']);
$email = $db->real_escape_string(isset($_GET['email']) ? $_GET['email'] : $_POST['email']);
$password_clear = isset($_GET['password']) ? $_GET['password'] : $_POST['password'];
$password = md5(isset($_GET['password']) ? $_GET['password'] : $_POST['password']);
$passwordcheck = md5(isset($_GET['passwordcheck']) ? $_GET['passwordcheck'] : $_POST['passwordcheck']);

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
                                                 "#password" => isset($_GET['password']) ? $_GET['password'] : $_POST['password'])));

     // prepare an email reminder
     $headers = "MIME-Version: 1.0" . "\r\n";
     $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
     $headers .= 'From: <noreply@helppy.org.uk>' . "\r\n";
     $subject = "Helppy - Welcome to the community!";
     $message = "
     <html>
       <head>
         <title>Helppy - Welcome</title>
       </head>
       <body>
         <p>
           Welcome to the community $username,<br>
           Here's your username and password
         </p>
         <table>
           <tr>
             <th>Username</th>
             <td><pre>$username</pre></td>
           </tr>
           <tr>
             <th>Password</th>
             <td><pre>$password_clear</pre></td>
           </tr>
         </table>
         <p>
           Looking forward to see you soon on <a href=\"http://helppy.org.uk\">Helppy.org.uk</a>!
         </p>
       </body>
     </html>
     ";

     // send the email
     mail($email,$subject,$message,$headers);

    return true;
} else {
    echo json_encode(array("success" => false, "msg" => "Failed to create user in database"));
    return false;

    /* free result set */
    $result->close();
}
?>
