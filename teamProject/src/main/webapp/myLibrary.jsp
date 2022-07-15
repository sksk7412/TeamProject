<%@page import="teamProject.UserDAO"%>
<%@page import="teamProject.MyLibraryDAO" %>
<%@page import="teamProject.MyLibraryDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<script src="bookApi.js"></script>
<title>MyLibrary</title>
</head>
<body>
	<%
	if(session.getAttribute("log")!=null) {
	int log = (int)session.getAttribute("log");
	%>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
            	
                <p class="myPage"><img src="image/mypage.png"></p>
                <p class="search"><img src="image/search.png"></p>
                <p class="login">LOGIN</p>
                <p class="join">JOIN</p>
            </div>
        </div>

        <div class="nav">
            <div>
                <p class="menu1">BEST</p>
                <p class="menu2">NEW</p>
                <p class="menu3">HOW TO</p>
                <p class="menu4">ABOUT</p>
            </div>
        </div>
        
        <script>
        	let name = "";
			let isbn = "";
		</script>
		
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
	            	if(dao.getMyLibraryDto(log).size() > 0) {
	            		for(int i=0; i<dao.getSize(log); i++) {
	            			MyLibraryDTO dto = dao.getMyLibraryDto(log).get(i);
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
    <%
	}
    %>
</body>
</html>