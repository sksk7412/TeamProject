<%@page import="teamProject.UserDAO"%>
<%@page import="teamProject.DibsBookDAO"%>
<%@page import="teamProject.DibsBookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link rel="stylesheet" href="css/books.css">
<script src="bookApi.js"></script>
<title>Dibs</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<%
	if(session.getAttribute("log")!=null) {
	int log = (int)session.getAttribute("log");
	%>
	<div class="wrap">
       <%--  <jsp:include page="header.jsp"></jsp:include> --%>
		
		<script>
			let name = "";
			let isbn = "";
		</script>
		<!-- <h2>찜한 목록</h2> -->
		<div class="dibsBook">
			<div class="dibBook">
				<div class="bookList2">
					
			            <%
						DibsBookDAO dao = DibsBookDAO.getInstance();
			            
						if(dao.getDibsBookDto(log).size() > 0) {
							for(int i=0; i < dao.getSize(log); i++){
								DibsBookDTO dto = dao.getDibsBookDto(log).get(i);
								String a = dto.getIsbn();
								out.println("isbn: " + a);
						%>
						
						<input type="hidden" value="<%=dto.getIsbn()%>" id="isbn" class="isbn<%=i %>">
			                <script>
			                	name = '.isbn' + <%=i%>;
				                isbn = $(name).val();
				                getBookForIsbn(isbn);
			                </script>
			            <!-- <input type="button" value="삭제"> -->
			            <%
							}
						}
						%>
						
			        	<div class="dibsBookContents">
			        		<form class="results" action="./Service">
			        			<input type="hidden" name="command" value="deleteDibs">
			        		</form>
			        	</div>
			    	
				</div>
			</div>
		</div>            
     </div>
     <%
	}
     %>
</body>
</html>