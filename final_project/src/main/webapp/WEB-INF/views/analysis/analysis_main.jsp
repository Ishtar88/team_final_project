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
%>
</head>
<body>
<div>
	<div class="analy_search">
		<span>1개월</span>
		<span>3개월</span>
		<span>6개월</span>
	</div>
	
	<div class="income_searchDate">
		 <a href="income_main.do?year=<%=year-1%>&month=<%=month%>" >◁◁</a>
		 <a href="income_main.do?year=<%=year%>&month=<%=month-1%>" >◀</a>
		 	  	<span class="income_year"><%=year%>년 </span>
		 	  	<span class="income_month"><%=month%>월</span>
		 <a href="income_main.do?year=<%=year%>&month=<%=month+1%>" >▶</a>
		 <a href="income_main.do?year=<%=year+1%>&month=<%=month%>" >▷▷</a>
	 </div>
	 
	 <div>
	 	<div class="spending_img">
	 		<img alt="소비패턴 이미지" src="">
	 	</div>
	 	<div class="total_pattern_body">
	 		<div>
				<h2>소비패턴</h2>
				<a href="#"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>소비패턴에 대한 설명</p>
			</div>
	 	</div>
	 	
	 	<div class="spending_pattern_body">
	 		<div>
				<h2>지출패턴</h2>
				<a href="#"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>지출패턴에 대한 설명</p>
			</div>
	 	</div>
	 	
	 	<div class="acount_pattern_body">
	 		<div>
				<h2>투자패턴</h2>
				<a href="acount_pattern_main.do"><span>자세히보기</span></a>
	 		</div>
			<div>
				<p>투자패턴에 대한 설명</p>
			</div>
	 	</div>
	 </div>
</div>
</body>
</html>