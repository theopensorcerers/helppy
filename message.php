<?php include "includes/header.html" ?>





<div class="jumbotron">
<div class="container contacts">



        <!-- Sidebar contacts/other users-->
        <div id="sidebar-wrapper">
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
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row request">
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
                        <a href="#menu-toggle" class="btn btn-default" id="yesno_btn"><h4>Help completed!</h4></a>
                        </div> <!-- end of help completed button-->
                    </div>
                    <hr></hr>
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
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
</div>

</body>