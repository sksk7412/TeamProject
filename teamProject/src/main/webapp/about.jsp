<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/about.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<title>ABOUT</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>

		<div class="container">
		<div class="project">
		<div class="who">
		<div class="team" id="t1">
				<img src="./image/t5.jpg">
				<div class="txt">
					<h3 class="t1Name">김나연</h3>
					<span>
						<a href="mailto:nnnnayeon12@gmail.com">
						<p>nnnnayeon12@gmail.com</p></a>
						<p>Position: 서기/막내</p>
						<p>Function: 찜 목록/나의 서재</p>
					</span>
				</div>				
			</div><hr>
			<div class="team2" id="t2">
				<div class="txt">
					<h3 class="t2Name">김동호</h3>
					<span>
						<a href="mailto:greene246@naver.com">
						<p>greene246@naver.com</p></a>
						<p>Position: 넷째</p>
						<p>Fuction: DB관리/책 목록(카카오API 사용)/리뷰</p>
					</span>
				</div>
				<img src="./image/t4.jpg">
			</div><hr>
			<div class="team" id="t3">
				<img src="./image/t3.jpg">
				<div class="txt">
				<h3 class="t3Name">윤선주</h3>
					<span>
						<a href="mailto:ekflal330@gmail.com">
						<p>ekflal330@gmail.com</p></a>
						<p>Position: 조장</p>
						<p>Fuction: 상세페이지/리뷰쓰기/찜하기/DB연동</p>
					</span>
				</div>
			</div><hr>
			<div class="team2" id="t4">
				<div class="txt">
					<h3 class="t4Name">박시연</h3>
					<span>
						<a href="mailto:siyeonz@naver.com">
						<p>siyeonz@naver.com</p></a>
						<p>Position: 둘째</p>
						<p>Function: 메인페이지/구독페이지(결제)/about페이지</p>
					</span>
				</div>
				<img src="./image/t2.jpg">
			</div><hr>
			<div class="team" id="t5">
				<img src="./image/t1.jpg">
				<div class="txt">
					<h3 class="t5Name">성주현</h3>
					<span>
						<a href="mailto:wngusl1380@gmail.com">
						<p>wngusl1380@gmail.com</p></a>
						<p>Position: 첫째</p>
						<p>Function: 회원가입/로그인(카카오API 사용)</p>
					</span>
				</div>
			</div><hr>		
			
			
			
			
			
			
		</div>
	</div>
</div>
	</div>
	<script src="./js/about.js"></script>
</body>
</html>