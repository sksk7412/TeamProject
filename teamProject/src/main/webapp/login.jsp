<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
            	
                <p class="mypage" onclick="location.href='./mypage'"><img src="image/mypage.png"></p>
                <p class="search"><img src="image/search.png"></p>
                <p class="login" onclick="location.href='login.jsp'">LOGIN</p>
                <p class="join" onclick="location.href='join.jsp'">JOIN</p>
            </div>
        </div>

        <div class="nav">
            <div>
                <p class="menu1">BEST</p>
                <p class="menu2">NEW</p>
                <p class="menu3">HOW TO</p>
                <p class="menu4">ABOUT</p>
            </div>
        </div>
           <h1>로그인</h1>
	<form method="post" action="./login">
		<input type="text" name="UserId" placeholder="아이디" class="req"><br>
		<input type="password" name="UserPw" placeholder="비밀번호" class="req">
		<div class="warning">
           	<span>이메일 또는 비밀번호가 올바르지 않습니다.</span>
       	</div>
       	<div class="buttons">
       		<input type="submit" class="login" value="로그인"><br>
       		또는<br>
       	</div>
       	<div class="buttons">
       		<input type="button" name="kakao" value="카카오로 로그인"><br>
       		<input type="button" name="naver" value="네이버로 로그인"><br>
       		<input type="button" name="apple" value="Apple로 로그인"><br>
       	</div>
		<a class="signup-btn" href="join.jsp">회원가입</a>
	</form>
	<script src="user.js"></script>
      </div>
</body>
</html>