<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<title>Review Write</title>
</head>
<body>
	 <%
     if(session.getAttribute("log")!=null){
        int log = (int)session.getAttribute("log");
        UserDAO dao=UserDAO.getInstance();
        String name= dao.getName(log);        
	%>
	<div class="wrap">
      
     <jsp:include page="header.jsp"></jsp:include>
     
     <div class="container">
     <form method="post" action="">
     	<input type="text" name="contents" placeholder="최소 10자이상 입력해주세요" minlength="10">
     	<input type="submit">
     
     </form>
     </div>
         	
    </div>
    <%}%>
</body>
</html>