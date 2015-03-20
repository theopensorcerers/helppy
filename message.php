<?php include "includes/header.html" ?>

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
                            <a href="#">
                                Conversations
                            </a>
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
                        <a href="#menu-toggle" data-toggle="modal" data-target="#myModal" class="btn btn-default" id="help_completed_btn"><h4>Help completed!</h4></a>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content help-completed-lightbox">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Help completed!</h4>
      </div>
      <div class="modal-body">
            <p>Duration (a number of hours spent collaborating)</p>
        
            <div class="form-group ">
  <label for="duration"></label>
  <input type="number" class="form-control duration_input" id="usr" name="dur">
</div>

        <script>
        $(document).ready(function() {
            $('#stringLengthForm').formValidation({
                framework: 'bootstrap',
                dur: {
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
        <div > 
            <textarea autofocus name="body" class="form-control completed-form" rows="5"></textarea>
        </div>
        <p>Rate this helpper</p>
        <div> 
            <!-- RATING SYSTEM ADAPTATION OF http://antenna.io/-->
            <div class="input select rating-c">
                        <select id="example-c" name="rating" style="display: none;">
                            <option value=""></option>
                            <option value="1"><p>1</p></option>
                            <option value="2"><p>2</p></option>
                            <option value="3"><p>3</p></option>
                            <option value="4"><p>4</p></option>
                            <option value="5"><p>5</p></option>
                        </select>
            </div>
        </div>

      </div>

      <div class="modal-footer">
        <a href="#menu-toggle" class="btn btn-default " id="close-transaction-btn" ><h4>Close transaction</h4></a>      
        </div>
    </div>
  </div>
</div>
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

