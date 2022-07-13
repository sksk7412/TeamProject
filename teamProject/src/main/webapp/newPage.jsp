<%@page import="teamProject.BestBookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.BestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/bestBook.css">
<title>NEWPAGE</title>
</head>
<%
        	BestBookDAO dao = BestBookDAO.getInstance();
        	
        	ArrayList<BestBookDTO> new_books = dao.getNewBooks();
%>
<body>
	<jsp:include page="header.jsp"></jsp:include>
        <p class="mainContents">NEW</p>
        <div class="best_seller">
	    	<div class = "book"></div>
        </div>
        <script src="bookApi.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			const bestSeller = [
			<% for (int i = 0; i < new_books.size(); i++) {%>
			"<%= new_books.get(i).getIsbn() %>"<%= i + 1 < new_books.size() ? ",":"" %><% } %>];
			getBookstoArray(bestSeller);
			});
		</script>
      </div>
</body>
</html>