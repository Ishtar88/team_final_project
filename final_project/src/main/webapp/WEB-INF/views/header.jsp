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
// 	Calendar cal=Calendar.getInstance();
// 	int year=cal.get(Calendar.YEAR);
// 	int lMonth=cal.get(Calendar.MONTH)+1;
// 	String month=null;
// 	if(lMonth<10){
// 		month="0"+lMonth;
// 	}
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	
	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if (paramMonth != null) {
		month = Integer.parseInt(paramMonth);
	}
	if (month > 12) {
		month = 1;
		year++;
	}
	if (month == 0) {
		month = 12;
		year--;
	}
%>
<title>Insert title here</title>

</head>
  <style type="text/css">

	body{
	
		margin-left:210px;
	}  
	#purple {background-color:#343DEA;}
	
    .masthead.segment {
      min-height: 50px;
      padding: 1em 0em;
    }
    
    .ui.visible.wide.sidebar.inverted.vertical.menu{
    background-color:#343DEA;
    float:right;
    }
    
    .pusher{
    	position: relative;
    	margin-left:210px;
    	boarder: 1px solid black;
    }
    
    .ui.inverted.button{
		background-color: black;
		color:white;    
    }
   

  </style>
  <!------------------------
  		follow
   ------------------------->
  <script>
  $(document)
    .ready(function() {

      // fix menu when passed
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        })
      ;

      // create sidebar and attach to menu open
      $('.visible.example .ui.sidebar')
      .sidebar({
        context: '.visible.example .bottom.segment'
      })
	    ;
    })
  ;
  </script>
<body>



<!-- Sidebar Menu -->
<div class="ui visible wide sidebar inverted vertical menu">
    <div class="item">
      	<a class="active item" href="home.do">홈</a>
    </div>
    <div class="item">
    <a class="item" href="acount.do">자산관리</a>
    	<div class="menu">
    		<a class="item" href="goal_main.do">목표관리</a>
    		<a class="item" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
    		<a class="item" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
    		<a class="item" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
    		<a class="item" href="calendar_main.do?year=<%=year%>&month=<%=month%>">달력</a>
    	</div>
    </div>
    <div class="item">
    <a class="item" href="analysis_main.do">패턴분석</a>
    	<div class="menu">
    		<a class="item" href="total_pattern_main.do?year=<%=year%>&month=<%=month%>">소비패턴</a>
    		<a class="item" href="an_consumption_main.do">지출패턴</a>
    		<a class="item" href="acount_pattern_main.do?year=<%=year %>&month=<%=month %>">투자패턴</a>
    	</div>
    </div>
    <div class="item">
    <a class="item" href="rewardMain.do">포인트몰</a>
    	<div class="menu">
    		<a class="item" href="#">외식</a>
    		<a class="item" href="#">카페</a>
    		<a class="item" href="#">편의점</a>
    		<a class="item" href="#">문화생활</a>
    	</div>
    </div>
    <div class="item">
    <a class="item" href="customer.do">고객센터</a>
    	<div class="menu">
    		<a class="item" href="notice.do?snum=1&ennum=10">공지 게시판</a>
    		<a class="item" href="qnamain.do?snum=1&ennum=10">Q&A 게시판</a>	
    		<a	class="item" href="#">Contact Us</a>
    	</div>
    </div>
</div>


<div class="pusher" id="white">
    <div class="ui right aligned container">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
        <div class="right item">
          <a class="ui inverted button" href="getUser.do">${loginDto.m_name}님</a>
          <a class="ui inverted button" href="logout.do">로그아웃</a>
        </div>
    </div>
</div>


<!-- Page Contents -->


 





</body>
</html>