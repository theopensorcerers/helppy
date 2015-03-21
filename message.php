<?php include "includes/header.html" ?>


<?php

/**
 * Get user details based on a username 
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : $_SESSION['username']);
$requestID = isset($_GET['requestID']) ? $_GET['requestID'] : NULL;

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


// User resquests
$user_requests = array();
$selected_request = array();;
$query = <<<EOF
SELECT 
    requests.requestID AS `requestID`,
    DATE_FORMAT(requests.start_date,'%d/%m/%Y') AS `request_start_date`,
    DATE_FORMAT(requests.end_date,'%d/%m/%Y') AS `request_end_date`,
    requests.statusID AS `request_statusID`,
    request_status.name AS `request_status`,
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
    request_skills.skillID AS `skillID`,
    feedback.feedbackID AS `feedbackID`,
    feedback.rating AS `rating`,
    feedback.duration AS `duration`,
    feedback.body AS `feedback`,
    count(message.messageID) AS `messages`
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
    request_status ON (request_status.statusID = requests.statusID)
        INNER JOIN 
    skills USING (skillID)
        LEFT JOIN
    message ON (message.requestID = requests.requestID)
        LEFT JOIN
    feedback ON (feedback.requestID = requests.requestID)
WHERE
    users.username  = '$username'
GROUP BY requests.requestID
ORDER BY requests.start_date;
EOF;
if ($result = $db->query($query)) {
    while ($row = $result->fetch_assoc()) {
        array_push($user_requests, $row);
    }
    /* free result set */
    $result->close();
} else {
    echo 'Unable to connect to the database';
}

// if no requestID have been passed in the get string, set it to the first request
if (!$requestID && $user_requests) {
    $requestID = $user_requests[0]['requestID'];
}


$request_messages = array();
$query = <<<EOF
SELECT 
    message.`from` AS `from`,
    message.`to` AS `from`,
    message.date AS `date`,
    message.subject AS `subject`,
    message.body AS `body`,
    resquester.userID AS `requester_ID`,
    resquester.username AS `requester_username`,
    resquester.forename AS `requester_forename`,
    resquester.surname AS `requester_surname`,
    helper.userID AS `helper_ID`,
    helper.username AS `helper_username`,
    helper.forename AS `helper_forename`
FROM
    message
        INNER JOIN
    requests USING (requestID)
        INNER JOIN
    users AS resquester ON (resquester.userID = requests.`to`)
        INNER JOIN
    users AS helper ON (helper.userID = requests.`from`)
WHERE
    message.requestID = $requestID
GROUP BY message.requestID
ORDER BY message.date;
EOF;
if ($result = $db->query($query)) {
    while ($row = $result->fetch_assoc()) {
        array_push($request_messages, $row);
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
                    <span class="sidebar-brand">Conversations</span>
                    <ul class="sidebar-nav">
                    <?php foreach ($user_requests as $key => $request) { ?>
                        <? if ($request['requestID'] == $requestID) {
                                $selected_request = $request;
                            } 
                        ?>
                        <li>
                            <a href="message.php?requestID=<? echo $request['requestID'] ?>">
                            <? echo $request['requester_username'] ?> | 
                            <small><? echo $request['skill_name'] ?></small>
                            </a>
                        </li>
                    <? } ?>
                    </ul>
                </div>
                <div class="col-xs-12 col-md-8 inbox">
                    <div class="col-lg-12 reply_request">
                        <h1>Can you help <? echo $selected_request['requester_username']?>?</h1>
                    </div>

                    <div class="col-lg-12 reply_request">
                        <div class="request_details">
                            <h4>When</h4> 
                            <p>
                            <?php if ($selected_request['request_start_date'] != $selected_request['request_end_date']) : ?>
                                <? echo $selected_request['request_start_date']?> to <? echo $selected_request['request_end_date']?>
                            <? else: ?>
                                <? echo $selected_request['request_start_date']?>
                            <? endif; ?>
                            </p>
                        </div> <!-- end of due date -->
                        <div class="request_details">
                            <h4>Skill</h4> <p><? echo $selected_request['skill_name']?></p>
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
                        <?php foreach ($request_messages as $key => $message) { ?>
                            <div class="<? if ($message['from'] == $userID) { echo 'own_'; }; ?>message">
                            <small><? echo $message['date']?></small>
                            <p><? echo $message['body']?></p></div>
                        <? } ?>
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

