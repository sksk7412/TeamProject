<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookInfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bookInfo.css">
</head>
<%
String isbn = request.getParameter("isbn");
%>
<body>
	<div class="wrap">
		<div class="header">
			<p class="logo">LOGO</p>
			<div class="topMenu">
				<p class="search">
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
<div class="main"></div>

<input type="hidden" value="<%=isbn%>" id="isbn">
	</div>
<script src="bookApi.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	let isbn = $('#isbn').val();
	getBookForIsbn(isbn);
});
</script>
</body>
</html>
