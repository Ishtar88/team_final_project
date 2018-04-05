<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>

<style type="text/css">

#cat01{
	z-index: -100;
	position: absolute;
	background-size: cover;
}

#cat01 >  h3{
	position:relative;
	font-size:2em;
	color:white;
	text-shadow: 1px 2px 1px black;
	line-height:600px; 
	text-align: center;
	text-transform: uppercase;
	left: 100px;
	top:-50px;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<head>
	<title>HOME</title>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

<img src="resources/background-image/saving_money.jpg" alt="cat" id="cat01">
<section id="cat01">	
	<h3>캐시 매니저에 오신것을 환영합니다.</h3>
</section>

</body>
</html>
