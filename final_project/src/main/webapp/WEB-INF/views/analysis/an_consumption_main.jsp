<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;

	cal.set(year, month - 1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	window.onload = function() {

		var chart1 = new CanvasJS.Chart(
				"chartContainers1",
				{
					animationEnabled : true,
					zoomEnabled : true,
					theme : "light2",
					// 		title:{
					// 			text:
					// 		},
					axisX : {
						title : "원에 포인터를 갖다대보세요!",
						suffix : "%",
						minimum : 0,
						maximum : 61,
						gridThickness : 1
					},
					axisY : {
						title : "Agricultural Land (million sq.km)",
						suffix : "mn"
					},
					data : [ {
						type : "bubble",
						toolTipContent : "<b>{name}</b><br/>Employment: {x}% <br/> Agri-Land: {y}mn sq. km<br/> 유형: {z}%",
						dataPoints : [ {
							x : 10,
							y : 5.225,
							z : 200,
							name : "자기계발형"
						}, {
							x : 20,
							y : 7.17,
							z : 200,
							name : "생활중심형"
						}, {
							x : 30,
							y : 4.043,
							z : 200,
							name : "유흥중심형"
						}, {
							x : 40,
							y : 9.647,
							z : 200,
							name : "쇼핑중심형"
						}, ]
					} ]
				});
		chart1.render();

		var chart5 = new CanvasJS.Chart("chartContainers5", {
			animationEnabled : true,
			exportEnabled : true,
			theme : "light1", // "light1", "light2", "dark1", "dark2"
			title : {
				text : "Simple Column Chart with Index Labels"
			},
			data : [ {
				type : "column", //change type to bar, line, area, pie, etc
				//indexLabel: "{y}", //Shows y value on all Data Points
				indexLabelFontColor : "#5A5757",
				indexLabelPlacement : "outside",
				dataPoints : [ {
					x : 10,
					y : 71
				}, {
					x : 20,
					y : 55
				}, {
					x : 30,
					y : 50
				}, {
					x : 40,
					y : 65
				}, {
					x : 50,
					y : 92,
					indexLabel : "Highest"
				}, {
					x : 60,
					y : 68
				}, {
					x : 70,
					y : 38
				}, {
					x : 80,
					y : 71
				}, {
					x : 90,
					y : 54
				}, {
					x : 100,
					y : 60
				}, {
					x : 110,
					y : 36
				}, {
					x : 120,
					y : 49
				}, {
					x : 130,
					y : 21,
					indexLabel : "Lowest"
				} ]
			} ]
		});
		chart5.render();

	}
</script>
<style type="text/css">
#counsumption_pattern {
	border: 1px;
	margin-left: 100px;
	width: 300px;
	height: 300px;
	float: left;
	background-color: gray;
	color: black;
}

#patternDetail {
	margin-left: 100px;
	border-collapse: collapse;
	width: 1000px;
	height: 400px;
}

#variousGraph {
	margin-left: 100px;
	border-collapse: collapse;
	width: 1000px;
	height: 400px;
}

#recommend {
	margin-left: 100px;
	border-collapse: collapse;
	width: 1000px;
	height: 400px;
}
</style>
</head>

<body>
	<div class="ui secondary pointing menu">
		<a class="active item"
			href="an_consumption_main.do?sMonth=-2&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>">
			지난달 </a> <a class="item"
			href="an_consumption_main.do?sMonth=-4&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>">
			최근3개월 </a> <a class="item"
			href="an_consumption_main.do?sMonth=-7&eMonth=-1&year=<%=year%>&month=<%=month%>&lastDay=<%=lastDay%>">
			최근6개월 </a>
	</div>

	<table id="type1" class="ui unstackable table">
		<tr>
			<td><img alt="유형 이미지" src="" /></td>
			<td><p></p></td>
		</tr>
	</table>

	<!--카테고리별 best순위 -->
	<div id="chartContainers1" style="height: 370px; width: 50%;"></div>

	<table id="type1" class="ui unstackable table">
		<c:forEach items="${categoryList}" var="sdto">
			<tr>
			<td>${sdto.rownum}</td>
				<td>${sdto.p_name}</td>
			</tr>
		</c:forEach>
	</table>
	<!--카테고리별 상세내역  -->
	<div id="chartContainers5" style="height: 100%; width: 100%;"></div>

<table id="type1" class="ui unstackable table">
<tr>
<th>카테고리</th>
<th>총액</th>
<th>비율</th>
</tr>
		<c:forEach items="${categoryList}" var="sdto">
			<tr>
				<td>${sdto.p_name}</td>
				<td>${sdto.total}</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>