/**
* We're using jQuery to submit the forms and expect a JSON callback in the following format:
* {
*    success:   [required] boolean (true/false)
*    msg:       [required] string (message)
*    href:      string (a redirect url that will applied after the callback is received) 
*    post_to:   string id of a form that should be posted when the call back is received (chaining used for signup, login for instance)
*    post_data: array of ids of the form inputs that should be submitted
* }
*/

$(document).ready(function () {
    $("form").submit(function (event) {
        event.preventDefault();   
        $.ajax({
            url     : $(this).attr('action'),
            type    : $(this).attr('method'),
            dataType: 'json',
            data    : $(this).serialize()
        })
        .done(function(data, textStatus, jqXHR) {
            if (data.success == true) {
                $("#alerts").html('<div class="alert alert-success alert-dismissible" role="alert">'
                    +data.msg
                    +'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
            } else if (data.success == false) {
                $("#alerts").html('<div class="alert alert-danger alert-dismissible" role="alert">'
                    +data.msg
                    +'<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
            }
            if (data.href) {
                window.location = data.href;
            }
            if (data.post_to && data.post_data) {
                console.log(data.post_data);
                for (input_id in data.post_data) {
                    console.log(input_id, data.post_data[input_id]);
                    $(input_id).val(data.post_data[input_id]);
                }
                $(data.post_to).submit();
            }
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            $("#alerts").html('<div class="alert alert-success" role="alert">'+textStatus+': '+errorThrown+'</div>');
        });
    });
});