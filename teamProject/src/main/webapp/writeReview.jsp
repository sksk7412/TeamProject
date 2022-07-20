<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/review.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>Review Write</title>
</head>
<body>
	<%
	if (session.getAttribute("log") != null) {
		int log = (int) session.getAttribute("log");
		UserDAO dao = UserDAO.getInstance();
		String name = dao.getName(log);
		String isbn = request.getParameter("isbn");
		System.out.println(isbn);
	%>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container">
			<form method="post" action="./Service">
				<input type="hidden" name="command" value="writeReview">
				<div class="reviewContents">
					<div class="bookInfo"></div>
					<input type="text" name="contents" placeholder="최소 10자이상 입력해주세요" minlength="10" id="texts">
					<div>
						<button>취소</button>
						<input type="submit" value="등록">
					</div>
				</div>
			</form>
		</div>

	</div>
	<script src=bookApi.js></script>
	<script>bookForReview(<%=isbn%>)</script>
	<%
	}
	%>
</body>
</html>