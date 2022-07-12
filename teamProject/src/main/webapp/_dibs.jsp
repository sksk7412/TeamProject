<%@page import="teamProject.DibsBookDAO"%>
<%@page import="teamProject.DibsBookDTO"%>
>% 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<script src=""></script>
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
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

		<div class="a">
        <table border="1">
            <thead></thead>
            <tbody>
            <%
			DibsBookDAO dao = DibsBookDAO.getInstance();
		
			if(dao.getDibsBookDto().size() > 0) {
				for(int i=0; i<dao.getSize(); i++){
					DibsBookDTO dto = dao.getDibsBookDto().get(i);
			%>
                <tr>
                    <td><%= %></td>
                    <td><%= %></td>
                    <td><%= %></td>
                </tr>
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