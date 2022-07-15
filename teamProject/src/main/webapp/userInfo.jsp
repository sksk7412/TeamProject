<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<title>My Page Update</title>
</head>
<body>
  <%
     if(session.getAttribute("log")!=null){
        int log = (int)session.getAttribute("log");
        UserDAO dao=UserDAO.getInstance();
      
        String id= dao.getUserId(log);
        String name = dao.getName(log);
        String mobile = dao.getMobile(log);
	%>
<div class="wrap">
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
<h2>회원정보 수정</h2>
<form action="">
	<input type="text" value="<%=id%>" readonly>
	<input type="text" value="변경 할 비밀번호" >
	<input type="text" value="<%=name%>">
	<input type="text" value="<%=mobile%>">
	<input type="submit" value="수정하기">
</form>	
</div>
</div>
<%} %>
</body>
</html>