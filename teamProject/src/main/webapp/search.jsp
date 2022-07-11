<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSearch</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
            
      </div>
	<form>
		<input type="text" id="input">
		<input type="button" id="submit" onclick="search(form)">
	</form>
	<div class="result"></div>
	<script src="bookApi.js"></script>
</body>
</html>