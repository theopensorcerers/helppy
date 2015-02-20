<?php include "includes/header.html";

if(isset($_POST['Submit'])) {
include 'includes/connection.php';
   
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
$hideform=true;
}

Else
{
Echo "There is some problem in inserting record";
}

}
}
if (empty($hideform))

{ ?>
<div class="container">

        <form class="form-signin" form action="" method="post">
        <h2 class="form-signin-heading">Sign up</h2>
        <label for="forename" class="sr-only">name</label>
        <input type="text" input name="forename" id="forename" class="form-control" placeholder="First Name" autofocus>
        <label for="surname" class="sr-only">username</label>
        <input type="text" input name="surname"id="surname" class="form-control" placeholder="Second Name" autofocus>
        <label for="username" class="sr-only">username</label>
        <input type="text" input name="username"id="username" class="form-control" placeholder="*Username" autofocus>
        <label for="email" class="sr-only">username</label>
        <input type="text" input name="email"id="email" class="form-control" placeholder="*Email address" autofocus>
        <label for="password" class="sr-only">password</label>        
        <input type="password" input name="password" id="password" class="form-control" placeholder="*Password" autofocus>
        <label for="passwordcheck" class="sr-only">password</label>
        <input type="password" input name="passwordcheck"id="passwordcheck" class="form-control" placeholder="*Repeat Password" autofocus>
        <div class="checkbox">
        <label for="description" class="sr-only">password</label>
        <textarea rows="6" autofocus class="form-control" input name="description" id="description" placeholder="Tell us about your skills"></textarea>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        
        <a>        
        <button class="btn btn-lg btn-primary btn-block" input name='Submit' type="submit" value="Submit" >SIGN UP</button>
        </a>
      </form> <?php ;} 
	  else
	  {echo "Thank you for registering";} ?>
      

    
    
    </div> <!-- /container -->
    
     <p> <?php if (isset($regerror)) {printf ($regerror);} 
 			?> </p>
        
<?php




include "includes/footer.html" ?>
