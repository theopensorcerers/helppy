<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

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


$skills = array();
$query = <<<EOF
SELECT 
    skills.skillID AS `skillID`,
    skill_categories.categoryID AS `categoryID`,
    skills.name AS `skill_name`,
    categories.color AS `category_color`,
    categories.name AS `category_name`
FROM
    skills
        INNER JOIN
    skill_categories USING (skillID)
        INNER JOIN
    categories USING (categoryID)
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
			<div class="text-center">
				<a class="logo"> 
					<img src="images/logo.png" >
				</a> 
				<p>
					<br>
					A free platform to collaborate, offer and receive skills
					<p> <strong> FIND </strong> the skills you are missing <br>
						<strong> GET </strong> the help needed <br>
						<strong> FOSTER </strong> collaboration <br>
						<strong> CREATE </strong> great projects 
					</p>
				</p>
			 	<div class="container">
					 <div class="search-container">
						<div class="space70">
							<div class="search-box">
								<div class="input-group search-container">
									<input type="text" class="form-control" placeholder="I need help in...">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-search fa-2x"></i></button>
									</span>
								</div>
							</div>
							<div class="space20"></div>
						</div> 
					</div>
				</div> 
			 </div>
		</div>
		
		<div class="container skills_categories_list">

			<!-- Example row of columns -->
			<div class="row">
				<?php foreach ($categories as $key => $category) { ?>
				<div class="col-xs-6 col-md-3 skill <?php echo $category['category_color'];?>">
					<a href="./category/<?php echo $category['categoryID']; ?>" >
						<h3><?php echo $category['category_name'];?>
						<small><br>(<?php echo $category['skillIs_count'];?> skill<?php if ($category['skillIs_count'] > 1) echo "s";?>)</small></h3>
					</a>
					</div>
				<? } ?>
			</div>

			<hr>

		</div>

<?php include "includes/footer.html" ?>
