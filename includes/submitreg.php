<?php 

error_reporting(E_ALL);
include 'connection.php';
   
$username=$connection->real_escape_string($_POST['username']);
$forename=$connection->real_escape_string($_POST['forename']);
$surname=$connection->real_escape_string($_POST['surname']);
$email=$connection->real_escape_string($_POST['email']);
$password=md5($_POST['password']);
$passwordcheck=md5($_POST['passwordcheck']);
$description=$connection->real_escape_string($_POST['description']);

If ($password != $passwordcheck) 
{$regerror="your passwords do not match";}

If($_REQUEST['username']=='' || $_REQUEST['forename']=='' ||$_REQUEST['surname']=='' ||$_REQUEST['email']=='' || $_REQUEST['password']==''|| $_REQUEST['passwordcheck']=='')
{
$regerror="please fill the empty field.";


}


If (isset($regerror)) {echo ($regerror);}

Else
{
$stmt="INSERT INTO users (username, forename, surname, email, password, description) VALUES ('$username','$forename','$surname','$email','$password','$description')";

if ( $connection->query($stmt) ){
Echo "Record successfully inserted";
}

Else
{
Echo "There is some problem in inserting record";
}

}


?>









