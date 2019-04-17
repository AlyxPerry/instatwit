$(document).on('turbolinks:load', function() {
	$('#unfollow_btn').hover(function(){
		$(this).removeClass('btn-success');
		$(this).addClass('btn-danger');
		$(this).html('Unfollow');
	}, function() {
		$(this).removeClass('btn-danger');
		$(this).addClass('btn-success');
		$(this).html('Following');
	})
})