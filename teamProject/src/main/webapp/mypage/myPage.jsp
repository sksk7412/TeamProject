<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>My page</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
            <p class="mypage" onclick="location.href='./mypage'"><img src="image/mypage.png"></p>
                <p class="search"><img src="image/search.png"></p>
                <p class="login">LOGIN</p>
                <p class="join">JOIN</p>
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
        
       	<div class="container">
       		<div class="userTitle">
       			<p><img src="image/mypage.png" class="myIicon"></p>
       			<span class=txt>
       				<h1>님의 마이페이지</h1>
       				<p>나의 이용권</p>
       				<h3>ㅇㅇㅇ 정기권</h3>
       			</span>
       			
       			<span class="setting">
       			<p><img src="image/setting.png" class="settingIcon"></p>
       			<h4>회원정보 수정</h4>
       			</span>
       		</div>
       	
       	</div>      	
        
      </div>
</body> 
</html>