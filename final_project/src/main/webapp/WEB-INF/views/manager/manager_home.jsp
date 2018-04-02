<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<style type="text/css">


section {
	position: absolute;
	background-color:black;
	width: 100%;
	margin: 0;
	padding: 0px;
	height: 1300px;
}
 .bg {
	background: url('resources/img/business2.jpg') no-repeat center;
	background-size: cover;
}

section h1 {
 	position: absolute; 
	top: 30%;
	left: 70%;
}

.home_menu{
	position: absolute;
	top:52%;
	left:70%;
	color:black;
	
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지에 오신 것을 환영합니다.</title>
</head>
<body>
	<section class="bg">
			<h1>
				업계 최고의 자부심.<br> 그에 걸맞는 가치를 제공합니다. <br> <br> <br>
				직원의 행복을 최선의 가치로 삼는 기업.<br> JSR 컴퍼니가 여러분과 함께합니다.
			</h1>
			<div class="home_menu">
			<button class="ui  inverted blue button"><a href="manager_home.do">HOME</a></button>
			<button class="ui  inverted blue button"><a href="getAllMember.do">회원정보</a></button>
			<button class="ui  inverted blue button"><a href="rewardList.do">상품정보</a></button>
			<button class="ui  inverted blue button"><a href="manager_customer.do">고객센터</a></button>
			</div>
					
	</section>
</body>
</html>