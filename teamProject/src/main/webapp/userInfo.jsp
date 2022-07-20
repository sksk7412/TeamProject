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
	<h3 class="title">회원정보 수정</h3><hr>
	<div class="info">
	<div class="bd">
	<span class="inputName">아이디</span>
	<input type="text" value="<%=id%>" readonly><br>
	</div>
	<div class="bd">
	<span class="inputName">비밀번호</span>
	<input type="password" placeholder="변경 할 비밀번호" name="UserPw" required><Br>
	</div>
	<div class="bd">
	<span class="inputName">이름</span>
	<input type="text" value="<%=name%>" name="name"><br>
	</div>
	<div class="bd">
	<span class="inputName">연락처</span>
	<input type="text" value="<%=mobile%>" name="mobile"><Br>
	</div>
	<input type="submit" value="수정하기" class="btn"><br>
	</div>
	</div>
</form>	
</div>
</div>
<%} %>
</body>
</html>