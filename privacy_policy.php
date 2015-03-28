<?php $page = 'home'; ?>
<?php include "includes/header.html" ?>


?>
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div id="info" class="jumbotron">


			<div class="container">
				<div class="text-center">
					<a class="logo"> 
						<img src="images/helppy_index.png" >
					</a> 
				</div>
					
				<div class="space70"></div>

				<div id="info" class="row">
				  <div class="col-xs-12 col-md-3">
				  	<a href="?php echo $baseurl; ?>/about_us.php" class="title">
				  		<h2>About Us</h2>
				  	</a>
				  	<a href="?php echo $baseurl; ?>/our_values.php" class="title">
				  		<h2>Our Values</h2>
				  	</a>
				  	<a href="?php echo $baseurl; ?>/how_it_works.php" class="title">
				  		<h2>How it works</h2>
				  	</a>
				  	<a href="?php echo $baseurl; ?>/safety.php" class="title">
				  		<h2>Safety</h2>
				  	</a>
				  	<div class="selection">
				  		<h1>Privacy Policy</h1>
				  	</div>
				  	<a href="?php echo $baseurl; ?>/help.php" class="title">
				  		<h2>Help</h2>
				  	</a>
				  </div>
				  <div class="col-xs-12 col-md-1">
				  </div>
				  <div class="col-xs-12 col-md-8 info">
				  	<h2>We have access to this information about you:</h2>
					<strong>Information provided by you:</strong>
					<p>We collect data coming from your own input such as your sign-up and profile details. 
						This includes: </p>
					<ul>
						<li><h3>Basic user information: </h3> 
							<p>Your username, e-mail adress, profile 
							descriptions (might include personal links), availability times, and locations of 
							your choice. We also collect skills and skill related details. </p></li>

						<li><h3>Messages and interactive information with other members: </h3> 
							<p>Messages, skill request details and closed transaction details such as who you
							 have collaborated with and for how long. </p></li>

						<li><h3>Information about you from other Helppy users: </h3> 
							<p>Such as ratings and feedback. </p></li>
						<li><h3>Information from other sources:</h3></li>
							<p>If you choose to set a profile picture using <a href=”http://gravatar.com/”>Gravatar</a>, 
								we will have Access to it. However we do not store this information in our database. </p>
						</li>
					</ul>

					<h2>This is how we use your information</h2>
					<p>We use information about you to: </p>
					<ul>
						<li><h3>Protect the safety of Helppy users by providing a verification service</h3></li>
						<li><h3>Operate and improve this website</h3></li>
						<li><h3>Respond to your comments, questions and requests. </h3></li>
					</ul>
					<h2>Sharing your Information</h2>
					<p>Helppy does not share your information with other parties except: </p>
						<ul>
							<li><h3>With your consent</h3></li>
							<li><h3>With search engines to index content provided in your public profile. </h3></li>
							<li><h3>To protect the integrity of our services and values or to protect other users from harm 
								or ilegal activities. </h3></li>
						</ul>
					<strong>Third party services</strong>
					<p>Helppy allows you to use Google Maps. This means you are subject to 
						<a href=”http://www.google.com/policies/privacy/”>Google’s privacy policy</a>, as amended 
						by Google from time to time. You also have the choice to use Gravatar and are subject to 
						<a href=”http://automattic.com/privacy/”>Gravatar’s privacy policy.</a> if you do. </p>
					<h2>Your Information Choices</h2>
					<strong>Account Information:</strong>
					<p>You can update change and delete personal information of your profile at any time. </p>
					<strong>Cookies:</strong>
					<p>Cookies can be accepted by default by your browser. You can manage this by editing your browser’s 
						settings. </p>
				  </div>
				</div>
			</div>
		</div>
		
			 	

<?php include "includes/footer.html" ?>
