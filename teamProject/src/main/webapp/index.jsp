<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>Main</title>
</head>
<body>
<%	if(session.getAttribute("log")==null){
		%>alert();<%
	}
       /*  UserDAO dao=UserDAO.getInstance(); */
%>
	 <div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
             
                <p class="mypage" onclick="location.href='./mypage'"><img src="image/mypage.png"></p>
           
                <p class="search"><img src="image/search.png"></p>
               <% if(session.getAttribute("log")!=null){%>
                <p class="login" onclick="location.href='login.jsp'">LOGOUT</p>
                <% }else{%> <p class="login" onclick="location.href='login.jsp'">LOGIN</p>
				<% } %>
                <p class="join" onclick="location.href='./join'">JOIN</p>
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

        <div class="main">
            <div class="txt">
                <p class="txt1">세계 최대 온라인 공유도서관</p>
                <p class="txt2">2011년 시작된 세계 최초의 공유도서관인 국민도서관 책꽂이는 책주인이 공유를 전제로 책을 보관하고, 다른 많은 사람들이 </p>
                <button class="btn1">
                    정기구독 신청하기
                </button>
            </div>
        </div>
    </div>
    <script>
    $('.mypage').on('click', e=>{
    	<% if(session.getAttribute("log")==null){ %>
    	alert("로그인 후 이용 가능합니다.");
    	$(.mypage).prop(onclick="index.jsp");
    	   <% }%>
    })
    </script>
</body>
</html>