<!-- start of request_skill_modal -->
<div class="modal fade" id="request_skill_modal<?php if (isset($user['userID'])) { echo '_'.$user['userID'];}; ?>" tabindex="-1" role="dialog" aria-labelledby="request_skill_modal_label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content request-lightbox">
            <form method="post" action="<?php echo $baseurl; ?>/php/requests/create_request.php" accept-charset="UTF-8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="request_skill_modal_label<?php if (isset($user['userID'])) { echo '_'.$user['userID'];}; ?>">Request help</h4>
                </div>
                <div class="modal-body">
                
                    <div class="form-group">
                        <input name="helper_ID" type="hidden" value="<?php echo isset($userDetails['userID']) ? $userDetails['userID'] : $user['userID'] ?>">
                    <?php if (isset($userSkills)) : ?>
                        <p>Select a skill from
                            <?php echo $username ?>
                        </p>
                        <select name="request_skill_ID" data-placeholder="Select a skill ">
                            <?php foreach ($userSkills as $key=> $skill) { ?>
                            <option value="<?php echo $skill['skillID']; ?>">
                                <?php echo $skill[ 'skill_name'] . " (".$skill[ 'level_name']. ")"; ?>
                            </option>
                            <? } ?>
                        </select>
                    <? else : ?>
                        <p>Get help in <?php echo $skill['skill_name'];?> from <?php echo $user['username'] ?>
                        </p>
                        <input name="request_skill_ID" type="hidden" value="<?php echo $user['skillID'] ?>">
                    <? endif; ?>
                        <p>Add more details. What do you need?</p>
                        <div class="col-lg-12 write_message">
                            <textarea autofocus name="request_body" class="form-control" rows="10"></textarea>
                        </div>
                        <div class="space10"></div>
                        <p>When do you need it for?</p>
                        <div class="input-daterange input-group">
                            <input name="request_start_date" class="request_datepicker input-sm form-control date-request" type="text" />
                            <span class="input-group-addon to-addon">to</span>
                            <input name="request_end_date" class="request_datepicker input-sm form-control date-request" type="text" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="space10"></div>
                    <input type="submit" class="btn btn-default" value="Send request">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
    $('.request_datepicker').datepicker({
        format: "yyyy-mm-dd",
        todayBtn: "linked",
        autoclose: true,
        todayHighlight: true
    });
});
</script>
<!-- end of request_skill_modal -->
