<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>

<style type="text/css">

img{
	z-index: -1;
	position: absolute;
}

#cat01 > h2{
	position:relative;
	font-size:4em;
	color:white;
	text-shadow: 1px 2px 1px black;
	line-height:600px; 
	text-align: center;
	text-transform: uppercase;
	margin-left: 600px;
	margin-top:50px;
}

#cat01 > h3{
	position:relative;
	font-family:'Malgun Gothic';
	font-size:1.3em;
	color:white;
	line-height:0px; 
	text-align: center;
	text-transform: uppercase;
	margin-left: 600px;
	margin-top:-250px;
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

<img src="resources/background-image/catisthebest.jpg" alt="cat">
<section id="cat01">	
	<h2>고양이는 최고시다</h2>
	<h3>그분들의 알흠다움을 알아서 받들어 모셔라</h3>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
