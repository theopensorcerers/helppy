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

$(document).ready(function() {
	var input = $('.search-container .search-input');
	input.keyup(function() {
		event.preventDefault();
		var search_input = $(this).val();
		
		// we need at least 3 chars to before running the search
		if (search_input.length < 3) { 
			$('.search-container .search-results').html('');
			return true
		}
		$.ajax({
            url     : $(this).data('action'),
            type    : $(this).data('method'),
            dataType: 'json',
            data    : {
            	'search_input': search_input
            }
        })
        .done(function(data, textStatus, jqXHR) {
        	var html_results = '';
            if (data.success == true) {
                html_results = '<li><strong>'
                    +data.msg
                    +'</strong></li>';
            } else if (data.success == false) {
                html_results = '<li><strong>'
                    +data.msg
                    +'</strong></li>';
                return false;
            }
            if (data.count_results > 0) {
                console.log("data.results", data.results);

                $(data.results.categories).each(function() {
				  html_results += '<li class="result_categories"><i class="fa fa-cube fa-2"></i> <a href="'+this.href+'">'+this.label+'</a></li>';
				});
				$(data.results.skills).each(function() {
				  html_results += '<li class="result_skills"><i class="fa fa-diamond fa-2"></i> <a href="'+this.href+'">'+this.label+'</a></li>';
				});
				$(data.results.users).each(function() {
				  html_results += '<li class="result_users"><i class="fa fa-user fa-2"></i> <a href="'+this.href+'">'+this.label+'</a></li>';
				});
            } 
            $('.search-container .search-results').html(html_results);
        })
        .fail(function(jqXHR, textStatus, errorThrown) {
            $("#alerts").html('<div class="alert alert-success" role="alert">'+textStatus+': '+errorThrown+'</div>');
        });
	});
});
