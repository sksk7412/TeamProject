<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">


var naver_id_login = new naver_id_login("8Y65VuJ4FktggRb3Yxgs", "http://localhost:8081/naver_callback.jsp");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3 , 44);
naver_id_login.setDomain("login.jsp");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();


	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	 naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
 	 function naverSignInCallback() {
    let id = naver_id_login.getProfileData('email');
    let name = naver_id_login.getProfileData('name');
//    let mobile = naver_id_login.getProfileData('mobile');



	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
</body>
</html>