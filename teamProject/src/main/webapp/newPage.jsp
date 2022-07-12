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
	<div class="wrap">
        <div class="header">
            <p class="logo" onclick="location.href='index.jsp'">LOGO</p>
            <div class="topMenu">
            	
                <p class="myPage"><img src="image/mypage.png"></p>
                <p class="search" onclick="location.href='bookSearch.jsp'"><img src="image/search.png"></p>
                <p class="login">LOGIN</p>
                <p class="join">JOIN</p>
            </div>
        </div>

        <div class="nav">
            <div>
                <p class="menu1" onclick="location.href='bestBook.jsp'">BEST</p>
                <p class="menu2" onclick="location.href='newPage.jsp'">NEW</p>
                <p class="menu3">HOW TO</p>
                <p class="menu4">ABOUT</p>
            </div>
        </div>
            <!-- 여기에다가 추가할거 적어주세요 -->
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