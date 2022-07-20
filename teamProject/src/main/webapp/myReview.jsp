<%@page import="teamProject.MyLibraryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.MyLibraryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<title>MyReview</title>
</head>
<body>
	<%

	int log = (int) session.getAttribute("log");
	MyLibraryDAO dao = MyLibraryDAO.getInstance();
	ArrayList<MyLibraryDTO> lbry = dao.getLi(log);
	
	if(lbry != null){
		
%>
	<div class="boardTop">
		<p class="title"></p>
		<a href='./review' target="_top"> <input type="button"
			class="allView" value="전체보기">
		</a> <input type="button" class="allView" value="전체보기"
			onclick="location.href='./review'">
	</div>
	<div class="wrap">
		<table class="reviewTable"></table>
	</div>
	<script src="bookApi.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		const myLb = [
		<%	for(int i = 0; i < lbry.size(); i++){%>"<%= lbry.get(i).getIsbn() %>"<%= i + 1 < lbry.size() ? ",":"" %><% } %>];
		getMyLb(myLb);
		});
	</script>
	<%
	}
	%>
</body>
</html>