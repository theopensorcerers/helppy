<?php $page = 'profile'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : (isset($_SESSION['username']) ? $_SESSION['username'] : NULL));
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : (isset($_SESSION['userID']) ? $_SESSION['userID'] : NULL);

$my_profile = False;
if (isset($_COOKIE['username'])) {
	$my_profile = ($username == $_COOKIE['username']);
}
elseif (isset($_SESSION['username'])) {
	$my_profile = ($username == $_SESSION['username']);
}

// User details
$userDetails = array();

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
$userSkills = array();
$query = <<<EOF
SELECT
	skills.skillID AS `skillID`,
	skill_categories.categoryID AS `categoryID`,
	user_skills.levelID AS `levelID`,
	skills.name AS `skill_name`,
	categories.name AS `category_name`,
	categories.description AS `category_description`,
	categories.color AS `category_color`,
	level.name AS `level_name`,
	level.color AS `level_color`
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
$categories = array();
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
	$categories[$key]['skills'] = array();
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
$levels = array();
$query = <<<EOF
SELECT
	level.levelID AS `levelID`,
	level.name AS `level_name`,
	level.description AS `level_description`,
	level.color AS `level_color`
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

// User locations
$userLocations = array();
$query = <<<EOF
SELECT
	locations.locationID AS `locationID`,
	user_locations.name AS `location_name`,
	locations.`spatial` AS `spatial`,
    locations.point AS `point`
FROM
	users
		INNER JOIN
	user_locations USING (userID)
		INNER JOIN
	locations USING (locationID)
WHERE
	username  = '$username'
