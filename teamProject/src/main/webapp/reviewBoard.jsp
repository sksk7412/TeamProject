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
	</div>
	
	
	
	<script src=bookApi.js></script>
	<script>getLibraryForIsbn(<%=isbn%>)</script>
	<%
	}
	%>
</body>
</html>