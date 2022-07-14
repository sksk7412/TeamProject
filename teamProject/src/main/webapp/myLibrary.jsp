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
<link rel="stylesheet" href="css/books.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<script src="bookApi.js"></script>
<title>My Library</title>
</head>
<body>
	<div class="wrap">
	<%--  <jsp:include page="header.jsp"></jsp:include> --%>
        
        <script>
        	let name = "";
			let isbn = "";
		</script>
		<h2>나의 서재</h2>
		<div class="boardListContainer">
	        <table border="1">
	            <thead>
	                <th>책 이미지</th>
	                <th>책 제목</th>
	                <th>작가명</th>
	                <th>도서 소개</th>
	            </thead>
	            
	            <tbody class="LibraryList">
	            	<%
	            	MyLibraryDAO dao = MyLibraryDAO.getInstance();
	            	String a;
	            	
	            	System.out.println();
	            	if(dao.getMyLibraryDto().size() > 0) {
	            		for(int i=0; i<dao.getSize(); i++) {
	            			MyLibraryDTO dto = dao.getMyLibraryDto().get(i);
	            			a = dto.getIsbn();
	            	%>
	                <input type="hidden" value="<%=a%>" id="isbn" class="isbn<%=i %>">
	              
	                <script>
	                	name = '.isbn' + <%=i%>;
	                	isbn = $(name).val();
	                	getLibraryForIsbn(isbn);
	                </script>
	                <%
	           			}
	            	}
	                %>
	            </tbody>
	        </table>
    	</div>
    </div>
</body>
</html>