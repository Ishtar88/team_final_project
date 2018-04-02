<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
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

<style type="text/css">

	#block{
		height:100px;
	}

</style>
</head>
<body>
	
	<div class="ui grid">
	  <div class="sixteen wide column" id="block"></div>
	 	<div class="wide column"></div>
	 	
	 		<div class="total_pattern_body">
	 		<div>
				<h2>소비패턴</h2>
				<a href="total_pattern_main.do?sMonth=-2&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>소비패턴에 대한 설명</p>
			</div>
	 	</div>
	 	
	 	<div class="spending_pattern_body">
	 		<div>
				<h2>지출패턴</h2>
				<a href="an_consumption_main.do?sMonth=-2&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>지출패턴에 대한 설명</p>
			</div>
	 	</div>
	 	
	 	<div class="acount_pattern_body">
	 		<div>
				<h2>투자패턴</h2>
				<a href="acount_pattern_main.do?year=<%=year %>&month=<%=month %>"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>투자패턴에 대한 설명</p>
			</div>
			<div class="wide column"></div>
	 	</div>
	 </div>
</body>
</html>