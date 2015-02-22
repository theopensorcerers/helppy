<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$skillID = $_GET['skillID'] ? $_GET['skillID'] : $_POST['skillID'];

// User skills
$skill = [];
$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`,
    categories.categoryID AS `categoryID`,
    skills.name AS `skill_name`,
    skills.description AS `skill_description`,
    COUNT(userID) AS `count_users`
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
GROUP BY skills.skillID;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['skill_name']));
		$skill = $row;
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

$users = [];

?>
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h3><?php echo $skill['skill_name'];?>
				<small>(<?php echo $skill['count_users'];?> helper<?php if ($skill['count_users'] > 1) echo s;?>)</small>
			</h3>
			<p><?php echo $skill['skill_description'];?></p>
		</div>
		
		
		<div class="container">

			<div class="row">
				<?php foreach ($users as $key => $user) { ?>
					
				<? } ?>
			</div>

		</div>

<?php include "includes/footer.html" ?>
