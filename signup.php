<?php include "includes/header.html" ?>

<div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Sign up</h2>
        <label for="inputName" class="sr-only">name</label>
        <input type="text" id="inputName" class="form-control" placeholder="Name" autofocus>
        <label for="inputUsername" class="sr-only">username</label>
        <input type="text" id="inputUsername" class="form-control" placeholder="*Username" autofocus>
        <label for="inputPassword" class="sr-only">password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="*Password" autofocus>
        <label for="inputPassword" class="sr-only">password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="*Repeat Password" autofocus>
        <div class="checkbox">
        <label for="inputDescription" class="sr-only">password</label>
        <textarea rows="6" autofocus="autofocus" class="form-control" id="inputDescription" placeholder="Tell us about your skills"></textarea>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <a href="home-login.php">
        <button class="btn btn-lg btn-primary btn-block" type="submit">LOG IN</button>
        </a>
      </form>

    </div> <!-- /container hola -->    

<?php include "includes/footer.html" ?>
