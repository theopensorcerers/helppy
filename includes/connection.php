<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>connection</title>
</head>
<?php 

error_reporting(E_ALL);

$connection=new MySQLi("localhost","root","","mydb");
$connection->select_db("mydb");

if ($connection->connect_errno) {
   printf("Connect failed: %s\n", $connection->connect_error);
   exit();}
   
 ?>
<body>
</body>
</html>