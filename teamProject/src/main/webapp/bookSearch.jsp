<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bookSearch.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<p class="logo" onclick="location.href='./index.jsp'">LOGO</p>
			<div class="topMenu">
				<p class="search" onclick="location.href='bookSearch.jsp'">
					<img src="image/search.png">
				</p>
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
		<form class="searchWrap">
			<input type="text" id="input"> <input type="button"
				id="submit" value="검색" onclick="search(form)">
		</form>
		<div class="result"></div>
	</div>
	<script src="bookApi.js"></script>
</body>
</html>