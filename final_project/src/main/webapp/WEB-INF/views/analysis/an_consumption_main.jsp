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
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script>
	window.onload = function() {

		var year = $("input[name=year]").val();
		var month = $("input[name=month]").val();
		var lastDay = $("input[name=lastDay]").val();
		var sMonth = $("input[name=sMonth]").val();
		var eMonth = $("input[name=eMonth]").val();

		$.ajax({

			url : "an_consumption_main_ajax.do",
			type : "post",
			data : "year=" + year + "&month=" + month + "&lastDay=" + lastDay
					+ "&sMonth=" + sMonth + "&eMonth=" + eMonth,
			datetype : "json",
			success : function(obj) {
				
				var list = obj["spendAnalysis"];
				var arrayList = [];
				for (var i = 0; i < list.length; i++) {
					arrayList.push({
						y : list[i].sum_money,
						label : list[i].analysis
					});
				}

				var chart2 = new CanvasJS.Chart("chartContainer2", {
					theme : "light2",
					animationEnabled : true,
					title : {
						text : "Shares of Electricity Generation by Fuel"
					},
					subtitles : [ {
						text : "United Kingdom, 2016",
						fontSize : 16
					} ],
					data : [ {
						type : "pie",
						indexLabelFontSize : 18,
						radius : 80,
						indexLabel : "{label} - {y}",
						yValueFormatString : "###0\"\"",
						click : explodePie,
						dataPoints : arrayList
					} ]
				});
				chart2.render();

				function explodePie(e) {
					for (var i = 0; i < e.dataSeries.dataPoints.length; i++) {
						if (i !== e.dataPointIndex)
							e.dataSeries.dataPoints[i].exploded = false;
					}
				}
			}

		});

		$.ajax({
			url : "an_consumption_main_ajax.do",
			type : "post",
			data : "year=" + year + "&month=" + month + "&lastDay=" + lastDay
					+ "&sMonth=" + sMonth + "&eMonth=" + eMonth,
			datetype : "json",
			success : function(obj) {

				var list = obj["categoryList"];
				var arrayList = [];
				for (var i = 0; i < list.length; i++) {
					arrayList.push({
						label : list[i].p_name,
						y : list[i].total
					});
				}
				var chart = new CanvasJS.Chart("chartContainer", {

					animationEnabled : true,
					theme : "light2", // "light1", "light2", "dark1", "dark2"
					title : {
						text : "카테고리별 지출"
					},
					axisY : {
						title : "지출액 (원)",
						suffix : "",
						includeZero : false
					},
					axisX : {
						title : "카테고리"
					},
					data : [ {
						type : "column",
						yValueFormatString : "#,##0.0#\"\"",
						dataPoints : arrayList
					} ]
				});
				chart.render();

			}
		});

	}
</script>
<style type="text/css">
img {
	width: 150px;
	height: 200px;
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

	<input type="hidden" name="year" value="<%=year%>" />
	<input type="hidden" name="month" value="<%=month%>" />
	<input type="hidden" name="lastDay" value="<%=lastDay%>" />
	<input type="hidden" name="sMonth" value="${sMonth}" />
	<input type="hidden" name="eMonth" value="${eMonth}" />

	<table id="type1" class="ui unstackable table">
		<tr>
			<td><img alt="유형 이미지" src="${aDto3.a_img}" /></td>
			<td>${aDto3.a_name}<p>${aDto3.a_detail}</p></td>
		</tr>
	</table>

	<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

	<!--카테고리별 상세내역  -->
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>

	<table id="type1" class="ui unstackable table">
		<tr>
			<th>순위</th>
			<th>카테고리</th>
			<th>금액</th>
			<th>비율</th>
		</tr>
		<c:forEach items="${categoryList}" var="sdto">
			<tr>
				<td>${sdto.rownum}</td>
				<td class="p_name">${sdto.p_name}</td>
				<td class="total"><f:formatNumber value="${sdto.total}"
						type="number" /></td>
				<td><f:formatNumber value="${sdto.total/total_spending*100}"
						pattern="0.00" />%</td>
			</tr>
		</c:forEach>
	</table>

	<table class="ui unstackable table">

		<tr>
			<td>평균 소비신중도</td>
			<td><c:choose>
					<c:when test="${carefulSpending eq '0'}">
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${carefulSpending eq '1'}">
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${carefulSpending eq '2'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${carefulSpending eq '3'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${carefulSpending eq '4'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:otherwise>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td><img alt="유형 이미지" src="${aDto1.a_img}" /></td>
			<td>${aDto1.a_name}<p>${aDto1.a_detail}</p></td>
		</tr>

		<tr>
			<td>평균 소비만족도</td>
			<td><c:choose>
					<c:when test="${satisfySpending eq '0'}">
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${satisfySpending eq '1'}">
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${satisfySpending eq '2'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${satisfySpending eq '3'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:when test="${satisfySpending eq '4'}">
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star outline icon"></i>
					</c:when>
					<c:otherwise>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
						<i class="star icon"></i>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td><img alt="유형 이미지" src="${aDto2.a_img}" /></td>
			<td>${aDto2.a_name}<p>${aDto2.a_detail}</p></td>
		</tr>
	</table>




</body>
</html>