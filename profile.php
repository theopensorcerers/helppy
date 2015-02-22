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

// User details
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


// User skills
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


// Categories
$categories = [];
$query = <<<EOF
SELECT 
    count(skills.skillID) AS `skillIs_count`,
    categories.categoryID AS `categoryID`,
    categories.name AS `category_name`,
    categories.color AS `category_color`,
    categories.description AS `category_description`
FROM
    skills
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
GROUP BY categories.categoryID;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['category_name']));
		array_push($categories, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// Add a skills aray to the categories array
foreach ($categories as $key => $category) {
	$categories[$key]['skills'] = [];
	$categoryID = $category['categoryID'];
	$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`, 
    skills.name AS `skill_name`
FROM
    skills
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
        LEFT JOIN
    user_skills ON (user_skills.skillID = skills.skillID)
WHERE
    categories.categoryID = $categoryID
GROUP BY skills.skillID;
EOF;
	if ($result = $db->query($query)) {
		while ($row = $result->fetch_assoc()) {
			array_push($categories[$key]['skills'], $row);
		}
		/* free result set */
		$result->close();
	} else {
		echo 'Unable to connect to the database';
	}
}

// Skills levels
$levels = [];
$query = <<<EOF
SELECT 
    level.levelID AS `levelID`,
    level.name AS `level_name`,
    level.description AS `level_description`
FROM
    level
GROUP BY level.levelID;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($levels, $row);
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
				<p class="text-left" ><strong>Personal Details</strong></p>
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
			<p class="text-left" ><strong>Skills</strong></p>
			<div class="row skills_categories_list user_skills_list" >
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

		<?php if ($my_profile) : ?>
			<div class="space20"></div>
			<p class="text-left" ><strong>Add Skills</strong></p>
			<div class="row skills_categories_list user_skills_list" >				
				<form id="addskills_form" method="post" action="./php/users/addskill.php" accept-charset="UTF-8">
					<div class="form-group col-xs-4 col-md-4">
						<select name="skillID" data-placeholder="Select a skill">
							<!-- Loop through the categories -->
						<?php foreach ($categories as $key => $category) { ?>
							<optgroup label="<?php echo $category['category_name']; ?>">
							<!-- For each category, add the associated skills -->
							<?php foreach ($category['skills'] as $key => $skill) { ?>
								<option value="<?php echo $skill['skillID']; ?>"><?php echo $skill['skill_name']; ?></option>
							<? } ?>
							</optgroup>
						<? } ?>
						</select>
					</div>
					
					<div class="form-group col-xs-2 col-md-2">
						<select name="levelID" data-placeholder="Select a skill level">
						<?php foreach ($levels as $key => $level) { ?>
							<option value="<?php echo $level['levelID']; ?>"><?php echo $level['level_name']; ?></option>
						<? } ?>
						</select> 
					</div>
					<div class="form-group col-xs-1 col-md-1">
						<button type="submit" class="btn btn-default">Add Skill</button>
					</div>
				</form>
			</div>
		<? endif; ?>
		</div>  
	</div>
</div>


<?php include "includes/footer.html"  ?>