<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function logout(){
		location.href="logout.do";
	}
</script>
<style type="text/css">
	
	#black {
	height:200px;
	background-color:black;
	}
		
		#title{
		padding:20px;
		color:white;
		font-size: 20px;
	}
	
	#menu{
		color:white;
		float:right;
	}
	
	.menu{
	  padding-right:10px;
	  float:left;
	}
	
	img{
		width:50px;
		height:50px;
	}
	
	#logout{
		position:relative;
	}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>

</head>

<body>
<div id="black">
<div id=title>관리자 페이지입니다.</div> 
<div id="logout"><input type="button" value="로그아웃" onclick="logout()"></div>
<div id = "menu">
	<span class="menu"><a href="manager_home.do"><img src="resources/img/manager_header/HOME.JPG" alt="홈"/><br/>HOME</a></span>
	<span class="menu"><a href="showMember.do"><img src="resources/img/manager_header/member.JPG" alt="회원정보"/><br/>회원정보</a> </span>
	<span class="menu"><a href="manager_product"><img src="resources/img/manager_header/giftbox.JPG" alt="상품정보"/><br/>상품정보</a></span>
	<span class="menu"><a href="manager_customer.do"><img src="resources/img/manager_header/board.JPG" alt="고객센터"/><br/>고객센터</a></span>
</div>
</div>


</body>
</html>