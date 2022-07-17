<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.DibsBookDAO"%>
<%@page import="teamProject.DibsBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/books.css">
<title>Dibs</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
		if(session.getAttribute("log")!=null) {
			int log = (int)session.getAttribute("log");
			DibsBookDAO dao = DibsBookDAO.getInstance();
			ArrayList<DibsBookDTO> dibs = dao.getDibsBookDto(log);
			
	%>
	<div class="wrap">
		<div class="dibsBook">
				<div class="bookList2">
			        	<div class="dibsBookContents">
			        		<form class="results" action="./Service">
			        			<input type="hidden" name="command" value="deleteDibs">
			        		</form>
			        	</div>
				</div>
		</div>            
     </div>
<script src="bookApi.js"></script>
	<script type="text/javascript">
			$(document).ready(function() {
			const dib = [
			<%	for(int i = 0; i < dibs.size(); i++){%>
				"<%= dibs.get(i).getIsbn() %>"
				<%= i + 1 < dibs.size() ? ",":"" %>
				<% } 
			%>];
			getBookForIsbn(dib);
			});
		</script>
	<%
	}
	%>
</body>
</html>