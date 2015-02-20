<?php 

include "includes/header.html";
error_reporting(E_ALL);
//if(isset($_POST['Submit'])) {
//include 'includes/connection.php';
   
// define variables and set to empty values
$usernameErr = $emailErr = $passwordErr = $passwordcheckErr = "";
$username = $email = $forename = $surname = $password = $passwordcheck = $description = "";


if ($_SERVER["REQUEST_METHOD"] == "POST") 

{
  $username = test_input($_POST["username"]);
  $email = test_input($_POST["email"]);
  $forename = test_input($_POST["forename"]);
  $surname = test_input($_POST["surname"]);
  $password = test_input($_POST["password"]);
  $passwordcheck = test_input($_POST["passwordcheck"]);
  $description = test_input($_POST["description"]);
}

function test_input($data) 
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}


if ($_SERVER["REQUEST_METHOD"] == "POST") 
{
  if (empty($_POST["username"])) 
  {
    $usernameErr = "Username is required";
  } 
  
  else 
  {
    $username = test_input($_POST["username"]);
 }


  
  if (empty($_POST["email"])) 
{
     $emailErr = "Email is required";
} 
	else 
	{
     $email = test_input($_POST["email"]);
     // check if e-mail address is well-formed
     if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 
	 	{
       $emailErr = "Invalid email format"; 
     	} 
	}
   
  
  if (empty($_POST["forename"])) 
  {
    $forename = "";
  } 
  else {
    $forename = test_input($_POST["forename"]);
  		}


  if (empty($_POST["surname"])) 
  {
    $comment = "";
  } 
  else {
    $surname = test_input($_POST["surname"]);
  		}

  if (empty($_POST["password"])) 
  {
    $passwordErr = "Password is required";
  } 
  else {
    $password = test_input($_POST["password"]);
  		}
  
   if (empty($_POST["passwordcheck"])) 
   {
    $passwordcheckErr = "Confirmation password is required";
  } 
  else {
    $passwordcheck = test_input($_POST["passwordcheck"]);
	   }
  
  if (empty($_POST["description"])) 
  {
    $description = "";
  } 
  else {
    $description = test_input($_POST["description"]);
  		}

}

if (empty($usernameErr))
{if (empty($passwordnameErr)) 
	{	if  (empty($passwordcheckErr)) 






		{
include "includes/connection.php";

$stmt="INSERT INTO users (username, forename, surname, email, password, description) VALUES ('$username','$forename','$surname','$email','$password','$description')";

if ( $connection->query($stmt) )
			{
Echo "Record successfully inserted";

			}

Else
				{
Echo "There is some problem in inserting record";
				}

		}
	} 
}
?>

<div class="container">

        <form class="form-signin" form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <h2 class="form-signin-heading">Sign up</h2>
        <label for="forename" class="sr-only">First name</label>
        <input type="text" input name="forename" id="forename" class="form-control" placeholder="First Name" value="<?php echo $forename;?>"autofocus>
        <label for="surname" class="sr-only">Second name</label>
        <input type="text" input name="surname"id="surname" class="form-control" placeholder="Second Name" value="<?php echo $surname;?>"autofocus>
        <label for="username" class="sr-only">username</label>
        <input type="text" input name="username"id="username" class="form-control" placeholder="*Username" value="<?php echo $username;?>"autofocus>
        <?php echo $usernameErr;?>
        <label for="email" class="sr-only">email</label>
        <input type="text" input name="email"id="email" class="form-control" placeholder="*Email address" value="<?php echo $email;?>"autofocus>
        <?php echo $emailErr;?>
        <label for="password" class="sr-only">password</label>
        <input type="password" input name="password" id="password" class="form-control" placeholder="*Password" autofocus>
        <?php echo $passwordErr;?>  
        <label for="passwordcheck" class="sr-only">passwordcheck</label>
        <input type="password" input name="passwordcheck"id="passwordcheck" class="form-control" placeholder="*Repeat Password" autofocus>
        <?php echo $passwordcheckErr;?>   
        <div class="checkbox">
        <label for="description" class="sr-only"></label>
        <textarea rows="6" autofocus class="form-control" input name="description" id="description" placeholder="Tell us about your skills" 
        <textarea><?php echo $description;?></textarea>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        
        <a>        
        <button class="btn btn-lg btn-primary btn-block" input name='Submit' type="submit" value="Submit" >SIGN UP</button>
        </a>
      </form> 
	  
 </div> <!-- /container -->
    
   
 <?php include "includes/footer.html" ?> 

