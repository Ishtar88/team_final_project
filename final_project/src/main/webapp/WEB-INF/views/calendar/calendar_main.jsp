<%@page import="com.jsr.project.dtos.SpendingDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.jsr.project.dtos.IncomeDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(function(){
		var list=$(".acount_list").children().children();
		
		
		for (var i = 0; i < list.length; i++) {
			list.eq(i).attr("class","item");
		}
		
		list.eq(5).attr("class","active item");
		
	});
	
	function calendar_detail(day){
		var year=document.getElementsByClassName("paramYear")[0].innerHTML;
		var month=document.getElementsByClassName("paramMonth")[0].innerHTML;
		
		if (day<10) {
			day='0'+day;
		}
		if (month<10) {
			month='0'+month;
		}
		
		var search=year+"-"+month+"-"+day;
		
		var url="calendar_detail.do?searchDate="+search;
		var prop="width=800px; height=450px;";
		
		open(url,'',prop);
	}
	
</script>
<%
	/* 	if(lMonth<10){
			month="0"+lMonth;
		} */

	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int lMonth = cal.get(Calendar.MONTH) + 1;
	
	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if (paramMonth != null) {
		lMonth = Integer.parseInt(paramMonth);
	}
	if (lMonth > 12) {
		lMonth = 1;
		year++;
	}
	if (lMonth == 0) {
		lMonth = 12;
		year--;
	}
	String sMonth=null;
	if(lMonth<10){
		sMonth="0"+lMonth;
	}else{
		sMonth=""+lMonth;
	}
	int month=Integer.parseInt(sMonth);
	
	

	cal.set(year, month - 1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<style type="text/css">
.calender {
	width: 800px;
	height: 700px;
}

th {
	width: 30px;
	vertical-align: middle;
	text-align: center;
}

td {
	width: 100px;
	height: 120px;
	cursor: pointer;
	vertical-align: top;
	
}
td>div{
	text-align: center;
}

</style>
</head>
<body>
	<div class="acount_body_wrap">
	<br>
		<header>
				<div class="acount_list">
				 	 <a class="ui olive button" href="goal_main.do">목표관리</a>
					  <a class="ui olive button" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
				 	 <a class="ui olive button" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
				 	 <a class="ui olive button" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
				 	 <a class="ui olive button" href="calendar_main.do?year=<%=year%>&month=<%=month%>">달력</a>
				 </div>
		</header>
	<br>
		<div class="calendar_body">
			<table class="calender ui celled table" border="1">
				<caption>
					<a href="calendar_main.do?year=<%=year - 1%>&month=<%=month%>">◁◁</a> 
					<a href="calendar_main.do?year=<%=year%>&month=<%=month - 1%>">◀</a> 
						<span class="paramYear"><%=year%></span>년<span class="paramMonth"><%=month%></span>월
					<a href="calendar_main.do?year=<%=year%>&month=<%=month + 1%>">▶</a> 
					<a href="calendar_main.do?year=<%=year + 1%>&month=<%=month%>">▷▷</a>
				</caption>
				<c:set var="dayOfWeek" value="<%=dayOfWeek%>" />
				<c:set var="lastDay" value="<%=lastDay%>" />
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<tr>
				<%
					for(int i=0;i<dayOfWeek-1;i++){
						out.print("<td>&nbsp;</td>");
					}
						for(int i=1;i<=lastDay;i++){
						%>
						<td onclick="calendar_detail('<%=i %>')"><p><%=i %></p>
							<div>
							<%
								List<IncomeDto> iList = (List<IncomeDto>) request.getAttribute("iList");
									int date = 0;
									for (IncomeDto iDto : iList) {
										Date regdate = iDto.getI_regdate();
										SimpleDateFormat df = new SimpleDateFormat("dd");
										String dd = df.format(regdate);
										date = Integer.parseInt(dd);
									
									if(date==i){
										%>
												<div>
													<a style="color: blue;"><%=iDto.getI_money()%></a>
												</div>
										<%
										
								}
						}
									
									List<SpendingDto> pList = (List<SpendingDto>) request.getAttribute("pList");
									for (SpendingDto pDto : pList) {
										Date regdate = pDto.getP_regdate();
										SimpleDateFormat df = new SimpleDateFormat("dd");
										String dd = df.format(regdate);
										date = Integer.parseInt(dd);
									
									if(date==i){
										%>
												<div>
													<a style="color: red;">-<%=pDto.getP_money()%></a>
												</div>

										<%
										
								}
						}
					
					%>
							</div>
						</td>
					<%
						if((dayOfWeek-1+i)%7==0){
							%>
								</tr><tr>
							<%
						}
					}
						for(int i=0;i<7-((dayOfWeek-1+lastDay)%7)%7;i++){
							out.print("<td>&nbsp;</td>");
							%>
							<%
						}
						
					%>
				</tr>


			</table>
		</div>
	</div>

</body>
</html>