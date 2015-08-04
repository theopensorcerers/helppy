<?php
require 'db.php';
header('Content-type: application/json');

$search_input = $db->real_escape_string(isset($_GET['search_input']) ? $_GET['search_input'] : $_POST['search_input']);

// extract every search terms from the search input
$search_terms = explode(" ", $search_input);

/************
 * Categories
 ************/
$categories_research = array();
$where_clauses = array();
$query = <<<EOF
SELECT
    categories.categoryID AS `categoryID`,
    categories.machine_name AS `machine_name`,
    categories.name AS `label`
FROM
    categories
WHERE
EOF;
// loop through the search terms and add a new clause for each term
foreach ($search_terms as &$term) {
	array_push($where_clauses, " (categories.name LIKE '%".$term."%' OR categories.description = '".$term."') ");
};
// for categories we use OR between clauses because we want a wide search
$query .= implode(' AND ', $where_clauses);
$query .= " GROUP BY categories.categoryID;";

if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['href'] = $baseurl."/category/".$row['machine_name'];
		array_push($categories_research, $row);
	}
	/* free result set */
	$result->close();
}

/********
 * Skills
 ********/
$skills_research = array();
$where_clauses = array();
$query = <<<EOF
SELECT
    skills.skillID AS `skillID`,
    skills.machine_name AS `machine_name`,
    skills.name AS `label`
FROM
    skills
WHERE
EOF;
// loop through the search terms and add a new clause for each term
foreach ($search_terms as &$term) {
	array_push($where_clauses, "((skills.name LIKE '%".$term."%' OR skills.description LIKE '%".$term."%') AND disabled IS NULL)");
};
// for skills we use OR between clauses because we want a wide search
$query .= implode(' AND ', $where_clauses);
$query .= " GROUP BY skills.skillID;";

if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['href'] = $baseurl."/skill/".$row['machine_name'];
		array_push($skills_research, $row);
	}
	/* free result set */
	$result->close();
}

/********
 * Users
 ********/
$users_research = array();
$where_clauses = array();
$query = <<<EOF
SELECT
    users.userID AS `userID`,
    users.username AS `username`,
    users.username AS `label`
FROM
    users
WHERE
EOF;
// loop through the search terms and add a new clause for each term
foreach ($search_terms as &$term) {
	array_push($where_clauses, "(users.forename LIKE '%".$term."%' OR users.surname LIKE '%".$term."%' OR users.username LIKE '%".$term."%') ");
};
// when we're searching for users, we use AND between clauses rather than OR because a full name should search for a single person
$query .= implode(' AND ', $where_clauses);
$query .= " GROUP BY users.userID;";

if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['href'] = $baseurl."/profile/".$row['username'];
		array_push($users_research, $row);
	}
	/* free result set */
	$result->close();
}

/********************
 * Output the results
 ********************/
$results = array();

$results["users"] 		=  $users_research;
$results["categories"] 	=  $categories_research;
$results["skills"] 		=  $skills_research;
$count_users = count($results['users']);
$count_categories = count($results['categories']);
$count_skills = count($results['skills']);

echo json_encode(array("success" => true,
						"msg" => "<i class='fa fa-cube fa-2'></i> $count_categories categor".(($count_categories > 1) ? 'ies':'y').
						", <i class='fa fa-diamond fa-2'></i> $count_skills skill".(($count_skills > 1) ? 's':'').
						" and <i class='fa fa-user fa-2'></i> $count_users user".(($count_users > 1) ? 's':'')." found",
						"count_results" => $count_users+$count_categories+$count_skills,
						"results" => $results,
						"search_terms" => $search_terms));
return true;

?>
