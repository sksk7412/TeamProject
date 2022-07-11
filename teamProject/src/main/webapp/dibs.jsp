<%@page import="teamProject.DibsBookDAO"%>
<%@page import="teamProject.DibsBookDTO"%>
<%@page import="java.util.Map" %>
<%@page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
                <p class="search"></p>
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
                
        <div class="dibsBookContents">
        <%
        DibsBookDAO dao = DibsBookDAO.getInstance();
        
        Map<Integer, DibsBookDTO> temp = dao.getMap();
        Object[] keySet = temp.keySet().toArray();
        
        	int id = 0;
        	String title = null;
        	String thumbnail = null;
        	String isbn = null;
        	String authors = null;
        	Timestamp createAt = null;
        	
        	for(Object b : keySet) {
        		id = temp.get(b).getId();
        		title = temp.get(b).getTitle();
        		thumbnail = temp.get(b).getThumbnail();
        		isbn = temp.get(b).getIsbn();
        		authors = temp.get(b).getAuthors();
        		createAt = temp.get(b).getCreatedAt();
        	}
        %>
        	<div class="dibBook">
        		<div class="bookList">1</div>
        		<div class="bookList">2</div>
        		<div class="bookList">3</div>
        		<div class="bookList">4</div>
        		<div class="bookList">5</div>
        	</div>
        </div>
            
      </div>
</body>
</html>