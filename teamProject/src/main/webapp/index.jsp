
<%@page import="teamProject.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<title>Main</title>
</head>
<body>
	<%
	int log = -1;
	if (session.getAttribute("log") != null) {
		log = (int) session.getAttribute("log");
		System.out.println(log + "##");
	}
	%>
	<div class="wrap">

	<jsp:include page="header.jsp"></jsp:include>

		<div class="main">
			<div class="txt">
				<p class="txt1">세계 최대 온라인 공유도서관</p>
				<p class="txt2">2011년 시작된 세계 최초의 공유도서관인 Rona's Books는 GoogleGoogle에서 만든
				온라인 구독 서비스입니다</p>
				<button class="btn1" onclick="location.href='./subscription'">정기구독 신청하기</button>
			</div>
		</div>
		
	</div>

</body>
</html>