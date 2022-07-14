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
	<div class="wrap">
        <jsp:include page="header.jsp"></jsp:include>
		
		<script>
			let name = "";
			let isbn = "";
		</script>
		
		<div class="dibsBook">
			<div class="dibBook">
				<div class="bookList2">
					
			            <%
						DibsBookDAO dao = DibsBookDAO.getInstance();
					
						if(dao.getDibsBookDto().size() > 0) {
							//System.out.println(dao.getSize());
							
							
							for(int i=0; i<dao.getSize(); i++){
								
								DibsBookDTO dto = dao.getDibsBookDto().get(i);
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
						
			        	<div class="dibsBookContents">	</div>
			    	
				</div>
			</div>
		</div>            
     </div>
</body>
</html>