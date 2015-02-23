<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$categoryID = $_GET['categoryID'] ? $_GET['categoryID'] : $_POST['categoryID'];

$category = [];
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
WHERE
    categories.categoryID = $categoryID
GROUP BY categories.categoryID;
EOF;
if ($result = $db->query($query)) {
	if ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['category_name']));
		$category = $row;
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}


// User skills
$skills = [];
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
    categories.categoryID = $categoryID
GROUP BY skills.skillID;
EOF;
if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['machine_name'] = strtolower(preg_replace('/[^A-Za-z0-9-]+/', '-', $row['skill_name']));
		array_push($skills, $row);
	}
	/* free result set */
	$result->close();
} else {
	echo 'Unable to connect to the database';
}

?>
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h3><?php echo $category['category_name'];?>
				<small>(<?php echo $category['skillIs_count'];?> skill<?php if ($category['skillIs_count'] > 1) echo s;?>)</small>
			</h3>
		</div>
		
		
		<div class="container">

			<div class="row">
				<?php foreach ($skills as $key => $skill) { ?>
					<h3><a href="/skill/<?php echo $skill['skillID']; ?>" ><?php echo $skill['skill_name'];?></a>
						<small><?php echo $skill['count_users'];?> helper<?php if ($skill['count_users'] > 1) echo s;?></small>
					</h3>
					<p><?php echo $skill['skill_description'];?></p>
				<? } ?>
			</div>

		</div>

<?php include "includes/footer.html" ?>
