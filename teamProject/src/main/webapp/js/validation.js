console.log("1");


$('.review').on('click', e=>{
	// $('.ifr').css('display','flex');
	$('.review').css('background-color','#d0c09e');
	$('iframe').prop('src','mypage/myReview.jsp');
	$('.myLibrary').css('background-color','#f0f0f0');
	$('.dibs').css('background-color','#f0f0f0');
})

$('.myLibrary').on('click', e=>{
	
	$('.myLibrary').css('background-color','#d0c09e');
	$('.review').css('background-color','#f0f0f0');
})

