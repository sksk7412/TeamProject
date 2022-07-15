
<%@page import="java.util.ArrayList"%>
<%@page import="teamProject.BoardDAO"%>
<%@page import="teamProject.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/bookInfo.css">
<meta charset="UTF-8">
<title>BookInfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">

</head>
<%
	int id = -1;
	if(session.getAttribute("log")!= null){
		 id = (int) session.getAttribute("log");	
	}
	String isbn = request.getParameter("isbn");
	String isbns[] = isbn.split(" ");
%>
<body>

	<div class="wrap">
	
		<jsp:include page="header.jsp"></jsp:include>		
	
	<div class="container">
	<div class="bookWrap">
	<div class="main">
	</div>
		<%
			if(id != -1){
				// 선주형 바보 
		%>
    	 	
			<form method="post" action="./Service">
				<input type="hidden" name="command" value="DibsBook" >
				<input type="hidden" value="<%=isbns[0]%>" name="isbn">
					<div class="buttons">
			       		<input type="submit" value="♡ 찜하기"><br>
			       	</div>
			</form>
			<button onclick="location.href='index.jsp'">바로 보기</button>
		<%
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
	<div class="titles"> <h3>책 소개</h3></div><br><br>
	<div class="main2"></div><br><br><br>
	<div class ="star">
		<div class="starBox">
		<h3>총 별점</h3>
		<p>★★★★☆</p>
	
		<span class="score">4.2<p class="totalScore">/5</p></span>
	
		</div>
	
	
	<br><br><br>
	<div class="titles"> 고객 리뷰</div><br><br><br>
	</div>
		
	  		<%
				BoardDAO dao = BoardDAO.getInstance();
	  		
				System.out.println("log: " + log);
				System.out.println("1111111: " + dao.getDibsBookDto(log).size());
				System.out.println("2222: : " + dao.getSize(log));
				if(dao.getDibsBookDto(log).size() > 0) {
					for(int i=0; i < dao.getSize(log); i++){
						DibsBookDTO dto = dao.getDibsBookDto(log).get(i);
						String a = dto.getIsbn();
			%>
							
				<input type="hidden" value="<%=dto.getIsbn()%>" id="isbn" class="isbn<%=i %>">
				       <script>
				             name = '.isbn' + <%=i%>;
					         isbn = $(name).val();
					         getBookForIsbn(isbn);
				       </script>
				 <%
					}
				}
			%>

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