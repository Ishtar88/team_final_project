<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.pusher{
		background-color: #343DEA;
	}
</style>
</head>
<body>
		<!-- 상단 메뉴바 -->
		<div class="pusher">
		  <div class="ui inverted vertical masthead center aligned segment">
		    <div class="ui container">
		      <div class="ui large secondary inverted pointing menu">
		        <a class="toc item">
		          <i class="sidebar icon"></i>
		        </a>
		    <a class="active item" href="home.do">홈</a>
		    <a class="item" href="acount.do">자산관리</a>
		    <a class="item">패턴분석</a>
		    <a class="item">포인트몰</a>
		    <a class="item">고객센터</a>
		        <div class="right item">
		          <a class="ui inverted button">로그인</a>
		          <a class="ui inverted button">회원가입</a>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>