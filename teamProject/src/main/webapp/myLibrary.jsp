<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.MyLibraryDAO"%>
<%@page import="teamProject.MyLibraryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>MyLibrary</title>
</head>
<body>
	<%
		if(session.getAttribute("log")!=null) {
			int log = (int)session.getAttribute("log");
			MyLibraryDAO dao = MyLibraryDAO.getInstance();
			ArrayList<MyLibraryDTO> lis = dao.getMyLibraryDto(log);
			System.out.println("lis: " + lis.size());
	%>
	<div class="boardListContainer">
		<table border="1">
		    <thead>
		        <th>책 이미지</th>
		        <th>책 제목</th>
		        <th>작가명</th>
		        <th>도서 소개</th>
		    </thead>
		    
		    <tbody class="LibraryList">
		    	<form class="result" action="./Service">
		           <input type="hidden" id="isbn" name="command" value="deleteLis">
		    	</form>
		    </tbody>
		</table>
    </div>
    
<script src="bookApi.js"></script>
    <script type="text/javascript">
		$(document).ready(function() {
		const isbn = [
		<%	for(int i = 0; i < lis.size(); i++){%>
			"<%= lis.get(i).getIsbn() %>"
			<%= i + 1 < lis.size() ? ",":"" %>
			<% } 
		%>];
		getLibraryForIsbn(isbn);
		});
	</script>
    
    
    <!-- <script type="text/javascript">
		$(document).ready(function() {
			let isbn = $('#isbn').val();
			getLibraryForIsbn(isbn);		
		});
	</script> -->
	<%
	    }
	%>
</body>
</html>