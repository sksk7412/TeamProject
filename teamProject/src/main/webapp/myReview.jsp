<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>MyReview</title>
</head>
<body>
	<div class="wrap">

		<div class="boardTop">
		<p class="title"></p>
		<a href= './review' target="_top">
		<input type="button" class="allView" value="전체보기">
		</a>
		</div>
		<table class="reviewTable">
            <tbody>
            <tr>
                <td>image</td>
                <td>title</td>
                <td>autors</td>
                <td>
                <a href= './write' target="_top">
                <button class="writeBtn">리뷰쓰기</button></a>
                </td>
            </tr>                    
        
          </tbody>
		</table>
	</div>
</body>
</html>