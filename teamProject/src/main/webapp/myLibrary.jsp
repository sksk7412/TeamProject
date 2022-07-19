<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.MyLibraryDAO"%>
<%@page import="teamProject.MyLibraryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/book.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<title>MyLibrary</title>
</head>
<body>
	<%
		if(session.getAttribute("log")!=null) {
			int log = (int)session.getAttribute("log");
			MyLibraryDAO dao = MyLibraryDAO.getInstance();
			ArrayList<MyLibraryDTO> lis = dao.getMyLibraryDto(log);
	%>
	<div class="boardListContainer">
		<form method="post" action="./Service">
			<table border="1">
				<thead>
					<th>책 이미지</th>
					<th>책 제목</th>
					<th>작가명</th>
					<th>도서 소개</th>
				</thead>

				<input type="hidden" id="isbn" name="command" value="deleteLis">
				<tbody class="LibraryList">
				</tbody>
			</table>
		</form>
	</div>

	<script src="bookApi.js"></script>
	<script type="text/javascript">
		<% if(lis != null) { %>
		$(document).ready(function() {
		const isbn = [
		<%
		for(int i = 0; i < lis.size(); i++) {%>
			"<%= lis.get(i).getIsbn() %>"
			<%= i + 1 < lis.size() ? ",":"" %>
			<% } 
		%>];
		getDibs(isbn);
		});
	</script>
	<%
	    }
		}
	%>
</body>
</html>