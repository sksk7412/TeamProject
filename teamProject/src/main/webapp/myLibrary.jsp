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
<script src="bookApi.js"></script>
<title>MyLibrary</title>
</head>
<body>
		
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
	                <input type="hidden" value="<%=a%>" id="isbn">
	                <tr class="pab">
	                    <td class="bookThumnail"></td>
	                    <td class="bookTitle"></td>
	                    <td class="bookAuthor"></td>
	                    <td class="bookContent"></td>
	                </tr>
	                <%
	            		}
	            	}
	                %>
	            </tbody>
	        </table>
    	</div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {
				let isbn = $('#isbn').val();
				getLibraryForIsbn(isbn);		
		});
	</script>
</body>
</html>