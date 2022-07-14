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
		
		<div class="dibsBook">
			<div class="dibBook">
				<div class="bookList">
					<div class="a">
			            <%
						DibsBookDAO dao = DibsBookDAO.getInstance();
						
			            System.out.println("getSize: " + dao.getSize());
						if(dao.getDibsBookDto().size() > 0) {
							for(int i=0; i<dao.getSize(); i++) {
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