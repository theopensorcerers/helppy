<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>

<<<<<<< HEAD
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
              <div class="space70">
              </div>
            </div> 
          </div>
          </div>       
       </div>
    </div>
    

    <div class="container index_filters">
        <div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    Categories
   
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">Animation</a></li>
                    <li><a href="#">Arhitecture</a></li>
                    <li><a href="#">Graphic Design</a></li>
                    <li><a href="#">Film & TV</a></li>
                    <li><a href="#">Fashion</a></li>
                    <li><a href="#">Crafts</a></li>
					<li><a href="#">Culinary Arts</a></li>
                    <li><a href="#">Photography</a></li>
                    <li><a href="#">Drawing & Illustration</a></li>
                    <li><a href="#">Printing</a></li>
                    <li><a href="#">Engineering</a></li>
                    <li><a href="#">Interior Design</a></li>
                    <li><a href="#">Music & Sound</a></li>
                    <li><a href="#">Product Design</a></li>
                    <li><a href="#">Art</a></li>
                    <li><a href="#">UX/UI</a></li>
                    <li><a href="#">Web Design</a></li>
                    <li><a href="#">Programming</a></li>
                    <li><a href="#">Writing</a></li>
  </ul>
</div>
<div class="btn-group">
  <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
    Skills
  </a>
  <ul class="dropdown-menu">
    <li><a href="#">Arhitecture</a></li>
                    <li><a href="#">Photoshop</a></li>
                    <li><a href="#">Indesign</a></li>
                    <li><a href="#">Illustrator</a></li>
                    <li><a href="#">After Effects</a></li>
					<li><a href="#">Cinema 4d</a></li>
                    
  </ul>
</div>
    </div>
		
                  </ul>
                </li>
                <li><a href="#">Skills</a></li>

		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">Link</a></li>
		        <li><a href="#">Link</a></li>
		        	        
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
    
        <div class="container skills_categories_list">
=======
<?php
/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

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


$skills = [];
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
							<div class="space70">
							</div>
						</div> 
					</div>
					</div>       
			 </div>
		</div>
		
		<!-- new filter navbar -->
		
		<nav class="navbar navbar-default" role="navigation">
			<div class="container">
				<!-- Start of filter navbar -->
						
				<div id="filter-bar">
					<ul class="list-unstyled">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<?php foreach ($categories as $key => $category) { ?>
								<li>
									<a href="./category/<?php echo $category['machine_name']; ?>">
										<?php echo $category['category_name'];?>
									</a>
								</li>
								<? } ?>
							</ul>
						</li>
					</ul>
					<ul class="list-unstyled">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Skills<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<?php foreach ($skills as $key => $skill) { ?>
								<li>
									<a href="./skill/<?php echo $skill['machine_name']; ?>">
										<?php echo $skill['skill_name'];?>
									</a>
								</li>
								<? } ?>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		
				<div class="container skills_categories_list">
>>>>>>> 718289f21c445a418c9ab5cda0169c3f566dbe44

			<!-- Example row of columns -->
			<div class="row">
				<?php foreach ($categories as $key => $category) { ?>
				<div class="col-xs-6 col-md-3 skill <?php echo $category['category_color'];?>">
					<a href="./category/<?php echo $category['machine_name']; ?>" >
						<h3><?php echo $category['category_name'];?>
						<small><br>(<?php echo $category['skillIs_count'];?> skill<?php if ($category['skillIs_count'] > 1) echo s;?>)</small></h3>
					</a>
					</div>
				<? } ?>
			</div>

			<hr>

		</div>

<?php include "includes/footer.html" ?>
