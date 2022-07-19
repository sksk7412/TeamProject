<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.UserDAO"%>
<%@page import="teamProject.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/form.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<%if(request.getParameter("check")!= null){ %>
<script>
alert("이미 등록된 아이디입니다.");
</script>
<%}%>
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
		<form class="test" method="post" action="./Service">
		<input type="hidden" name="command" value="join">
        	<div class="joinbox">
            	<h3>간편 회원가입</h3>
					<div class="btns">
			       		<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    						width="203" height="44" alt="카카오 로그인 버튼" class="kakao" onclick="kakaoLogin2();" >
			       		<div id="naverIdLogin"></div>
			       		
       				</div>
     <h3>필수 입력 정보</h3>
     <div class="label"><p>아이디</p> <input type="text" id="UserId" name="UserId" placeholder="아이디를 입력해주세요." class="req" required></div> <br>
	 <div class="label"><p>비밀번호</p> <input type="password" id="UserPw" name="UserPw" placeholder="비밀번호를 입력해주세요." class="req" required></div><br>
	 <div class="label"><p>이름</p> <input type="text" id="UserName" name="name" placeholder="이름을 입력해주세요." class="req" required></div><br>
	 <div class="label"><p>휴대폰</p> <input class="req" type="text" id="mobile" 
	 name="mobile" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="mobile" title="###-####-####"></div><br>
      
    
     <input id="checkAll" type="checkbox" name="checkAll" value="checkAll">선택포함 전체 약관 동의<br>
     <input type="checkbox" name="agree" value="1">이용약관 동의(필수)<br>
     <input type="checkbox" name="agree" value="2">이벤트,혜택 알림 수신 동의(선택)<br>
     <input type="checkbox" name="agree" 
     value="3">성별,생년 정보 제공 동의(선택)<br>
     <input type="checkbox" name="agree" value="4">개인 정보 수집 및 이용 동의(필수)<br>
    
     	</div>

    	 <input type="submit" class="join-btn" value="가입하기" onclick="checkVal(form)">
    	 </form>
      </div>
      <script src="user.js"></script>
      <script type="text/javascript">
		
		</script>
</body>
</html>