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
    categories.name AS `category_name`
FROM
    categories
WHERE 
EOF;
// loop through the search terms and add a new clause for each term
foreach ($search_terms as &$term) {
	array_push($where_clauses, " (categories.name LIKE '%".$term."%' OR categories.description LIKE '%".$term."%') ");
};
// for categories we use OR between clauses because we want a wide search
$query .= implode(' OR ', $where_clauses);
$query .= " GROUP BY categories.categoryID;";

if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['url'] = $baseurl."/category.php?categoryID=".$row['categoryID'];
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
    skills.name AS `skill_name`
FROM
    skills
WHERE 
EOF;
// loop through the search terms and add a new clause for each term
foreach ($search_terms as &$term) {
	array_push($where_clauses, "((skills.name LIKE '%".$term."%' OR skills.description LIKE '%".$term."%') AND disabled IS NULL)");
};
// for skills we use OR between clauses because we want a wide search
$query .= implode(' OR ', $where_clauses);
$query .= " GROUP BY skills.skillID;";

if ($result = $db->query($query)) {
	while ($row = $result->fetch_assoc()) {
		$row['url'] = $baseurl."/skill.php?skillID=".$row['skillID'];
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
    users.username AS `username`
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
		$row['url'] = $baseurl."/profile.php?username=".$row['username'];
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

echo json_encode(array("success" => true, 
						"msg" => count($results['categories'])." categories(s), ".count($results['skills'])." skills(s) and ".count($results['users'])." users(s) found", 
						"results" => $results,
						"search_input" => $search_input ,
						"search_terms" => $search_terms));
return true;

?>