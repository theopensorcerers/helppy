<?php include "includes/header.html" ?>

<div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Log in</h2>
        <label for="inputEmail" class="sr-only">username</label>
        <input type="text" id="inputEmail" class="form-control" placeholder="Email address" autofocus>
        <label for="inputPassword" class="sr-only">password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <a href="home-login.php">
        <button class="btn btn-lg btn-primary btn-block" type="submit">LOG IN</button>
        </a>
      </form>

    </div> <!-- /container -->             

<?php include "includes/footer.html" ?>
