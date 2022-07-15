<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<link rel="stylesheet" href="css/bookSearch.css">
<link rel="stylesheet" href="css/library.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
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
			<div class="left_arrow" onclick="search(1)">
				
			</div>
			<div class="result"></div>
			<div class="right_arrow" onclick="search(2)">
				
			</div>
		</div>
		<div class="page_buttons">
		</div>
	</div>
<script src="bookApi.js"></script>
</body>
</html>