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
%>
	<div class="wrap">
	<div class="container">
	<table>
		<div>
		<br>
			<h2>coming soon</h2>
		</div>
	</table>
	</div>
	</div>
	<%} %>
</body>
</html>