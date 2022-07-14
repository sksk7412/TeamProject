console.log("1");


$('.review').on('click', e=>{
	// $('.ifr').css('display','flex');
	$('.review').css('background-color','#d0c09e');
	$('iframe').prop('src','myReview.jsp');
	$('.myLibrary').css('background-color','#f0f0f0');
	$('.dibs').css('background-color','#f0f0f0');
})

$('.myLibrary').on('click', e=>{
	$('.myLibrary').css('background-color','#d0c09e');
	$('iframe').prop('src','myLibrary.jsp');
	$('.review').css('background-color','#f0f0f0');
	$('.dibs').css('background-color','#f0f0f0');
})
$('.dibs').on('click', e=>{
	$('.dibs').css('background-color','#d0c09e');
	$('iframe').prop('src','dibs.jsp');
	$('.review').css('background-color','#f0f0f0');
	$('.myLibrary').css('background-color','#f0f0f0');
})

