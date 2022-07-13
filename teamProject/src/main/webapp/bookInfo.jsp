<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookInfo</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bookInfo.css">

</head>
<%
String isbn = request.getParameter("isbn");
%>
<body>
	<div class="wrap">
		<div class="header">
			<p class="logo" onclick="location.href='./index.jsp'">LOGO</p>
			<div class="topMenu">
				<p class="search">
					<img src="image/search.png">
				</p>
				<p class="login">LOGIN</p>
				<p class="join">JOIN</p>
			</div>
		</div>

		<div class="nav">
			<div>
				<p class="menu1">BEST</p>
				<p class="menu2">NEW</p>
				<p class="menu3">HOW TO</p>
				<p class="menu4">ABOUT</p>
			</div>
		</div>
		
	<div class="bookWrap">
	<div class="main">
	</div>
		<div class="buttons">
			<button onclick="location.href='index.jsp'">♡ 찜하기</button>
			<button onclick="location.href='index.jsp'">바로 보기</button>
		</div>
	<div class="titles"> <h3>책 소개</h3></div><br><br>
	<div class="main2"></div><br><br><br>
	<div class ="star">
		<div class="starBox">
		<h3>총 별점</h3>
		<p>★★★★☆</p>
	
		<span class="score">4.2<p class="totalScore">/5</p></span>
	
		</div>
	
	</div>
	<br><br><br>
	<div class="titles"> 고객 리뷰</div><br><br><br>
		
  	<%-- 	   <%
           if(dao.getBoardList().size()>0){
           for(int i=dao.getSize()-1; i>=0; i--){
            	BoardDTO board = dao.getBoardList().get(i);
            	System.out.println(board.getCode());
            %>
            <tbody >
            <tr>
                <td><%=i+1%></td>
                <td><%=board.getTitle()%></td>
                <td><%=board.getContents()%></td>
                <td><%=board.getCreatedAt()%></td>
            </tr>                    
        
          </tbody>
           <% }} %> --%>

<input type="hidden" value="<%=isbn%>" id="isbn">
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
