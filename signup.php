<?php include "includes/header.html" ?>

<div class="container">

        <form class="form-signin" form action="includes/submitreg.php" method=post>
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
        <button class="btn btn-lg btn-primary btn-block" type="submit" value="submit" >SIGN UP</button>
        </a>
      </form>
 <p> <?php if (isset($regerror)) {printf ($regerror);} ?> </p>
    </div> <!-- /container -->    

<?php include "includes/footer.html" ?>
