<?php
session_start();
session_destroy();
setcookie("userID","",time()-3600, '/');
setcookie("username","",time()-3600, '/');  
setcookie("email","",time()-3600, '/');   
unset($_COOKIE["userID"]);
unset($_COOKIE["username"]); 
unset($_COOKIE["email"]); 
header('location:../../index.php');
?>
