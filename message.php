<?php include "includes/header.html" ?>


<?php

/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username']);
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : $_SESSION['userID'];
$my_profile = False;
if (isset($_COOKIE['username']) || isset($_SESSION['username'])) {
    $my_profile = ($username == $_COOKIE['username'] || $username == $_SESSION['username']);
}
$userDetails = array();

// User details
$userDetails = array();

$query = "SELECT * FROM users WHERE username='$username'";
if ($result = $db->query($query)) {
    if ($row = $result->fetch_assoc()) {
        $userDetails = $row;
    } else {
        echo "No user found for this id";
    }
    /* free result set */
    $result->close();
} else {
    echo 'Unable to connect to the database';
}


// User feedback
$userfeedback = array();
$query = <<<EOF
SELECT 
    feedback.feedbackID AS `feedbackID`,
    feedback.rating AS `rating`,
    feedback.duration AS `duration`,
    feedback.body AS `feedback`,
    requests.requestID AS `requestID`,
    resquester.userID AS `requester_ID`,
    resquester.username AS `requester_username`,
    resquester.forename AS `requester_forename`,
    resquester.surname AS `requester_surname`,
    helper.userID AS `helper_ID`,
    helper.username AS `helper_username`,
    helper.forename AS `helper_forename`,
    helper.surname AS `helper_surname`,
    skills.skillID AS `skillID`,
    skills.name AS `skill_name`,
    request_skills.skillID AS `skillID`
FROM
    users
        INNER JOIN
    user_requests USING (userID)
        INNER JOIN 
    requests USING (requestID)
        INNER JOIN
    users AS resquester ON (resquester.userID = requests.`to`)
        INNER JOIN
    users AS helper ON (helper.userID = requests.`from`)
        INNER JOIN
    request_skills ON (request_skills.requestID = requests.requestID)
        INNER JOIN 
    skills USING (skillID)
        INNER JOIN
    feedback ON (feedback.requestID = requests.requestID)
WHERE
    users.username  = '$username'
GROUP BY requests.requestID;
EOF;
if ($result = $db->query($query)) {
    while ($row = $result->fetch_assoc()) {
        array_push($userfeedback, $row);
    }
    /* free result set */
    $result->close();
} else {
    echo 'Unable to connect to the database';
}

?>


<script type="text/javascript">
   $(function () {
      $('#example-c').barrating();
   });
</script>

<div class="jumbotron">
    <div class="container ">

        <div class="space70"></div>

             <div class="row ">
                <div class="col-xs-12 col-md-4 conversations">
                    <ul class="sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="#">Conversations</a>
                        </li>
                        <li>
                            <a href="#">User 1</a>
                        </li>
                        <li>
                            <a href="#">User 2</a>
                        </li>
                        <li>
                            <a href="#">User 3</a>
                        </li>
                        <li>
                            <a href="#">User 4</a>
                        </li>
                        <li>
                            <a href="#">User 5</a>
                        </li>
                        <li>
                            <a href="#">User 6 </a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-8 inbox">
                    <div class="col-lg-12 reply_request">
                        <h1>Can you help User 1?</h1>
                    </div>

                    <div class="col-lg-12 reply_request">
                        <div class="request_details">
                            <h4>Due Date</h4> <p>01/01/01</p>
                        </div> <!-- end of due date -->
                        <div class="request_details">
                            <h4>Skill</h4> <p>php skill</p>
                        </div> <!-- end of skill -->
                        <div class="request_details">
                            <a href="#menu-toggle" class="btn btn-default" id="yesno_btn"><h4>yes</h4></a>
                        </div> <!-- end of yes button-->
                        <div class="request_details">
                            <a href="#menu-toggle" class="btn btn-default" id="yesno_btn"><h4>no</h4></a>
                        </div> <!-- end of no button-->

                        <!--Only active after the button Yes has been pushed and sends a review request to other user-->
                        <div class="request_details">
                            <a href="#menu-toggle" data-toggle="modal" class="btn btn-default" data-target="#close_skill_modal" id="help_completed_btn"><h4>Help completed!</h4></a>

                            <?php include "includes/close_skill_modal.php" ?>

                        </div> <!-- end of help completed button-->
                    </div>   

                    <div class="col-lg-12 message_history">
                        <div class="message"><p>Hello could you help me with the frontend design of my website?</p></div>
                        <div class="own_message"><p>Hi there, when do you need it for?</p></div>
                        <div class="message"><p>I need it for next month</p></div>
                        <div class="own_message"><p>That sounds like enought time to do it</p></div>
                    </div>
                    <div class="col-lg-12 write_message">
                        <textarea class="form-control" rows="6"></textarea>
                        <a href="#menu-toggle" class="btn btn-default" id="send_btn">Send message</a>
                    </div>
                </div>
            </div> <!--row-->
         
    </div><!--container-->
</div> <!--jumbotron-->

<?php include "includes/footer.html" ?>

