<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$categoryID = isset($_GET['categoryID']) ? $_GET['categoryID'] : $_POST['categoryID'];

$category = array();
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
$skills = array();
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
		<div id="category" class="jumbotron">

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
				<div class="row category">
					<div class="container <?php echo $category['category_color'];?>-border">
						<div class="col-xs-12 col-md-12">
							<h2><?php echo $category['category_name'];?>
								<small>(<?php echo $category['skillIs_count'];?> skill<?php if ($category['skillIs_count'] > 1) echo "s";?>)</small><br>
								<br>
								<p><?php echo $category['category_description'];?></p>
							</h2>

							<div class="space70">
							</div>

							<div class="row">
								<?php foreach ($skills as $key => $skill) { ?>
									<h3><a href="<?php echo $baseurl; ?>/skill.php?skillID=<?php echo $skill['skillID']; ?>" ><?php echo $skill['skill_name'];?></a>
										<small><?php echo $skill['count_users'];?> helper<?php if ($skill['count_users'] > 1) echo "s";?></small>
									</h3>
									<p><?php echo $skill['skill_description'];?></p>
								<? } ?>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div> 
		

<?php include "includes/footer.html" ?>
