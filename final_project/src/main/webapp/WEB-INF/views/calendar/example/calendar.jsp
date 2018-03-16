<%-- <%@page import="java.util.Calendar"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#calendar{border:1px solid gray; border-collapse: collapse;}
	#calendar th{width: 80px; border:1px solid gray;}
	#calendar td{width: 80px; height:80px; border:1px solid gray; text-align: left; vertical-align: top;}
	a{text-decoration: none;}
</style>
<title>Insert title here</title>
</head>
<%
	String paramYear=request.getParameter("year");
	String paramMonth=request.getParameter("month");

	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	
	if(paramYear!=null){
		year=Integer.parseInt(paramYear);
	}
	if(paramMonth!=null){
		month=Integer.parseInt(paramMonth);
	}
	if(month>12){
		month=1;
		year++;
	}
	if(month==0){
		month=12;
		year--;
	}
	
	cal.set(year, month-1, 1);
	int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
	int lastDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);

%>
<body>
<h1>달력</h1>
<table id="calendar" class="table table-striped">
	<caption>
		<a href="calendar.jsp?year=<%=year-1%>&month=<%=month%>">◁◁</a>
		<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
		<a href="CalController.do?command=calendar"><span><%=year %></span>년<span><%=month %></span>월</a>
		<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
		<a href="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▷▷</a>
	</caption>
	<tr>
		<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
	</tr>
	<tr>
<%

	for(int i=0;i<dayOfWeek-1;i++){
		out.print("<td>&nbsp;</td>");
	}

	for(int i=1;i<=lastDay;i++){
		
		%>
		<td>
			<a href="CalController.do?command=detailCalBoard&year=<%=year %>&month=<%=month %>&date=<%=i %>" style="color: <%=fontColor(dayOfWeek,i)%>"><%=i %></a>
			<a href="insertCalBoard.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastDay=<%=lastDay%>">
			<img src="img/pen.png" alt="일정추가" style="width: 15px; height: 15px;"/>
			</a>
		</td>
		
		<%
		if((dayOfWeek-1+i)%7==0){
			out.print("<tr></td>");
		}
		
	}
	
	for(int i=0;i<(7-((dayOfWeek-1+lastDay)%7)%7);i++){
		out.print("<td>&nbsp;</td>");
	}
	

%>
		

		

	</tr>
</table>
</body>
</html> --%>