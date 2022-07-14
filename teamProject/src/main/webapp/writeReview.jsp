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
<<<<<<< HEAD
     //  String isbn = request.getParameter("isbn");
	%>
	<div class="wrap">
      
     <jsp:include page="header.jsp"></jsp:include>
     
     <div class="container">
     <form method="post" action="./Service">
     	<input type="hidden" name="command" value="writeReview">
     	<label for="rate1">⭐</label>
     	<input type="text" name="contents" placeholder="최소 10자이상 입력해주세요" minlength="10">
     	<button>취소</button>
     	<input type="submit" value="등록">
=======
	%>
	<div class="wrap">
      
     <jsp:include page="header.jsp"></jsp:include>
     
     <div class="container">
     <form method="post" action="">
     	<input type="text" name="contents" placeholder="최소 10자이상 입력해주세요" minlength="10">
     	<input type="submit">
     
>>>>>>> refs/heads/master
     </form>
     </div>
         	
    </div>
    <%}%>
</body>
</html>