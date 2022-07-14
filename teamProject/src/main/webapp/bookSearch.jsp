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
		<jsp:include page="header.jsp"></jsp:include>
	<div class="wrap">
<<<<<<< HEAD
<<<<<<< HEAD
		<jsp:include page="header.jsp"></jsp:include>
=======
>>>>>>> refs/remotes/origin/siyeon
=======
>>>>>>> refs/heads/master
		<form class="searchWrap">
			<div class="search_wrap">
				<input type="text" id="input">
<<<<<<< HEAD
<<<<<<< HEAD
				<input type="button" id="submit" value="검색" onclick="search()">
=======
				<input type="button" id="submit" value="검색" onclick="search(2)">
>>>>>>> refs/remotes/origin/siyeon
=======
				<input type="button" id="submit" value="검색" onclick="search(2)">
>>>>>>> refs/heads/master
			</div>
		</form>
		<div class="result"></div>
		<div class="page_buttons">
				<input type="hidden" id="page" name="page" value="1">
<<<<<<< HEAD
<<<<<<< HEAD
				<input type="button" id="next" value="next" onclick="search()">
=======
				<input type="button" id="preview" value="preview" onclick="search(1)">
				<input type="button" id="next" value="next" onclick="search(2)">
>>>>>>> refs/remotes/origin/siyeon
=======
				<input type="button" id="preview" value="preview" onclick="search(1)">
				<input type="button" id="next" value="next" onclick="search(2)">
>>>>>>> refs/heads/master
		</div>
	</div>
<script src="bookApi.js"></script>
</body>
</html>