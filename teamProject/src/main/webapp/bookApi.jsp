<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<form>
		<input type="text" id="input"> <input type="button"
			id="submit" onclick="search(form)">
	</form>
	<div class="result"></div>
	<script src="bookApi.js"></script>
</body>
</html>