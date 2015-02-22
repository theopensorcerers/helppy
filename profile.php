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

$userSkills = [];
$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`,
    skill_categories.categoryID AS `categoryID`,
    user_skills.levelID AS `levelID`,
    skills.name AS `skill_name`,
    categories.name AS `category_name`,
    categories.description AS `category_description`,
    categories.color AS `category_color`,
    level.name AS `level_name`
FROM
    users
        INNER JOIN
    user_skills USING (userID)
        INNER JOIN
    skills USING (skillID)
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
		INNER JOIN
    level USING (levelID)
WHERE
    username  = '$username'
GROUP BY user_skills.skillID
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['skill_name']));
		array_push($userSkills, $row);
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
							<img src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($userDetails['email'])))?>?s=360&d=mm">
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
				<p><strong>Personal Details</strong></p> <br>
				<div class="row">
					<form method="post" action="./php/users/update.php" accept-charset="UTF-8">
						<div class="col-xs-12 col-md-8">
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
						</div>
						<div class="col-xs-12 col-md-4">
							<div class="form-group">
								<label for="current_password">Current Password</label>
								<input type="password" name="current_password" class="form-control" placeholder="Current Password">
							</div>
							<div class="form-group">
								<label for="new_password">New Password</label>
								<input type="password" name="new_password" class="form-control" placeholder="New Password">
							</div>
							<div class="form-group">
								<label for="new_password2">Confirm New Password</label>
								<input type="password" name="new_password2" class="form-control" placeholder="New Password">
							</div>
						</div>
						<div class="col-xs-12 col-md-12">
							<label for="description">Bio</label>
							<textarea name="description" class="form-control" rows="5" placeholder="A few words about you"><? echo $userDetails['description'] ?></textarea>
							<div class="space10"></div>
							<button type="submit" class="btn btn-default pull-right">Update details</button>
						</div>
					</form>
				</div>
			</div>

			<div class="space20"></div>
		<? endif; ?>

			<div class="row skills_categories_list user_skills_list" >
				<p><strong>Skills</strong></p> <br>
				<div class="row">
				<?php foreach ($userSkills as $key => $skill) { ?>
					<div class="col-xs-6 col-md-3 skill <?php echo $skill['category_color'];?>">
						<a href="./skill/<?php echo $skill['machine_name']; ?>" >
							<h3><?php echo $skill['skill_name'];?>
							<small><br><?php echo $skill['level_name'];?></small></h3>
						</a>
				  	</div>
				<? } ?>
		    </div>
                  </div>
                   Add new skill <br> <br>
                  <div>
                  <form id="login_form" method="post" action="./php/users/addskill.php" accept-charset="UTF-8">
								<select name="skillId" id="skillId" method="post">
                                <option value=""> Select skill </option>
                          		<option value="Photoshop">Photoshop</option>
								<option value="Photography">Photography</option>
								<option value="Indesign">Indesign</option>
								<option value="Sewing">Sewing</option>
                                <option value="Modelmaking">Modelmaking</option>
                                <option value="CSS">CSS</option>
                                </select>
<br> <br>

						Skill level <br> <br>
							<div class="form-group">
							  <select name="levelId" id="levelId" method="post">
                          		<option value=""> Select skill level </option>
								<option value="1">Beginner</option>
								<option value="3">Intermediate</option>
								<option value="3">Advanced</option>
                                </select> </div>
                                 
                                 
                    <input type="submit" id="submit" value="Add skill" > </form>
								
                                
								
				
			</div>





			
		  
		</div>  
	</div>
</div>


<?php include "includes/footer.html"  ?>