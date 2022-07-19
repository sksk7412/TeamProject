<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%if(request.getParameter("check")!= null){ %>
<script>
alert("회원정보를 확인하세요.");
</script>
<%}%>

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
        <div class="loginbox">
           <h2>로그인</h2>
	<form class="test" method="post" action="./Service">
	<input type="hidden" name="command" value="login">
		<input type="text" name="UserId" placeholder="아이디" class="req" required id="testId" ><br>
		<input type="password" name="UserPw" placeholder="비밀번호" class="req" required required id="testPw">
		<div class="warning">
           	<span>이메일 또는 비밀번호가 올바르지 않습니다.</span>
       	</div>
       	<div class="buttons">
       		<input type="submit" class="login-btn" value="로그인">
       		<br>
       		<div class="hr-sect">또는</div>
       		<br>
       	</div>
       	<div class="buttons">
       		<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    		width="205" height="45" alt="카카오 로그인 버튼" class="kakao" onclick="kakaoLogin()" ><br>
       		<div id="naverIdLogin"></div><br>
       		<input type="button" class="joinBtn"  name="join" value="회원가입" onclick="location.href='join.jsp'" >
       	</div>
	</form>
	<script src="user.js"></script>
	
      </div>
      </div>
</body>
</html>