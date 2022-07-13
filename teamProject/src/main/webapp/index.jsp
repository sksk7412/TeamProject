<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<title>Main</title>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="wrap">
		<div class="main">
			<div class="txt">
				<p class="txt1">세계 최대 온라인 공유도서관</p>
				<p class="txt2">2011년 시작된 세계 최초의 공유도서관인 국민도서관 책꽂이는 책주인이 공유를 전제로
					책을 보관하고, 다른 많은 사람들이</p>
				<button class="btn1">정기구독 신청하기</button>
			</div>
		</div>
	</div>
	


	<%
	int log = -1;
	if (session.getAttribute("log") != null) {
		log = (int) session.getAttribute("log");
		System.out.println(log + "##");
	}
	%>

	<div class="wrap">
		<div class="header">
			<p class="logo">LOGO</p>
			<div class="topMenu">
				<%
				if (session.getAttribute("log") != null) {
				%>
				<p class="mypage" onclick="location.href='./mypage'">
					<img src="image/mypage.png">
				</p>
				<%
				} else {
				%>
				<p>
					<img class="mypage2" src="image/mypage.png">
				</p>
				<%
				}
				%>

				<p class="search" onclick="location.href='bookSearch.jsp'">
					<img src="image/search.png">
				</p>
				<%
				if (session.getAttribute("log") != null) {
				%>
				<form id="logControl" method="post" action="./Service">
					<input id="hiddenInput" type="hidden" name="command" value="">
					<p class="login" onclick="clickEvent()">LOGOUT</p>
				</form>
				<%
				} else {
				%>
				<p class="login" onclick="location.href='./login'">LOGIN</p>
				<%
				}
				%>
				<p class="join" onclick="location.href='./join'">JOIN</p>
			</div>
		</div>

		<div class="nav">
			<div>
				<p class="menu1" onclick="location.href='bestBook.jsp'">BEST</p>
				<p class="menu2" onclick="location.href='newPage.jsp'">NEW</p>
				<p class="menu3" onclick ="location.href='./subscription'">HOW TO</p>
				<p class="menu4">ABOUT</p>
			</div>
		</div>

		<div class="main">
			<div class="txt">
				<p class="txt1">세계 최대 온라인 공유도서관</p>
				<p class="txt2">2011년 시작된 세계 최초의 공유도서관인 국민도서관 책꽂이는 책주인이 공유를 전제로
					책을 보관하고, 다른 많은 사람들이</p>
				<button class="btn1">정기구독 신청하기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function clickEvent(){
		let log = document.getElementById('logControl');
		let hiddenIn = document.getElementById('hiddenInput');
		hiddenIn.setAttribute('value','logout');
		log.submit();
	}
	
	$('.mypage2').on('click', e=>{
		alert("로그인 후 이용 가능합니다.");
	})
	</script>
>>>>>>> branch 'master' of https://github.com/sksk7412/TeamProject.git
</body>
</html>