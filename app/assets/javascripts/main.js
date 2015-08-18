$(document).ready(function() {
	// pushes the header down when collapsed menu is clicked
	$('.btn').on('click.collapse.data-api', function (){
		$("#content").toggleClass("content-collapsed");
	})

	// Changes arrow and shows / hides info on the products / services

	$('.service').on('click', function(e){
		e.preventDefault();
		var arrow = $(this).children('.arrow');

		if (arrow.attr('src') == '/assets/arrow-down.png') 
		{
			$(arrow).attr('src', '/assets/arrow-up.png');
			$(this).siblings('.details').removeClass("hidden");
		}
		else 
		{
			$(arrow).attr('src', '/assets/arrow-down.png');
			$(this).siblings('.details').addClass("hidden");
		}
	})

	// Removes add a new review and pulls up form
	$('.new-review-click').on('click', 'a', function(e){
		e.preventDefault();
		$(this).parent().siblings('.span6').removeClass('hidden');
		$('html, body').animate({
         scrollTop: $("#new_review").offset().top -77
     }, 800);
		$(this).parent().addClass('hidden');
	})

	// removes the new review form and shows the new review button
	$('.new_review').on('click', 'a', function(e){
		e.preventDefault();
		$(this).parent().parent().siblings('.new-review-click').removeClass('hidden');
		$('html, body').animate({
         scrollTop: $("#reviews").offset().top -77
     }, 800);
		$(this).parent().parent().addClass('hidden');
		
	})

	// Menu buttons
	
	$('.nav').on('click', 'a', function(e){
		var test = "#" + $(this).data("section");
		if ($(".in")[0]){
			$('html, body').animate({
        scrollTop: $(test).offset().top -362
     	}, 800);
     	$("#content").toggleClass("content-collapsed");
		} else {
		 	$('html, body').animate({
        scrollTop: $(test).offset().top -77
     	}, 800);
		}
		$(this).parent().siblings().removeClass('active');
		$(this).parent().addClass('active');


	})



















})

