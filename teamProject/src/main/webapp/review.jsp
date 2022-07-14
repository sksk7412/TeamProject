<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/review.css">
<title>Review</title>
</head>
<body>
	<div class="wrap">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<div class="btn">
		<button class="wrote">작성 한 리뷰</button>
		<button class="write">작성 가능한 리뷰</button>
		
	</div>
		<div class="ifr"> 				
       			<iframe src="reviewBoard.jsp" width="100%" height="100%" frameborder="0"
       			scrolling="no" marginwidth="0" marginheight="0" class="reviewPage">
       			</iframe>
       	</div>    
	</div>
	</div>
		<script src="js/validation.js"></script>
</body>
</html>