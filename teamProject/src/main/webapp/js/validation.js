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
	$('iframe').prop('src','myReview.jsp');
	
	console.log("2");
	$('iframe').prop('src','myReview.jsp');	
})

$('.wrote').on('click', e=>{
	
	$('iframe').prop('src','reviewBoard.jsp');
	
})

jQuery.fn.center = function () {
	    this.css("position","absolute");
	    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()-60) + "px");
	    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		
	    return this;
	}
	showPopup = function() {
		$(".pop1").show();
		$(".pop1").center();
	}
	
	$(".subsBtn").on('click', e=>{
		$(".black").css("display","block");
	});
	
		
	$(".cancle").on('click', e=>{
		$(".pop1").css("display","none");
		$(".black").css("display","none");
		$(".account").css("display","none");
		$(".card").prop("checked","true");
		$(".deposit").prop("checked","true");
	});
	
	$(".basic").on('click', e=>{
		$(".pay").html("5500");
		$(".ticketName").html("베이직 정기권");
	});
	$(".standard").on('click', e=>{
		$(".pay").html("7700");
		$(".ticketName").html("스탠다드 정기권");
	});
	$(".premium").on('click', e=>{
		$(".pay").html("9900");
		$(".ticketName").html("프리미엄 정기권");
	});
	
	$("#deposit").on('click', e=>{
		$(".account").css("display","block");
	});
	$("#card").on('click', e=>{
		$(".card").prop("checked","true");
	});
	$("#deposit").on('click', e=>{
		$(".deposit").prop("checked","true");
	});
	
function requestPay() {
  IMP.init('iamport'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
  IMP.request_pay({
    pg: "inicis",
    pay_method: "card",
    merchant_uid : 'merchant_'+new Date().getTime(),
    name : $('.ticketName').text(),
    amount : $('.pay').text(),
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
  }, function (rsp) { // callback
	  console.log(rsp);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      alert(msg);
	      location.href = "./mypage"
	    } else { 
	      var msg = '결제에 실패하였습니다.';
	      msg += '에러내용 : ' + rsp.error_msg;
	      alert(msg);
	    }
  });
}

function monthly(){
	IMP.init('iamport'); 
	IMP.request_pay({
	merchant_uid: "order_monthly_0001", // 상점에서 관리하는 주문 번호
	name : '최초인증결제',
	amount : 0, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
	customer_uid : 'TCSUBSCRIP', // 필수 입력
	buyer_email : 'iamport@siot.do',
	buyer_name : '아임포트',
	buyer_tel : '02-1234-1234'
}, function(rsp) {
	if ( rsp.success ) {
		alert('빌링키 발급 성공');
	} else {
		alert('빌링키 발급 실패');
	}
});
	}
	
function test(){
	IMP.init('iamport');	
	IMP.request_pay({
	pg : 'danal_tpay',
	pay_method : 'card', // 'card'만 지원됩니다.
	merchant_uid: "order_monthly_0001", // 상점에서 관리하는 주문 번호
	name : '최초인증결제',
	amount : 0, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다.
	customer_uid : '9810030929', // 필수 입력.
	buyer_email : 'iamport@siot.do',
	buyer_name : '아임포트',
	buyer_tel : '02-1234-1234'
}, function(rsp) {
	if ( rsp.success ) {
		alert('빌링키 발급 성공');
	} else {
		alert('빌링키 발급 실패');
	}
});
	}
	
	


