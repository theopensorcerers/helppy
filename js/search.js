/**
* Hooks into a search input to query the database for categories, skills and users
* We're using jQuery to submit the forms and expect a JSON callback in the following format:
* {
*    success:   [required] boolean (true/false)
*    msg:       [required] string (message)
*    href:      [required] string (url to the search result) 
*    results:   [required] array of results
*    search_terms: [required] array of search terms
* }
*/

$(document).ready(function(){
	$( ".search" ).keyup(function() {
		event.preventDefault();
		var search_input = $(this).val();
		// we need at least 3 chars to before running the search
		if (search_input.length < 3) { 
			return true 
		}
		console.log("search_input", $(this).val());
		$.ajax({
            url     : $(this).data('action'),
            type    : $(this).data('method'),
            dataType: 'json',
            data    : { 'search_input': search_input }
        })
        .done(function(data, textStatus, jqXHR) {
            if (data.success == true) {
                $("#alerts").html('<div class="alert alert-success alert-dismissible" role="alert"><strong>'
                    +data.msg
                    +'</strong><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
            } else if (data.success == false) {
                $("#alerts").html('<div class="alert alert-danger alert-dismissible" role="alert"><strong>'
                    +data.msg
                    +'</strong><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
            }
            if (data.href) {
                $("#alerts div").append("<br><em>You will be redirected in 2 seconds</em>");
                if (data.href == "window.location") {
                    data.href = window.location;
                }
                setTimeout(function() {
                    window.location = data.href; 
                }, 2500);
            }
            if (data.post_to && data.post_data) {
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
