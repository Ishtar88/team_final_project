<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
window.onload = function () {
	
	var spend_ratio=parseFloat($("#spend_ratio").text());
	var invest_ratio=parseFloat($("#invest_ratio").text());

var chart1 = new CanvasJS.Chart("chartContainer1", {
	
	animationEnabled: true,
	title:{
		text: "Email Categories",
		horizontalAlign: "left"
	},
	data: [{
		type: "doughnut",
		startAngle: 60,
		//innerRadius: 60,
		indexLabelFontSize: 17,
		indexLabel: "{label} - #percent%",
		toolTipContent: "<b>{label}:</b> {y} (#percent%)",
		dataPoints: [
			{ y: invest_ratio, label: "투자" },
			{ y: spend_ratio, label: "지출" }
		]
	}]
});
chart1.render();



//------------------------------------

var year=$("input[name=year]").val();
var month=$("input[name=month]").val();

		$.ajax({
			url : "total_pattern_main_ajax.do",
			type : "post",
			data : "year=" + year + "&month=" + month,
			datetype : "json",
			success : function(obj) {
// 				alert(obj["GSList"][0]["p_name"]);
// 				alert(obj["GSList"][0]["g_name"]["g_money"]);
// 				alert(obj["GSList"][0]["p_money"]);
				var list=obj["GSList"];
				var list2=obj["spendMinusGoal"];
				var list3=obj["goalMinusSpend"];
				var arrayList1=[];
				var arrayList2=[];
				arrayList1.push({ label:"total", y:obj["total_goal"] });
				arrayList2.push({ label:"total", y:obj["total_spending"] });
				for (var i = 0; i < list.length; i++) {
					arrayList1.push({ label:list[i].p_name, y:list[i].g_name.g_money });
					arrayList2.push({ label:list[i].p_name, y:list[i].p_money });
				}
				for (var i = 0; i < list3.length; i++) {
					arrayList1.push({ label:list3[i].g_name, y:list3[i].g_money });
					arrayList2.push({ label:list3[i].g_name, y:0});
				}
				for (var i = 0; i < list2.length; i++) {
					arrayList1.push({ label:list2[i].p_name, y:0});
					arrayList2.push({ label:list2[i].p_name, y:list2[i].p_money });
				}

					var chart2 = new CanvasJS.Chart("chartContainer2", {
						exportEnabled: true,
						animationEnabled: true,
						title:{
							text: "Car Parts Sold in Different States"
						},
						subtitles: [{
							text: "Click Legend to Hide or Unhide Data Series"
						}], 
						axisX: {
							title: "States"
						},
						axisY: {
							title: "예산 - Units",
							titleFontColor: "#4F81BC",
							lineColor: "#4F81BC",
							labelFontColor: "#4F81BC",
							tickColor: "#4F81BC"
						},
						axisY2: {
							title: "지출 - Units",
							titleFontColor: "#C0504E",
							lineColor: "#C0504E",
							labelFontColor: "#C0504E",
							tickColor: "#C0504E"
						},
						toolTip: {
							shared: true
						},
						legend: {
							cursor: "pointer",
							itemclick: toggleDataSeries
						},
						data: [{
							type: "column",
							name: "예산",
							showInLegend: true,      
							yValueFormatString: "#,##0.# Units",
							dataPoints:arrayList1
						},
						{
							type: "column",
							name: "지출",
							axisYType: "secondary",
							showInLegend: true,
							yValueFormatString: "#,##0.# Units",
							dataPoints:arrayList2
						}]
					});
					chart2.render();

					function toggleDataSeries(e) {
						if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
							e.dataSeries.visible = false;
						} else {
							e.dataSeries.visible = true;
						}
						e.chart.render();
					}	

			}
		});
		

}
</script>
</head>
<body>
	<div id="chartContainer1" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

	<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
</head>
<body>
	<a href="#">1개월</a>
	<a href="#">3개월</a>
	<a href="#">6개월</a>
	<input type="hidden" name="year" value="<%=year%>"/>
	<input type="hidden" name="month" value="<%=month%>"/>
	<table border="1">
		<tr>
			<td>총 지출액</td>
			<td colspan="2"><f:formatNumber value="${total_spending}"
					type="number" /></td>
		</tr>
		<tr>
			<td>지출부분</td>
			<td id="spend_ratio"><f:formatNumber
					value="${expense_spending/total_spending*100}" pattern="0.00" /></td>
			<td><f:formatNumber value="${expense_spending}" type="number" /></td>
		</tr>
		<tr>
			<td>투자/저축부분</td>
			<td id="invest_ratio"><f:formatNumber
					value="${invest_spending/total_spending*100}" pattern="0.00" /></td>
			<td><f:formatNumber value="${invest_spending}" type="number" /></td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>목표달성률</td>
			<td colspan="2">${goal_ratio}%</td>
		</tr>
		<tr>
			<td>총 예산</td>
			<td colspan="2"><f:formatNumber value="${total_goal}"
					type="number" /></td>
		</tr>
		<tr>
			<td>총 지출액</td>
			<td colspan="2"><f:formatNumber value="${total_expense}"
					type="number" /></td>
		</tr>
		
	</table>
	<table border="1">
	<tr>
			<td colspan="3">카테고리별 상세내역</td>
		</tr>
		<tr>
			<td></td>
			<td>예산</td>
			<td>지출</td>
		</tr>
		<c:forEach items="${GSList}" var="sdto">
			<tr>
				<td>${sdto.p_name}</td>
				<td><f:formatNumber value="${sdto.g_name.g_money}"
					type="number" /></td>
				<td><f:formatNumber value="${sdto.p_money}"
					type="number" /></td>
			</tr>
		</c:forEach>
		<c:forEach items="${goalMinusSpend}" var="gdto">
			<tr>
				<td>${gdto.g_name}</td>
				<td><f:formatNumber value="${gdto.g_money}"
					type="number" /></td>
				<td>0</td>
			</tr>
		</c:forEach>
		<c:forEach items="${spendMinusGoal}" var="sdto">
			<tr>
				<td>${sdto.p_name}</td>
				<td>0</td>
				<td><f:formatNumber value="${sdto.p_money}"
					type="number" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>