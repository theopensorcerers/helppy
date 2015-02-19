<?php include "includes/header-profile.html" ?>

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
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-brand-centered">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div>

		    <!-- Start of filter navbar -->
            
		    <div class="collapse navbar-collapse" id="filter-bar">
            
		      <ul class="nav navbar-nav">
		        <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Fashion Design</a></li>
                    <li><a href="#">Graphic Design</a></li>
                    <li><a href="#">Animation</a></li>
                    <li><a href="#">Multimedia</a></li>
                    <li><a href="#">Fine Arts</a></li>
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

      <!-- Example row of columns -->
      <div class="row">
        	<a href="#">
                <div class="col-md-3 green">
                    <h2>Sewing</h2>   
              <p></p>
            </div>
        </a>
        	<a href="#">
                <div class="col-md-3 purple">
                  <h2>Heading</h2>
                  <p></p>
                </div>
             </a>
        <span class="results-btn">
        	<a href="#">
                <div class="col-md-3 orange">
                  <h2>Heading</h2>
                  <p></p>
               </div>
             </a></span> 
        <span class="results-btn">
        	<a href="#"> 
                <div class="col-md-3 blue">
                  <h2>Heading</h2>
                  <p></p>
                </div>
             </a></span> 
      </div>

      <hr>

      </div>

<?php include "includes/footer.html" ?>
