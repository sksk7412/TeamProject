<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/subs.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Subscription</title>
</head>

<body>
	<div class="wrap">

	<jsp:include page="header.jsp"></jsp:include>
        <div class="container">
        <div class="black"></div>
        <div class="subs">
        <h3 class="title">월 정기구독</h3><hr>
            <div class="box">

                <div class="basic">
                    <h2 class="bTxt1">Basic
                    <p>베이직 요금제</p>
                    <p class="price">월 5,500원</p>
                    </h2>
                    <span class="txtBox">
                    <p>· 매 달 eBook 5권 무료이용</p>
                    </span>
                    <a class="link" href="javascript:;" onclick="javascript:showPopup()" >
                    <button class="subsBtn">구독하기</button>
                    </a>                            
                </div>
                <div class="standard">
                	
                     <h2 class="bTxt1">Standard
                     <p>스탠다드 요금제</p>
                    <p class="price">월 7,700원</p>
                    </h2>
                    <span class="txtBox">
                    <p>· 첫 달 무료이용</p>
                    <p>· 매 달 eBook 10권 무료이용</p>
                    </span>
                    <a href="javascript:;" onclick="javascript:showPopup()" >
                    <button class="subsBtn">구독하기</button>
                    </a>  
                </div>
                <div class="premium">
                    <h2 class="bTxt1">Premium
                    <p>프리미엄 요금제</p>
                    <p class="price">월 9,900원</p>
                    </h2>
                    <span class="txtBox">
                    <p>· 첫 달 무료이용</p>
                    <p>· 매 달 쿠폰증정</p>
                    <p>· e-Book 무제한 이용가능</p>
                    </span>
                    <a href="javascript:;" onclick="javascript:showPopup()" >
                    <button class="subsBtn">구독하기</button>
                    </a>  
                    </div>
                    
                </div>
            </div>
            
            <div class="pop1" >

            <div class="popTop">
            	<button class="cancle" id="cancle">X</button>
            	<h4>결제창</h4>
            </div>
            <div class="popCont">
            	<div class="ticketName"></div>
            	<div class="money">결제금액: <p class="pay"></p>원</div>
            	<p class="pTxt" id="card" onclick="requestPay()"><input type="radio" name="pay"  class="card" > 신용카드(체크카드)</p><hr> <br>
            	<p class="pTxt" id="deposit"><input type="radio" name="pay" class="deposit" > 무통장입금</p><hr><br>
            	<p class="account">신한은행 110-250-978102 박시연</p>
            	
            	<button class="cancle" id="cancleBtn">닫기</button>
            	</div>
            	
            </div>
  
           </div>
            
        </div>
    </div>
<script src="./js/validation.js"></script>
	<script type="text/javascript">
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
	
	<% if(session.getAttribute("log")==null){ %>
		$('.subsBtn').on('click', e=>{
			alert("로그인 후 이용 가능합니다.");
			$('a').prop("href","./loginPage")
		})
	<%}%>
	
	</script>
</body>
</html>