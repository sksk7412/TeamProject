console.log("1");


$('.review').on('click', e=>{
	// $('.ifr').css('display','flex');
	$('.review').css('background-color','#d0c09e');
	$('iframe').prop('src','myReview.jsp');
	$('.myLibrary').css('background-color','#f0f0f0');
	$('.dibs').css('background-color','#f0f0f0');
	$('.title').html('작성 가능한 리뷰');
})

$('.myLibrary').on('click', e=>{
	$('.myLibrary').css('background-color','#d0c09e');
	$('iframe').prop('src','myLibrary.jsp');
	$('.review').css('background-color','#f0f0f0');
	$('.dibs').css('background-color','#f0f0f0');
	$('.title').html('나의 서재');
})
$('.dibs').on('click', e=>{
	$('.dibs').css('background-color','#d0c09e');
	$('iframe').prop('src','dibs.jsp');
	$('.review').css('background-color','#f0f0f0');
	$('.myLibrary').css('background-color','#f0f0f0');
	$('.title').html('찜목록');
})

$('.write').on('click', e=>{
	console.log("2");
	$('iframe').prop('src','myReview.jsp');
	
})

$('.wrote').on('click', e=>{
	
	$('iframe').prop('src','reviewBoard.jsp');
	
})