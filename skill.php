<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';
$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username']);
$skillID = isset($_GET['skillID']) ? $_GET['skillID'] : $_POST['skillID'];
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : isset($_SESSION['userID']) ? $_SESSION['userID'] : NULL;

// User skills
$skill = array();
$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`,
    categories.categoryID AS `categoryID`,
    skills.name AS `skill_name`,
    skills.description AS `skill_description`,
    COUNT(DISTINCT userID) AS `count_users`
FROM
    skills
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
        LEFT JOIN
    user_skills USING (skillID)
WHERE
    skills.skillID = $skillID
GROUP BY user_skills.skillID;
EOF;
if ($result = $db->query($query)) {
	if ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['skill_name']));
		$skill = $row;
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

// User
$users = array();
$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`,
    users.userID AS `userID`,
    users.username AS `username`,
    users.email AS `email`,
    users.description AS `user_description`,
    level.levelID AS `levelID`,
    level.name AS `level_name`,
    level.color AS `level_color`
FROM
    users
        INNER JOIN
    user_skills USING (userID)
        INNER JOIN
    skills USING (skillID)
        INNER JOIN
    level USING (levelID)
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
WHERE
    user_skills.skillID = $skillID
GROUP BY user_skills.userID
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {

		array_push($users, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}


?>
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">

			<div class="container">

				 <div class="container">
					 <div class="search-container">
						<div class="space70">
							<div class="search-box">
								<div class="input-group search-container">
									<input type="text" class="form-control" id="index_search" placeholder=" I need help in...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-search fa-2x"></i></button>
									</span>
								</div>
							</div>
							<div class="space90"></div>
						</div> 
					</div>
				</div> 
				

						
				<h2><?php echo $skill['count_users'];?> helper<?php if ($skill['count_users'] > 1) echo "s";?><small> can help you with </small><?php echo $skill['skill_name'];?></strong>
					<br>
					<p><?php echo substr($skill['skill_description'], 200, 0);?></p>
				</h2>

				<div class="space70"></div>

				<?php foreach ($users as $key => $user) { ?>
					<div class="row user">
						<div class="col-xs-5 col-md-2">
							<div class="space50"></div>
							<a href="<?php echo $baseurl; ?>/helper/<?php echo $user['username']; ?>" >
								<img class="thumbnail pull-left" src="http://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($user['email'])))?>?s=200&d=https://marielabarzallo.files.wordpress.com/2015/03/default_thumbnail.jpg">
								<div class="user-level-<?php echo $user['level_color'];?>">
									<h3>
										<?php echo $user['username'];?></br>
										<small><?php echo $user['level_name'];?></small>
									</h3>
								</div>
							</a>
						</div>
						<div class="col-xs-12 col-md-1"></div>
						<div class="col-xs-12 col-md-9 user-description">
							
							<p>
								<?php echo substr($user['user_description'],0 ,650);?> ...
							</p>
							<?php if ($user['userID'] != $userID && $userID != NULL) : ?>
							<a href="#menu-toggle" data-toggle="modal" class="btn btn-default" data-target="#request_skill_modal<?php if (isset($user['userID'])) { echo '_'.$user['userID'];}; ?>" ><h4>Request help</h4></a>
							<!-- include the modal & form -->
							<?php include "includes/request_skill_modal.php" ?>
						<? endif; ?>
							<p class="text-right">
								<a href="<?php echo $baseurl; ?>/profile.php?username=<?php echo $user['username']; ?>">see <?php echo $user['username'];?> profile</a>
						</p>

						</div>
					</div>
					<hr>
				<? } ?>
			</div>
		</div>


<?php include "includes/footer.html" ?>
