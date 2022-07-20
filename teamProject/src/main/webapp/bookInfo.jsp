

<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.BoardDAO"%>
<%@page import="teamProject.BoardDTO"%>
<%@page import="teamProject.DibsBookDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/bookInfo.css">
 <link rel="stylesheet" href="css/board.css">
<meta charset="UTF-8">
<title>BookInfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">


<style>
#submit_btn {
	display: none;
}
#submit_btn + label {
	display: block;
    background-color: #1b0f04;
    width: 180px;
    height: 42px;
    line-height: 42px;
    border-radius: 7px;
    color: #fff9ed;
    margin-right: 20px;
}
</style>
</head>
<%
	int id = -1;
	if(session.getAttribute("log")!= null){
		 id = (int) session.getAttribute("log");	
	}
	String isbn = request.getParameter("isbn");
	 String isbns[] = isbn.split(" ");
	BoardDAO dao = BoardDAO.getInstance();
	DibsBookDAO ddo = DibsBookDAO.getInstance();
	System.out.println("isbn: "+ isbns[0]);
	boolean check = ddo.getdibs(id, isbns[0]);
	ArrayList<BoardDTO> bto = dao.getBoardDto(isbns[0]); 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	System.out.println(isbn);
	String isbns[] = isbn.split(" ");
%>
<body>

	<div class="wrap">

		<jsp:include page="header.jsp"></jsp:include>

		<div class="container">
			<div class="bookWrap">
				<div class="main"></div>
				<%
			if(id != -1){
		%>

				<form method="post" action="./Service">
					<input type="hidden" name="command" value="DibsBook"> <input
						type="hidden" value="<%=isbns[0]%>" name="isbn">
    	 	
			<form method="post" action="./Service">
				<input type="hidden" name="command" value="DibsBook" >
				<input type="hidden" value="<%=isbns[0]%>" name="isbn">
					<div class="buttons">
						<!-- <input type="submit" value="♡ 찜하기" id="submit_btn"> -->
						<input type="submit" value="" id="submit_btn">
						<label for="submit_btn" class="heart_wrap">♡ 찜하기</label>
					</div>
				</form>
				<%
				
				if(check == true){
					%>
					
					<script>
						$('.heart_wrap').text('♥'); 
						$('.heart_wrap').css('color', 'red'); 
					</script>
					
					<%
				}
			} 
			
			%>
		
		<%
			if(id == -1){
		%>
				<div class="buttons2">
					<button onclick="location.href='subscription.jsp'">구독하기</button>
				</div>
				<%
			}
		%>
				<div class="titles">
					<h3>책 소개</h3>
				</div>
				<br>
				<br>
				<div class="main2"></div>
				<br>
				<br>
				<br>
				<div class="star">
					<div class="starBox">
						<h3>총 별점</h3>
						<p>★★★★☆</p>

						<span class="score">4.3
							<p class="totalScore">/5</p>
						</span>

					</div>


					<br>
					<br>
					<br>
					<div class="titles">고객 리뷰</div>
					<br>
					<br>
					<br>
				</div>

				<table border="1">
					<%	
	if(bto != null){
		
		for(int i = 0; i < bto.size(); i++){
			BoardDTO bodt = bto.get(i);
			System.out.println("log: "+bto.get(i).getLog());
	%>
					<thead>
						<th><%=bodt.getUserId()%></th>
						<th><%=bodt.getContents()%></th>
						<th><%=bodt.getCreatedAt()%></th>
					</thead>
					<%
						
			}
	}
	 %>
				</table>

				<input type="hidden" value="<%=isbn%>" id="isbn">
			</div>
		</div>
	</div>
	<script src="bookApi.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		let isbn = $('#isbn').val();
		getBookForIsbn(isbn);
	});
</script>


</body>
</html>
