<!-- start of close_skill_modal -->
<div class="modal fade" id="close_skill_modal" tabindex="-1" role="dialog" aria-labelledby="close_skill_modal_label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content help-completed-lightbox">
            <form method="post" action="<?php echo $baseurl; ?>/php/requests/close_request.php" accept-charset="UTF-8">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="close_skill_modal_label<?php if (isset($user['
                        userID'])) { echo '_'.$user['userID'];}; ?>">Help completed!</h4>
                </div>
                <div class="modal-body">

                    <p>Duration (a number of hours spent collaborating)</p>
                    <div class="form-group ">
                        <label for="duration"></label>
                        <input type="number" class="form-control duration_input"  name="duration">
                    </div>

                    <script>
                    $(document).ready(function() {
                        $('#stringLengthForm').formValidation({
                            framework: 'bootstrap',
                            duration: {
                                    validators: {
                                        stringLength: {
                                            max: 3,
                                            message: 'Duration should be a number of maximum 3 characters'
                                        }
                                    }
                                }
                            }
                        });
                    });
                    </script>

                    <p>Feedback</p>
                    <div class="col-lg-12 write_message">
                        <textarea autofocus name="feedback_body" class="form-control" rows="10"></textarea>
                    </div>
                    <div class="space10"></div>
                    <p>Rate this helpper</p>
                    <div> 
                        <!-- RATING SYSTEM ADAPTATION OF http://antenna.io/-->
                        <div class="input select rating-c">
                            <select id="example-c" name="rating" style="display: none;">
                                <option value=""></option>
                                <option value="1"></option>
                                <option value="2"></option>
                                <option value="3"></option>
                                <option value="4"></option>
                                <option value="5"></option>
                            </select>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <div class="space10"></div>
                    <input type="submit" class="btn btn-default" value="Close transaction">
                </div>
            </form>
        </div>
    </div>
</div>