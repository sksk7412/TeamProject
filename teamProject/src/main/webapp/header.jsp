<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

				<p class="search">
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
				<p class="login" onclick="location.href='./loginPage'">LOGIN</p>
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
</body>
</html>