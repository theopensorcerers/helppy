<?php

/**
 * Registers a new account
 */

require '../db.php';
header('Content-type: application/json');

$email = $db->real_escape_string(isset($_GET['email']) ? $_GET['email'] : $_POST['email']);

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(array("success" => false, "msg" => "Please provide a valid email"));
    return false;
}

$query = <<<EOF
SELECT
    userID AS `userID`,
    email AS `email`,
    username AS `username`,
    forename AS `forename`,
    surname AS `surname`
FROM
    users
WHERE
    (email = '$email')
LIMIT 1;
EOF;
if ($result = $db->query($query)) {
	if ($row = $result->fetch_assoc()) {

      $new_password_clear = substr(hash('sha512',rand()),0,12);
      $new_password = md5($new_password_clear);

      $userID = $row['userID'];
      $to = $row['email'];
      $forename = $row['forename'];
      $surname = $row['surname'];
      $username = $row['username'];

      /* free result set */
      $result->close();

      // Update the details
      $query = "UPDATE users SET password = '$new_password' WHERE userID='$userID';";
      $update = $db->query($query);
      $db->commit();

      // prepare an email reminder
      $headers = "MIME-Version: 1.0" . "\r\n";
      $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
      $headers .= 'From: <noreply@helppy.org.uk>' . "\r\n";
      $subject = "Helppy - Password Reset";
      $message = "
      <html>
        <head>
          <title>Helppy - Password Reset</title>
        </head>
        <body>
          <p>
            Hi $forename $surname, <br>
            Someone, (hopefully you), has reset the password for the account associated with this email. <br>
          </p>
          <table>
            <tr>
              <th>Username</th>
              <td><pre>$username</pre></td>
            </tr>
            <tr>
              <th>Password</th>
              <td><pre>$new_password_clear</pre></td>
            </tr>
          </table>
          <p>
            PS: You can change this generated password from your profile page.
          </p>
          <p>
            Looking forward to see you soon on <a href=\"http://helppy.org.uk\">Helppy.org.uk</a>!
          </p>
        </body>
      </html>
      ";

      // send the email
      mail($to,$subject,$message,$headers);

      echo json_encode(array("success" => true, "msg" => "Hi $username, we've sent you an email @ $to, please check your inbox (and possibly your SPAM)"));
      return true;

    } else {
      echo json_encode(array("success" => false, "msg" => "Email not found, please check your details."));
      return false;
    }
}
?>
