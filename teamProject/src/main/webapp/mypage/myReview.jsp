<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/library.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Song+Myung&display=swap" rel="stylesheet">
<title>MyReview</title>
</head>
<body>
	<div class="boardWrap">
		<div class="boardTop">
		<h2>작성 가능한 리뷰</h2>
		<input type="button" class="allView" value="전체보기">
		</div>
		<table class="reviewTable">
            <tbody>
            <tr>
                <td>image</td>
                <td>title</td>
                <td>autors</td>
                <td>
                <button class="writeBtn" onclick="mypage/review.js">리뷰쓰기</button>
                </td>
            </tr>                    
        
          </tbody>
		</table>
	</div>
</body>
</html>