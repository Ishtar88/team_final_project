<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.Calendar"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#purple {
	background-color: #343DEA;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>

<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int lMonth=cal.get(Calendar.MONTH)+1;
	String month=null;
	if(lMonth<10){
		month="0"+lMonth;
	}
%>
<title>Insert title here</title>

</head>

<body>

	<!-- 상단 메뉴바 -->
	<div class="pusher">
		<div class="ui inverted vertical masthead center aligned segment"
			id="purple">
			<div class="ui container">
				<div class="ui large secondary inverted pointing menu">

					<div class="ui simple dropdown item">
						<a class="item" href="home.do"> 홈</a>
					</div>
					<div class="ui simple dropdown item">
						<a class="item" href="acount.do">자산관리</a> <i class="dropdown icon"></i>
						<div class="menu">
							<a class="item"  href="goal_main.do"> 목표관리 </a> 
							<a class="item" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
			    			<a class="item" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
			   				 <a class="item" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
			   				 <a class="item" href="calendar_main.do?year=<%=year%>&month=<%=month%>">달력</a>
						</div>
					</div>
					<div class="ui simple dropdown item">
						<a class="item" href="analysis_main.do">패턴분석</a> <i
							class="dropdown icon"></i>
						<div class="menu">
							<a class="item" href="analysis_main.do">패턴분석 홈</a> 
							<a class="item">수익패턴</a> 
							<a class="item" href="an_consumption_main.do">지출패턴</a> 
							<a	 class="item">투자패턴</a>
						</div>
					</div>
					<div class="ui simple dropdown item">
						<a class="item" href="customer.do">고객센터</a> <i
							class="dropdown icon"></i>
						<div class="menu">
							<a class="item" href="notice.do"> 공지 게시판</a> 
							<a 	class="item" href="qnamain.do">QNA 게시판</a>
						     <a	class="item" href="#">Contact Us</a>
						</div>
					</div>
					<div class="right item">
						<a class="ui inverted button" href="getUser.do">${loginDto.m_name}님</a>
						<a class="ui inverted button" href="logout.do">로그아웃</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>