<?php $page = 'profile'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username']);
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$my_profile = False;
if (isset($_COOKIE['username']) || isset($_SESSION['username'])) {
	$my_profile = ($username == $_COOKIE['username'] || $username == $_SESSION['username']);
}
$userDetails = array();

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

?>

<!-- Profile picure and progress bars -->
<div class="jumbotron">
	<div class="container">

		<div class="space70"></div>
			<div class="row">
				<div class="col-xs-6 col-md-4">
						<div class="thumbnail">
							<img src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($userDetails['email'])))?>?s=360&d=mm">
								<div class="caption username">
									<h3><strong><?php echo $userDetails['username'] ?></strong></h3>
										<?php if ($my_profile) : ?>
										Use <a href="http://en.gravatar.com to add a profile picture">Gravatar</a> to add a profile picture
										<? endif; ?>
								</div>
						</div>
						<?php if (!$my_profile) : ?>
                        
                        
							<a href="#menu-toggle" data-toggle="modal" class="btn btn-default" data-target="#myModal" id="request_skill_btn" ><h4>Request a skill</h4></a>
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content request-lightbox">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							        <h4 class="modal-title" id="myModalLabel">Request a skill</h4>
							      		</div>
							      			<div class="modal-body">
												<div class="form-group">
													<p>Select a skill from <?php echo $username ?></p>
								                		<form method="post" action="<?php echo $baseurl; ?>/php/users/create_req.php" accept-charset="UTF-8">
								               				<select name="reqskill" data-placeholder="Select a skill ">
															<?php foreach ($userSkills as $key => $skill) { ?>
																<option value="<?php echo $skill['skill_name']; ?>"><?php echo $skill['skill_name']; ?></option>
																<? } ?>
															</select>
												<div class="space10"></div>
													<p>Add more details. What do you need?</p>	
								                		<div class="col-lg-12 write_message"> 
								                			<textarea autofocus name="body" class="form-control" rows="10"></textarea>
									               		</div> 
									            <div class="space10"></div>
									            	<p>When do you need it for?</p>	
									            	<div class="row request-skill-form">
				                  						<div class="col-xs-8 col-sm-4">
											               <select name="due-day" data-placeholder="Select a day ">
																<option value="ALLOC" <input type="hidden">Day</option>
						  										<option value="LOAD1">01</option>
															</select>
														</div>
														<div class="col-xs-4 col-sm-4">
															<select name="due-month" data-placeholder="Select a month ">
																<option value="ALLOC"<input type="hidden">Month</option>
						  										<option value="LOAD1">01</option>
						  										<option value="LOAD2">02</option>
															</select>
														</div>
														<div class="col-xs-4 col-sm-4">
															<select name="due-month" data-placeholder="Select a month ">
																<option value="ALLOC"<input type="hidden">Year</option>
						  										<option value="LOAD1">01</option>
						  										<option value="LOAD2">02</option>
															</select>
														</div>
												</div>
									           			</form>
												</div>
								</div>
								      <div class="modal-footer">
								      	<div class="space10"></div>
								        <a href="#menu-toggle" class="btn btn-default" id="request_skill_btn" ><h4>Send request</h4></a>

								      </div>
								    </div>
								  </div>
								</div>

<? endif; ?>
                              
				                 

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
				<?php if (!$my_profile) : ?>
					<div class="space20">
						<div class="align-right">
							<form method="post" action="<?php echo $baseurl; ?>/php/users/update.php" accept-charset="UTF-8">
								<ul class="list-inline rating">
									<li>
										<button class="btn btn-green" type="submit">send green</button>
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
				<? endif; ?>
				</div>
			</div>

			<div class="space50"></div>
			
			<?php if ($my_profile) : ?>
				<div class="row personal_details" >
					<p class="text-left" ><strong>Personal Details</strong></p>
					<div class="row">
						<form method="post" action="<?php echo $baseurl; ?>/php/users/update.php" accept-charset="UTF-8">
							<div class="col-xs-12 col-md-8">
								<div class="form-group">
									<label for="forename">Forename</label>
									<input type="text" name="forename" class="form-control details" placeholder="Forename" value="<? echo $userDetails['forename'] ?>">
								</div>
								<div class="form-group">
									<label for="surname">Surname</label>
									<input type="text" name="surname" class="form-control details" placeholder="Surname" value="<? echo $userDetails['surname'] ?>">
								</div>
								<div class="form-group">
									<label for="email">Email address</label>
									<input type="email" name="email" class="form-control details" placeholder="Enter email" value="<? echo $userDetails['email'] ?>">
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
								<textarea name="description" class="form-control details" rows="5" placeholder="A few words about you"><? echo $userDetails['description'] ?></textarea>
								<div class="space10"></div>
								<button type="submit" id='add' class="btn btn-default pull-right">Update details</button>
							</div>
						</form>
					</div>
				</div>

				<div class="space20"></div>
			<? else : ?>

				<div class="row personal_details" >
					<p class="text-left" ><strong>Personal Details</strong></p>
					<div class="row">
							<div class="col-xs-12 col-md-3">
								<p class="lead">
									<? echo $userDetails['forename']; ?>
									<? echo substr($userDetails['surname'], 0, 1); ?>.
								</p>
							</div>
							<div class="col-xs-12 col-md-9">
								<p class="lead"><? echo $userDetails['description']; ?></p>
							</div>
					</div>
				</div>

				<div class="space20"></div>

			<? endif; ?>
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
						<? endif; ?>
							<a href="<?php echo $baseurl; ?>/skill.php?skillID=<?php echo $skill['skillID']; ?>" >
								<h3><?php echo $skill['skill_name'];?>
								<small><br><?php echo $skill['level_name'];?></small></h3>
							</a>
						</div>
					<? } ?>
					</div>
				</div>

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
										<? } ?>
										</optgroup>
									<? } ?>
									</select>
								</div>
								
								<div class="form-group">
									<select name="levelID" data-placeholder="Select a skill level">
									<?php foreach ($levels as $key => $level) { ?>
										<option value="<?php echo $level['levelID']; ?>"><?php echo $level['level_name']; ?></option>
									<? } ?>
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
									<? } ?>
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
									<? } ?>
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
			<? endif; ?>

			<div class="space20"></div>
			
			<div class="row personal_details" >
				<div class="col-xs-12 col-md-6">

					<p class="text-left" ><strong><?php if ($my_profile) echo "My " ?>Location</strong></p>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApOJOQG01-hx1Ik41Zw41Lb2oizvdK7RE"></script>
					<script src="/js/geocode_users.js"></script>
					<script type="text/javascript">
						<?php foreach ($userLocations as $key => $location) { ?>
							// Add the GeoJSON objects to the locations array
							locations.push(<?php echo $location['spatial']; ?>);
						<? } ?>
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

						<table class="table table-condensed table-striped table-hover">
							<thead>
								<tr>
									<th>Location</th>
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
							<? } ?>
							</tbody>
						</table>

					<? endif; ?>
				</div>	
			</div>
			
				
	</div>

	<div class="space20"></div>

		 
</div>


<?php include "includes/footer.html"  ?>