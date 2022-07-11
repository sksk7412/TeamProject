<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String url = request.getParameter("url");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String thumbnail = request.getParameter("thumbnail");
		
	%>
	
	<tr>
			<td><%=url%></td>
			<td><%=title%></td>	
			<td><%=contents%></td>
			<td><%=thumbnail%></td>		
	</tr>
	
	 <div class="buttons">
  
           <!-- <input type="button" onclick="location.href='form_agree.jsp'" value="회원가입"> --> 
              <input type="button" onclick="./like" value="♡ 찜하기">
            <!-- <input type="button"  onclick="check(form)" value="로그인" > -->
            <input type="submit" value="구매하기" >
      </div>
	
</body>
</html>