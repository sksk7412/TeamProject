<%@page import="teamProject.DibsBookDAO"%>
<%@page import="teamProject.DibsBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<script src="bookApi.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <p class="logo">LOGO</p>
            <div class="topMenu">
                <p class="search"><img src="image/search.png"></p>
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
		
		<div class="dibsBook">
			<div class="dibBook">
				<div class="bookList">
					<div class="a">
			            <%
						DibsBookDAO dao = DibsBookDAO.getInstance();
					
						if(dao.getDibsBookDto().size() > 0) {
							for(int i=0; i<dao.getSize(); i++){
								DibsBookDTO dto = dao.getDibsBookDto().get(i);
								String a = dto.getIsbn();
						%>
						<input type="hidden" value="<%=a%>" id="isbn">
			                <div class="dibsBookContents"></div>
			            <%
							}
						}
						%>
			    	</div>
				</div>
			</div>
		</div>
     </div>
     
    <script type="text/javascript">
		$(document).ready(function() {
				let isbn = $('#isbn').val();
				getBookForIsbn(isbn);		
		});
	</script>
</body>
</html>