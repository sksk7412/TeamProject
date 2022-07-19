<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Subscription</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrap">
        <div class="container">
        <div class="subs">
        <h2 class="title">월 정기구독</h2>
            <div class="box">

                <div class="basic">
                    <h2 class="bTxt1">Basic
                    <p>베이직 요금제</p>
                    <p class="price">월 5,500원</p>
                    </h2>
                    <p>eBook 무제한 도서</p>  
                    <button>가입하기</button>                
                </div>
                <div class="standard">
                     <h2 class="bTxt1">Standard
                     <p>스탠다드 요금제</p>
                    <p class="price">월 7,700원</p>
                    </h2>
                </div>
                <div class="premium">
                    <h2 class="bTxt1">Premium
                    <p>프리미엄 요금제</p>
                    <p class="price">월 9,900원</p>
                    </h2>
                    </h2>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>