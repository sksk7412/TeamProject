<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<title>Review Board</title>
</head>
<body>
	<%
if(session.getAttribute("log")!=null) {
	int log = (int)session.getAttribute("log");
	String isbn = request.getParameter("isbn");
%>
	<div class="wrap">
		<div class="container"></div>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<table>
		<div>
		<br>
			<h2>coming soon</h2>
		</div>
	</table>
		<button class="writed">작성 한 리뷰</button>
		<button class="write">작성 가능한 리뷰</button>
		<div class="ifr"> 				
       			<iframe src="myLibrary.jsp" width="100%" height="100%" frameborder="0"
       			scrolling="no" marginwidth="0" marginheight="0" class="reviewPage">
       			</iframe>
       	</div>    
	</div>
	
	
	
	<script src=bookApi.js></script>
	<script>getLibraryForIsbn(<%=isbn%>)</script>
	<%
	}
	%>
	</div>
</body>
</html>