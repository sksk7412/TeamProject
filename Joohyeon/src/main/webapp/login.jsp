<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Login</title>
</head>
<body>
<%if(request.getParameter("check")!= null){ %>
<script>
alert("회원정보를 확인하세요.");
</script>

<%}%>

	<div class="wrap">
      <jsp:include page="header.jsp"></jsp:include>
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
       		 <div class="loginnaver" id="naverIdLogin"></div><br>
       		<input type="button" class="joinBtn"  name="join" value="회원가입" onclick="location.href='./join'" >
       	</div>
	</form>
	<script src="user.js"></script>
	
      </div>
      </div>
      
      <script type="text/javascript">
if(sessionStorage.getItem("user_info") != null){
	let id = sessionStorage.getItem("user_info").substr(1,18);
	let pw = sessionStorage.getItem("naver_name");
	let name = sessionStorage.getItem("naver_name"); 
	console.log(id);
	console.log(pw);
	
$(document).ready(function(form) {
	$('#testId').val(id);
	$('#testPw').val(pw);
	
	$('.login-btn').trigger('click');
});
}
</script>
      
</body>
</html>