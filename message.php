<?php include "includes/header.html" ?>


<?php

/**
 * Get user details based on a username
 * The script will present the details of the username passed in the GET, or try the session and cookie.
 * it dies if no id can be found.
 */
require 'php/db.php';

$username = isset($_GET['username']) ? $_GET['username'] : (isset($_COOKIE['username']) ? $_COOKIE['username'] : (isset($_SESSION['username']) ? $_SESSION['username'] : NULL));
$requestID = isset($_GET['requestID']) ? $_GET['requestID'] : NULL;
$userID = isset($_COOKIE['userID']) ? $_COOKIE['userID'] : (isset($_SESSION['userID']) ? $_SESSION['userID'] : NULL);

$my_profile = False;
if (isset($_COOKIE['username'])) {
    $my_profile = ($username == $_COOKIE['username']);
}
elseif (isset($_SESSION['username'])) {
    $my_profile = ($username == $_SESSION['username']);
}

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
    count(message.messageID) AS `messages`,
    COUNT(DISTINCT IF(message.`status` = 0 AND message.`to`  = '$userID',
            message.messageID,
            NULL)) AS `sum_new_message`
FROM
    requests
        INNER JOIN
    users AS resquester ON (resquester.userID = requests.`from`)
        INNER JOIN
    users AS helper ON (helper.userID = requests.`to`)
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
    (helper.username  = '$username' OR resquester.username  = '$username')
