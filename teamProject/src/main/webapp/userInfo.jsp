<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/user.css">
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
<form action="./Service" metohd="post">
<input type="hidden" name="command" value="updateUser">
	<div class="update">
<h2>회원정보 수정</h2>
	<input type="text" value="<%=id%>" readonly><br>
	<input type="password" placeholder="변경 할 비밀번호" name="UserPw"required><Br>
	<input type="text" placeholder="<%=name%>" name="name" required><br>
	<input type="text" placeholder="<%=mobile%>" name="mobile"><Br>
	<input type="submit" value="수정하기" class="btn"><br>
	</div>
</form>	
</div>
</div>
<%} %>
</body>
</html>