GROUP BY user_locations.locationID
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($userLocations, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// Days
$days = array();
$query = <<<EOF
SELECT
	availability_day.dayID AS `dayID`,
	availability_day.name AS `day_name`
FROM
	availability_day
GROUP BY availability_day.dayID ;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($days, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// Hours
$hours = array();
$query = <<<EOF
SELECT
	availability_hour.hourID AS `hourID`,
	availability_hour.name AS `hour_name`,
	availability_hour.description AS `hour_description`
FROM
	availability_hour
GROUP BY availability_hour.hourID ;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($hours, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// User Availabilities
$userAvailability = array();
$query = <<<EOF
SELECT
	availability_day.dayID AS `dayID`,
	availability_day.name AS `day_name`,
	availability_hour.hourID AS `hourID`,
	availability_hour.name AS `hour_name`,
	availability_hour.description AS `hour_description`
FROM
	users
		INNER JOIN
	user_availability USING (userID)
		INNER JOIN
	availability_day USING (dayID)
		INNER JOIN
	availability_hour USING (hourID)
WHERE
	username  = '$username';
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($userAvailability, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// User feedback
$userFeedback = array();
$query = <<<EOF
SELECT
	feedback.feedbackID AS `feedbackID`,
	feedback.rating AS `rating`,
	feedback.body AS `feedback`,
    requests.requestID AS `requestID`,
	resquester.userID AS `requester_ID`,
    resquester.username AS `requester_username`,
    resquester.email AS `requester_email`,
    resquester.forename AS `requester_forename`,
    resquester.surname AS `requester_surname`,
    skills.skillID AS `skillID`,
    skills.name AS `skill_name`,
    request_skills.skillID AS `skillID`
FROM
	requests
		INNER JOIN
	users AS resquester ON (resquester.userID = requests.`from`)
		INNER JOIN
	users AS helper ON (helper.userID = requests.`to`)
		INNER JOIN
	request_skills ON (request_skills.requestID = requests.requestID)
    	INNER JOIN
    skills USING (skillID)
		INNER JOIN
	feedback ON (feedback.requestID = requests.requestID)
WHERE
	helper.username = '$username'
GROUP BY requests.requestID;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		array_push($userFeedback, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// User stats
$userStats = array();
$query = <<<EOF
SELECT
    ROUND(SUM(IF(helper.username = '$username',
                feedback.rating,
                NULL)) * 20 / COUNT(IF(helper.username = '$username',
                requests.requestID,
                NULL)),
            2) AS `average_rating`,
    ROUND(SUM(feedback.duration), 2) AS `sum_collaboration_duration`,
    ROUND(SUM(IF(helper.username = '$username',
                feedback.duration,
                NULL)),
            2) AS `sum_helper_duration`,
    ROUND(SUM(IF(resquester.username = '$username',
                feedback.duration,
                NULL)),
            2) AS `sum_requester_duration`
FROM
    requests
    	INNER JOIN
	users AS resquester ON (resquester.userID = requests.`from`)
		INNER JOIN
	users AS helper ON (helper.userID = requests.`to`)
        INNER JOIN
    feedback ON (feedback.requestID = requests.requestID)
WHERE
    (helper.username = '$username'
        OR resquester.username = '$username');
EOF;
if ($result = $db->query($query)) {
	if ($row = $result->fetch_assoc()) {
		$userStats = $row;
		$userStats['average_rating'] = $row['average_rating'] > 0 ? $row['average_rating'] : 1;
		$userStats['average_help_given'] = $row['sum_collaboration_duration'] > 0 ? ($row['sum_helper_duration'] * 100 / $row['sum_collaboration_duration']) : 1;
		$userStats['average_help_received'] = $row['sum_collaboration_duration'] > 0 ? ($row['sum_requester_duration'] * 100 / $row['sum_collaboration_duration']) : 1;
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

?>


<div class="jumbotron">
	<div class="container">

		<div class="space70"></div>
			<div class="row">

			<!-- Profile picure request button -->

				<div class="col-xs-6 col-md-4">
					<div class="thumbnail">
						<img src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($userDetails['email'])))?>?s=360&d=https://marielabarzallo.files.wordpress.com/2015/03/helppy_avatar.jpg">
						<div class="caption username">
							<h3><strong><?php echo $userDetails['username'] ?></strong></h3>
							<?php if ($my_profile) : ?>
								Use <a href="http://en.gravatar.com to add a profile picture">Gravatar</a> to add a profile picture
							<?php endif; ?>
						</div>
					</div>
					<?php if ($userDetails['userID'] != $userID && $userID != NULL) : ?>

					<a href="#menu-toggle" data-toggle="modal" class="btn btn-default" data-target="#request_skill_modal" id="request_skill_btn" ><h4>Request a skill</h4></a>
					<!-- include the modal & form -->
					<?php include "includes/request_skill_modal.php" ?>

					<?php endif; ?>

				</div>

				<div class="col-xs-12 col-md-1"></div>

			<!-- progress bars -->

				<div class="col-xs-12 col-md-7">
					<p>I've helped others</p>
					<div class="progress">
						<div class="progress-bar offered" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $userStats['average_help_given'] ?>%;">
						</div>
					</div>
					<p>Others have helped me</p>
					<div class="progress">
						<div class="progress-bar received" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $userStats['average_help_received'] ?>%;">
						</div>
					</div>
					<p>Rating</p>
					<div class="progress">
						<div class="progress-bar green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $userStats['average_rating'] ?>%;">
						</div>
					</div>
				</div>
			</div>

			<div class="space50"></div>

			<!-- Personal details -->

			<?php if ($my_profile) : ?>
				<div class="row personal_details" >
					<p class="text-left" ><strong>Personal Details</strong></p>
					<div class="row">
						<form method="post" action="<?php echo $baseurl; ?>/php/users/update.php" accept-charset="UTF-8">
							<div class="col-xs-12 col-md-8">
								<div class="form-group">
									<label for="forename">Forename</label>
									<input type="text" name="forename" class="form-control details" placeholder="Forename" value="<?php echo $userDetails['forename'] ?>">
								</div>
								<div class="form-group">
									<label for="surname">Surname</label>
									<input type="text" name="surname" class="form-control details" placeholder="Surname" value="<?php echo $userDetails['surname'] ?>">
								</div>
								<div class="form-group">
									<label for="email">Email address</label>
									<input type="email" name="email" class="form-control details" placeholder="Enter email" value="<?php echo $userDetails['email'] ?>">
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<div class="form-group">
									<label for="current_password">Current Password</label>
									<input type="password" name="current_password" class="form-control details" placeholder="Current Password">
								</div>
								<div class="form-group">
									<label for="new_password">New Password</label>
									<input type="password" name="new_password" class="form-control details" placeholder="New Password">
								</div>
								<div class="form-group">
									<label for="new_password2">Confirm New Password</label>
									<input type="password" name="new_password2" class="form-control details" placeholder="New Password">
								</div>
							</div>
							<div class="col-xs-12 col-md-12">
								<label for="description">Bio</label>
								<textarea name="description" class="form-control details" rows="5" placeholder="A few words about you"><?php echo $userDetails['description'] ?></textarea>
								<div class="space10"></div>
								<button type="submit" id='add' class="btn btn-default pull-right">Update details</button>
							</div>
						</form>
					</div>
				</div>

				<div class="space20"></div>
			<?php else : ?>

				<div class="row personal_details" >
					<p class="text-left" ><strong>Personal Details</strong></p>
					<div class="row">
							<div class="col-xs-12 col-md-3">
								<p class="lead">
									<?php echo $userDetails['forename']; ?>
									<?php echo substr($userDetails['surname'], 0, 1); ?>.
								</p>
							</div>
							<div class="col-xs-12 col-md-9">
								<p class="lead"><?php echo $userDetails['description']; ?></p>
							</div>
					</div>
				</div>

				<div class="space20"></div>

			<?php endif; ?>

			<!-- List skills -->

				<p class="text-left" ><strong><?php if ($my_profile) echo "My " ?>Skills</strong></p>
				<div class="row skills_categories_list user_skills_list" >
					<div class="row skill">
					<?php foreach ($userSkills as $key => $skill) { ?>
						<div class="col-xs-6 col-md-3 skill <?php echo $skill['level_color']; ?>">
						<?php if ($my_profile) : ?>
							<form method="post" action="<?php echo $baseurl; ?>/php/users/remove_skill.php" accept-charset="UTF-8">
								<input type="hidden" name="skillID" value="<?php echo $skill['skillID']; ?>">
								<input type="hidden" name="levelID" value="<?php echo $skill['levelID']; ?>">
								<input type="hidden" name="userID" value="<?php echo $userID; ?>">
								<button type="submit" class="close"><span aria-hidden="true">&times;</span></button>
							</form>
						<?php endif; ?>
							<a href="<?php echo $baseurl; ?>/skill/<?php echo $skill['machine_name']; ?>" >
								<h3><?php echo $skill['skill_name'];?>
								<small><br><?php echo $skill['level_name'];?></small></h3>
							</a>
						</div>
					<?php } ?>
					</div>
				</div>

			<!-- Add skills -->

			<?php if ($my_profile) : ?>
				<div class="space50"></div>
				<div class="row skills-details">
					<div class="col-xs-12 col-md-6 add-skills">
						<p class="text-left" ><strong>Add Skills</strong></p>
						<div class="row personal_details" >
							<form id="addskills_form" method="post" action="<?php echo $baseurl; ?>/php/users/addskill.php" accept-charset="UTF-8">
								<div class="form-group">
									<select name="skillID" data-placeholder="Select a skill">
										<!-- Loop through the categories -->
									<?php foreach ($categories as $key => $category) { ?>
										<optgroup label="<?php echo $category['category_name']; ?>">
										<!-- For each category, add the associated skills -->
										<?php foreach ($category['skills'] as $key => $skill) { ?>
											<option value="<?php echo $skill['skillID']; ?>"><?php echo $skill['skill_name']; ?></option>
										<?php } ?>
										</optgroup>
									<?php } ?>
									</select>
								</div>

								<div class="form-group">
									<select name="levelID" data-placeholder="Select a skill level">
									<?php foreach ($levels as $key => $level) { ?>
										<option value="<?php echo $level['levelID']; ?>"><?php echo $level['level_name']; ?></option>
									<?php } ?>
									</select>
								</div>
								<div class="form-group">
									<button type="submit" id='add' class="btn btn-default">Add Skill</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-xs-12 col-md-6">
						<div class="row new-skill" >
							<p>Not finding a skill? You can add one</p>
							<form id="create_skills_form" method="post" action="<?php echo $baseurl; ?>/php/skills/addskill.php" accept-charset="UTF-8">
								<div class="form-group">
									<select class="add-skill-dropdown" name="categoryID" data-placeholder="Select a category">
									<?php foreach ($categories as $key => $category) { ?>
										<option value="<?php echo $category['categoryID']; ?>"><?php echo $category['category_name']; ?></option>
									<?php } ?>
									</select>
								</div>
								<div class="form-group">
									<input type="text" name="skill_name" class="form-control details" placeholder="Skill name">
								</div>
								<div class="form-group">
									<input type="text" name="skill_description" class="form-control details" placeholder="Description">
								</div>
								<div class="form-group">
									<select name="levelID" data-placeholder="Select a skill level">
									<?php foreach ($levels as $key => $level) { ?>
										<option value="<?php echo $level['levelID']; ?>"><?php echo $level['level_name']; ?></option>
									<?php } ?>
									</select>
								</div>
								<div class="form-group">
									<button type="submit" id='add' class="btn btn-default">Add Skill</button>
								</div>
							</form>
							<form id="create_skills_callback_form" method="post" action="<?php echo $baseurl; ?>/php/users/addskill.php" accept-charset="UTF-8">
								<input type="hidden" name="skillID" value="">
								<input type="hidden" name="levelID" value="">
								<input type="hidden" name="userID" value="<?php echo $userID; ?>">
							</form>
						</div>
					</div>
				</div>
			<?php endif; ?>

			<div class="space70"></div>

			<!-- Location and Availability -->

			<div class="row personal_details" >

				<!-- Location -->

				<div class="col-xs-12 col-md-6">

					<p class="text-left" ><strong><?php if ($my_profile) echo "My " ?>Location</strong></p>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApOJOQG01-hx1Ik41Zw41Lb2oizvdK7RE"></script>
					<script src="<?php echo $baseurl; ?>/js/geocode_users.js"></script>
					<script type="text/javascript">
						<?php foreach ($userLocations as $key => $location) { ?>
							// Add the GeoJSON objects to the locations array
							locations.push(<?php echo $location['spatial']; ?>);
						<?php } ?>
					</script>
					<div id="map-canvas"></div>

					<?php if ($my_profile) : ?>

						<div class="space20"></div>

						<form id="user_location_form" method="post" action="<?php echo $baseurl; ?>/php/users/addLocation.php" accept-charset="UTF-8">
							<div class="form-group location">
							<ul class="list-inline">
								<li><input type="text" name="name" class="form-control location-details details" placeholder="Name of the location" ></li>
								<li><input type="text" id="postcode" name="postcode" class="form-control location-details details" placeholder="Postcode" ></li>
								<li><button type="button" id='add' class="btn btn-default details" onclick="codeAddress()">Add Location</button></li>
								<input type="hidden" id="spatial" name="spatial">
								<input type="hidden" id="point" name="point">
							</ul>
							</div>
						</form>


						<table class="table table-condensed table-striped table-hover" id="availability">
							<thead>
								<tr>
									<th>Locations</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<?php foreach ($userLocations as $key => $location) { ?>
								<tr>
									<td><?php echo $location['location_name'];?></td>
									<td>
										<form method="post" action="<?php echo $baseurl; ?>/php/users/remove_location.php" accept-charset="UTF-8">
											<input type="hidden" name="locationID" value="<?php echo $location['locationID']; ?>">
											<input type="hidden" name="userID" value="<?php echo $userID; ?>">
											<button type="submit" class="close"><span aria-hidden="true">&times;</span></button>
										</form>
									</td>
								</tr>
							<?php } ?>
							</tbody>
						</table>

					<?php endif; ?>
				</div>



				<!-- Availability -->

				<div class="col-xs-12 col-md-6">
					<div class="row new-skill">
						<p class="text-left" ><strong><?php if ($my_profile) echo "My " ?>Availability</strong></p>

						<?php if ($my_profile) : ?>
						<form id="addAvailability_form" method="post" action="<?php echo $baseurl; ?>/php/users/addAvailability.php" accept-charset="UTF-8">

							<div class="form-group">
								<select name="dayID" data-placeholder="Select a day">
									<?php foreach ($days as $key => $day) { ?>
										<option value="<?php echo $day['dayID']; ?>"><?php echo $day['day_name']; ?></option>
									<?php } ?>
								</select>
							</div>

							<div class="form-group">
								<select name="hourID" data-placeholder="Select a time">
									<?php foreach ($hours as $key => $hour) { ?>
										<option value="<?php echo $hour['hourID']; ?>"><?php echo $hour['hour_description'] . " (" . $hour['hour_name'] . ")" ; ?></option>
									<?php } ?>
								</select>
							</div>
							<div class="form-group">
								<button type="submit" id='add' class="btn btn-default">Add availability</button>
							</div>

						</form>
						<?php endif; ?>

						<div class="space50"></div>
						<table class="table table-condensed table-striped table-hover tb_available" id="availability">
							<thead>
								<tr>
									<th>Availability times</th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($userAvailability as $key => $availability) { ?>
									<tr>
										<td><?php echo $availability['day_name'];?></td>
										<td><?php echo $availability['hour_name'];?></td>
										<td><?php echo $availability['hour_description'];?></td>
										<?php if ($my_profile) : ?>
											<td>
												<form method="post" action="<?php echo $baseurl; ?>/php/users/remove_availability.php" accept-charset="UTF-8">
													<input type="hidden" name="dayID" value="<?php echo $availability['dayID']; ?>">
													<input type="hidden" name="hourID" value="<?php echo $availability['hourID']; ?>">
													<input type="hidden" name="userID" value="<?php echo $userID; ?>">
													<button type="submit" class="close available_btn"><span aria-hidden="true">&times;</span></button>
												</form>
											</td>
										<?php else : ?>
											<td></td>
										<?php endif; ?>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="space70"></div>

			<!-- Feedback -->

			<div class="row personal_details" >
				<div class="col-xs-12 col-md-12">
					<p class="text-left" ><strong><?php if ($my_profile) echo "My " ?>Feedback</strong></p>
					<?php foreach ($userFeedback as $key => $feedback) { ?>
						<div class="row">

							<div class="col-xs-5 col-md-2">
								<div class="space50"></div>
								<a href="<?php echo $baseurl; ?>/helper/<?php echo $feedback['requester_username']; ?>" >
									<img class="thumbnail pull-left" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($feedback['requester_email'])))?>?s=200&d=https://marielabarzallo.files.wordpress.com/2015/03/default_thumbnail.jpg">
								</a>
							</div>

							<div class="col-xs-12 col-md-1"></div>

							<div class="col-xs-12 col-md-9">
								<h3>
									<a href="<?php echo $baseurl; ?>/profile/<?php echo $feedback['requester_username']; ?>" ><?php echo $feedback['requester_username']; ?></a>
									 <small>asked for my help with <?php echo $feedback['skill_name'];?></small>
								</h3>
								<p>
									<?php echo $feedback['feedback'];?> ...
								</p>
							</div>
						</div>
						<hr>
					<?php } ?>
				</div>
			</div>




	</div>

	<div class="space20"></div>


</div>


<?php include "includes/footer.html"  ?>