GROUP BY requests.requestID
ORDER BY requests.statusID ASC, requests.start_date;
EOF;
if ($result = $db->query($query)) {
    while ($row = $result->fetch_assoc()) {
        $row['requesting'] = ($row['requester_ID'] == $userID);
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
    message.`to` AS `to`,
    message.date AS `date`,
    message.subject AS `subject`,
    REPLACE(message.body, '\r\n', '<br>') AS `body`,
    message.status AS `message_status`,
    resquester.userID AS `requester_ID`,
    resquester.username AS `requester_username`,
    resquester.forename AS `requester_forename`,
    resquester.surname AS `requester_surname`,
    helper.userID AS `helper_ID`,
    helper.username AS `helper_username`,
    helper.forename AS `helper_forename`,
    recipient.username AS `recipient_username`,
    recipient.forename AS `recipient_forename`,
    recipient.surname AS `recipient_surname`,
    sender.username AS `sender_username`,
    sender.forename AS `sender_forename`,
    sender.surname AS `sender_surname`
FROM
    message
        INNER JOIN
    requests USING (requestID)
        INNER JOIN
    users AS resquester ON (resquester.userID = requests.`to`)
        INNER JOIN
    users AS helper ON (helper.userID = requests.`from`)
        INNER JOIN
    users AS recipient ON (recipient.userID = message.`to`)
        INNER JOIN
    users AS sender ON (sender.userID = message.`from`)
WHERE
    message.requestID = $requestID
GROUP BY message.messageID
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

// Update the details
$query = "UPDATE message SET `status`='1' WHERE requestID = $requestID AND `to` = $userID;";
if ($result = $db->query($query)) {
    $db->commit();
}

?>


<script type="text/javascript">
   $(function () {
      $('#example-c').barrating();
   });
</script>

<div class="jumbotron">
    <div class="container ">
        <div class="row">
                <div class="col-xs-12 col-md-4 conversations">
                    <span class="sidebar-brand"><strong>Conversations</strong></span>

                    <div class="space20"></div>
                    <span class="sidebar-brand">I have been asked for help</span>
                    <div class="space10"></div>
                    <ul class="sidebar-nav">
                    <?php foreach ($user_requests as $key => $request) { ?>
                        <? if ($request['request_statusID'] != 4 && $request['request_statusID'] != 3) { ?>
                            <? if ($request['requestID'] == $requestID) {
                                    $selected_request = $request;
                                }
                            ?>
                            <? if (!$request['requesting']) { ?>
                            <li>
                                <a href="/message/<? echo $request['requestID'] ?>">
                                <? echo $request['requester_username'] ?> |
                                <small><? echo $request['skill_name'] ?></small>
                                <span class="badge message_unread"><?php if ($request['sum_new_message'] > 0) { echo $request['sum_new_message']; }; ?></span>
                                </a>
                            </li>
                            <? } ?>
                        <? } ?>
                    <? } ?>
                    </ul>

                    <div class="space20"></div>
                    <span class="sidebar-brand">I asked for help</span>
                    <div class="space10"></div>
                    <ul class="sidebar-nav">
                    <?php foreach ($user_requests as $key => $request) { ?>
                        <? if ($request['request_statusID'] != 4 && $request['request_statusID'] != 3) { ?>
                            <? if ($request['requestID'] == $requestID) {
                                    $selected_request = $request;
                                }
                            ?>
                            <? if ($request['requesting']) { ?>
                            <li>
                                <a href="/message/<? echo $request['requestID'] ?>">
                                <? echo $request['helper_username'] ?> |
                                <small><? echo $request['skill_name'] ?></small>
                                <span class="badge message_unread"><?php if ($request['sum_new_message'] > 0) { echo $request['sum_new_message']; }; ?></span>
                                </a>
                            </li>
                            <? } ?>
                        <? } ?>
                    <? } ?>
                    </ul>

                    <div class="space20"></div>
                    <span class="sidebar-brand">Past conversations</span>
                    <div class="space10"></div>
                    <ul class="sidebar-nav">
                    <?php foreach ($user_requests as $key => $request) { ?>
                        <? if ($request['request_statusID'] == 4 || $request['request_statusID'] == 3) { ?>
                        <? if ($request['requestID'] == $requestID) {
                                $selected_request = $request;
                            }
                        ?>
                        <li>
                            <a href="/message/<? echo $request['requestID'] ?>">
                            <? if ($request['requesting']) {
                                echo $request['helper_username'];
                            } else {
                                echo $request['requester_username'];
                            };
                            ?>
                            | <small><?php echo $request['skill_name'];'s' ?></small>
                            <span class="badge message_unread"><?php if ($request['sum_new_message'] > 0) { echo $request['sum_new_message']; }; ?></span>
                            </a>
                        </li>
                        <? } ?>
                    <? } ?>
                    </ul>

                </div>
                <div class="col-xs-12 col-md-8 inbox">
                    <?php if ($selected_request) : ?>
                        <div class="col-lg-12 reply_request">
                            <h1><? if (!$selected_request['requesting']) { echo 'Can you help'; echo " ". $selected_request['requester_username'];} else { echo 'Help from'; echo " ". $selected_request['helper_username'];}; ?>?</h1>
                        </div>

                        <div class="col-xs-12 reply_request">
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


                            <?php if ($selected_request['request_statusID'] == 1 && !$selected_request['requesting']) : ?>
                                <div class="request_details ">
                                    <form method="post" action="<?php echo $baseurl; ?>/php/requests/answer_request.php" accept-charset="UTF-8" class="pull-right">
                                        <input type="submit" class="btn btn-default yesno_btn" value="Yes">
                                        <input type="hidden" name="requestID" value="<?php echo $selected_request['requestID']; ?>">
                                        <input type="hidden" name="statusID" value="2">
                                    </form>
                                    <form method="post" action="<?php echo $baseurl; ?>/php/requests/answer_request.php" accept-charset="UTF-8" class="pull-left">
                                        <input type="submit" class="btn btn-default yesno_btn" value="No">
                                        <input type="hidden" name="requestID" value="<?php echo $selected_request['requestID']; ?>">
                                        <input type="hidden" name="statusID" value="3">
                                    </form>
                                </div>

                            <?php elseif ($selected_request['request_statusID'] == 1 && $selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4 class="pending">Pending</h4>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 2 && !$selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4 class="accepted">Accepted</h4>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 2 && $selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <div class="request_details ">
                                        <h4 class="accepted">Accepted</h4>
                                    </div>
                                        <a href="#menu-toggle" data-toggle="modal" class="btn btn-default pull-right" data-target="#close_skill_modal" id="help_completed_btn"><h4>Help completed!</h4></a>
                                        <?php include "includes/close_skill_modal.php" ?>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 3 && !$selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4 class="refused">Refused</h4>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 3 && $selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4 class="refused">Refused</h4>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 4 && !$selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4>Help completed</h4>
                                </div>
                            <?php elseif ($selected_request['request_statusID'] == 4 && $selected_request['requesting']) : ?>
                                <div class="request_details">
                                    <h4>Help completed</h4>
                                </div>
                            <? endif; ?>

                        </div>

                        <div class="col-xs-12 message_history">
                                <ul class="list-unstyled">
                                <?php foreach ($request_messages as $key => $message) { ?>
                                    <? $own_message = false;
                                    if ($message['from'] == $userID) { $own_message = true; }; ?>
                                    <li class="<? if ($own_message) { echo 'own_'; }; ?>message">
                                        <small>from <? if ($own_message) { echo 'you'; } else { echo $message['sender_username']; } ?> on <? echo $message['date']; ?></small>
                                        <p><? echo $message['body']?></p>
                                    </li>
                                 <? } ?>
                                </ul>
                        </div>
                        <div class="col-xs-12 write_message">
                            <form method="post" action="<?php echo $baseurl; ?>/php/requests/send_message.php" accept-charset="UTF-8">
                                <input type="hidden" name="requestID" value="<?php echo $selected_request['requestID']; ?>">
                                <?php if ($userID != $selected_request['requester_ID']) : ?>
                                    <input type="hidden" name="to" value="<?php echo $selected_request['requester_ID']; ?>">
                                <? else: ?>
                                    <input type="hidden" name="to" value="<?php echo $selected_request['helper_ID']; ?>">
                                <? endif; ?>
                                <textarea name="message_body" class="form-control" rows="6"></textarea>
                                <input type="submit" class="btn btn-default" id="send_btn" value="Send message">
                            </form>
                        </div>
                    <? endif; ?>
                </div>
            </div> <!--row-->

    </div><!--container-->
</div> <!--jumbotron-->

<?php include "includes/footer.html" ?>
