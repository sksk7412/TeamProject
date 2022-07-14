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
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/bookSearch.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="searchWrap">
			<input type="text" id="input">
			<button id="button" onclick="search(0)">
				<img src="image/search.png" id="searchIcon">
			</button>
		</div>
		<div class="section">
			<div class="left" onclick="search(1)">
				<img src="image/left_arrow.png">
			</div>
			<div class="result"></div>
			<div class="right" onclick="search(2)">
				<img src="image/right_arrow.png">
			</div>
		</div>
		<div class="page_buttons">
			<p id="nowP"></p>
			<p>/</p>
			<p id="totalP"></p>
		</div>
	</div>
<script src="bookApi.js"></script>
</body>
</html>