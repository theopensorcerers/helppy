<?php $page = 'profile'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = $_GET['username'] ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username']);
$my_profile = ($username == $_COOKIE['username'] || $username == $_SESSION['username']);
$userDetails = [];

$query = "SELECT * FROM users WHERE username='$username'";
if ($result = $db->query($query)) {
	if ($row = $result->fetch_assoc()) {
		$userDetails = $row;
	} else {
		echo "No user found for this id";
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

?>

<!-- Profile picure and progress bars -->
<div class="jumbotron">
	<div class="container">
		<div class="space70">
			<div class="row">
				<div class="col-xs-6 col-md-4">
						<div class="thumbnail">
							<img src="images/profile picture.png" src="images/profile picture.png">
								<div class="caption">
									<h3><strong><?php echo $userDetails['username'] ?></strong></h3>
								</div>
						</div>
				</div>
				<div class="col-xs-12 col-md-1">
				</div>
				<div class="col-xs-12 col-md-7">
					<p>I've helped others</p>
					<div class="progress">
						<div class="progress-bar offered" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
						</div>
					</div>
					<p>Others have helped me</p>
					<div class="progress">
						<div class="progress-bar received" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 70%;">
						</div>
					</div>
					<p><?php echo ($my_profile ? 'My' : $userDetails['username']) ?> green</p>
					<div class="progress">
						<div class="progress-bar green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 90%;">
						</div>
					</div>
					<div class="space20">
						<div class="align-right">
							<form method="post" action="./php/users/update.php" accept-charset="UTF-8">
								<ul class="list-inline rating">
									<li>
									<?php if (!$my_profile) : ?>
										<button class="btn btn-green" type="submit">send green</button>
									<? else : ?>
										<div>How do I rank?</div>
									<? endif; ?>
									</li>
									<li><i class="fa fa-leaf fa-2x"></i></li>
									<li><i class="fa fa-leaf fa-2x"></i></li>
									<li><i class="fa fa-leaf fa-2x"></i></li>
									<li><i class="fa fa-leaf fa-2x black"></i></li>
									<li><i class="fa fa-leaf fa-2x black"></i></li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="space20"></div>
			
		<?php if ($my_profile) : ?>
			<div class="row personal_details" >
				<p><strong>Personnal Details</strong></p> <br>
				<div class="row">
					<form method="post" action="./php/users/update.php" accept-charset="UTF-8">
						<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label for="forename">Forename</label>
								<input type="text" name="forename" class="form-control" placeholder="Forename" value="<? echo $userDetails['forename'] ?>">
							</div>
							<div class="form-group">
								<label for="surname">Surname</label>
								<input type="text" name="surname" class="form-control" placeholder="Surname" value="<? echo $userDetails['surname'] ?>">
							</div>
							<div class="form-group">
								<label for="email">Email address</label>
								<input type="email" name="email" class="form-control" placeholder="Enter email" value="<? echo $userDetails['email'] ?>">
							</div>
							<div class="form-group">
								<label for="avatar">Avatar</label>
								<input type="file" id="avatar">
							</div>
						</div>
						<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label for="new_password">Current Password</label>
								<input type="password" name="new_password" class="form-control" placeholder="Current Password">
							</div>
							<div class="form-group">
								<label for="new_password">New Password</label>
								<input type="password" name="new_password" class="form-control" placeholder="New Password">
							</div>
							<div class="form-group">
								<label for="new_password2">Confirm New Password</label>
								<input type="password" name="new_password2" class="form-control" placeholder="New Password">
							</div>
							<button type="submit" class="btn btn-default pull-right">Update details</button>
						</div>
					</form>
				</div>
			</div>

			<div class="space20"></div>
		<? endif; ?>

			<div class="row user_skills_list" >
				<p><strong>Skills</strong></p> <br>
				<div class="row">
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/blue.png" src="images/blue.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;" > 
							<span class="thumbnail-label"><h3>Photoshop</h3></span>
					</a>
				  </div>
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/green.png" src="images/green.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
						<span class="thumbnail-label"><h3>Photography</h3></span>
					</a>
				  </div>
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/blue.png" src="images/blue.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
						<span class="thumbnail-label"><h3>InDesign</h3></span>
					</a>
				  </div>
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/purple.png" src="images/purple.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
						<span class="thumbnail-label"><h3>CSS</h3></span>
					</a>
				  </div>
				</div>
				<div class="row">
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/orange.png" src="images/orange.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
						<span class="thumbnail-label"><h3>Model making</h3></span>
					</a>
				  </div>
				  <div class="col-xs-6 col-md-3">
					<a href="#" class="thumbnail">
						<img alt="images/deepblue.png" src="images/deepblue.png" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
						<span class="thumbnail-label"><h3>Sewing</h3></span>
					</a>
				  </div>
				</div>
			</div>





			
		  
		</div>  
	</div>
</div>

<?php include "includes/footer.html" ?>
	
