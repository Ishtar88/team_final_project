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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/assets/semantic.min.js"></script>

<%
//         Calendar cal=Calendar.getInstance();
//         int year=cal.get(Calendar.YEAR);
//         int lMonth=cal.get(Calendar.MONTH)+1;
//         String month=null;
//         if(lMonth<10){
//                     month="0"+lMonth;
//         }
            
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
            
            cal.set(year, month - 1, 1);
            int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
            int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            
%>
<title>Insert title here</title>

</head>
  <style type="text/css">

   body{
           		  margin-left:240px;
 			     } 
   
   #purple {background-color:#343DEA;}
            
    .ui.visible.wide.sidebar.inverted.vertical.menu{
    background-color:#343DEA;
    width:210px;
    float:right;
   
    }
   
    .pusher{
            position: relative;
            background-color:white;
            height:0px;
            width:100%;
            margin-left: 10px;
    }
  
 	.right.item{
 		margin-left:1200px;
 		margin-top:10px;
 		left: 80%;
 	}
 	
 	
   
/*     #purplebr{ */
/*     		position: relative; */
/*     		top:50px; */
/*     		left:0px; */
/*             background-color:#343DEA; */
/*             width:100%; */
/*             height:5px; */
            
/*     } */
    
    #logo{
    	margin-top:-5px;
    	width:50px;
    	height:50px;
    	float:left;
    }
 
  
  .ui.grid{
  	position:relative;
  	top:50px;
  }

  </style>
  <!------------------------
                        follow
   ------------------------->
  <script>
//   $(document)
//     .ready(function() {
    	
//     	$(ui.grid).

      // fix menu when passed

  </script>
<body>



<!-- Sidebar Menu -->
<div class="ui visible wide sidebar inverted vertical menu">
    <div class="item">
            <a class="active item" href="home.do">홈</a>
    </div>
    <div class="item">
    	<a class="item" href="getUser.do">MY PAGE</a>
    </div>
    
    
    <div class="item">
    <a class="item" href="acount.do?year=<%=year%>&month=<%=month%>">자산관리</a>
            <div class="menu">
                        <a class="item" href="goal_main.do?year=<%=year%>&month=<%=month%>">목표관리</a>
                        <a class="item" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
                        <a class="item" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
                        <a class="item" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
                        <a class="item" href="calendar_main.do?year=<%=year%>&month=<%=month%>">달력</a>
            </div>
    </div>


    <div class="item">
    <a class="item" href="analysis_main.do?year=<%=year%>&month=<%=month%>">패턴분석</a>
            <div class="menu">
                        <a class="item" href="total_pattern_main.do?sMonth=-2&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>&menu=aMonth">소비패턴</a>
                        <a class="item" href="an_consumption_main.do?sMonth=-2&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>&menu=aMonth">지출패턴</a>
                        <a class="item" href="acount_pattern_main.do?year=<%=year %>&month=<%=month %>&lastDay=<%=lastDay%>">투자패턴</a>
            </div>
    </div>


    <div class="item">
    <a class="item" href="rewardMain.do?year=<%=year%>&month=<%=month%>">포인트몰</a>
             <div class="menu">
                        <a class="item" href="listOfCategory.do?r_detail=외식&sNum=1&eNum=8">외식</a>
                        <a class="item" href="listOfCategory.do?r_detail=카페&sNum=1&eNum=8">카페</a>
                        <a class="item" href="listOfCategory.do?r_detail=편의점&sNum=1&eNum=8">편의점</a>
                        <a class="item" href="listOfCategory.do?r_detail=문화생활&sNum=1&eNum=8">문화생활</a>
            </div>
    </div>
 
 
    <div class="item">
    <a class="item" href="customer.do?snum=1&ennum=10">고객센터</a>
            <div class="menu">
                        <a class="item" href="notice.do?snum=1&ennum=10">공지 게시판</a>
                        <a class="item" href="qnamain.do?snum=1&ennum=10">Q&A 게시판</a>    
            </div>
    </div>


	<div class="item">
   		<a class="item" href="logout.do">로그아웃</a>
	</div>


 </div>
    





<!-- Page Contents -->


 





</body>
</html>