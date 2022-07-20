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
<link rel="stylesheet" href="css/review.css">
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
	ArrayList<MyLibraryDTO> lbry = dao.getUnReviewed(log);

	if (lbry != null) {
	%>
	<div class="boardTop">
		<p class="title"></p>
	</div>
	<div class="wrap">
		<div class="reviewTable"></div>
	</div>
	<script src="bookApi.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		const myLb = [
		<%for (int i = 0; i < lbry.size(); i++) {%>"<%=lbry.get(i).getIsbn()%>"<%=i + 1 < lbry.size() ? "," : ""%><%}%>];
		getMyLb(myLb);
		});
	</script>
	<%
	}
	%>
</body>
</html>