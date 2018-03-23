<%@page import="java.util.List" %>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:useBean id="util"  class="com.jsr.project.util.Util"  />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../analysis/pattern_header.jsp"></jsp:include>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function () {

	var chart1 = new CanvasJS.Chart("chartContainers1", {
		animationEnabled: true,
		zoomEnabled: true,
		theme: "light2",
// 		title:{
// 			text:
// 		},
		axisX: {
			title:"원에 포인터를 갖다대보세요!",
			suffix: "%",
			minimum: 0,
			maximum: 61,
			gridThickness: 1
		},
		axisY:{
			title: "Agricultural Land (million sq.km)",
			suffix: "mn"
		},
		data: [{
			type: "bubble",
			toolTipContent: "<b>{name}</b><br/>Employment: {x}% <br/> Agri-Land: {y}mn sq. km<br/> 유형: {z}%",
			dataPoints: [
				{ x: 10, y: 5.225, z:200, name:"자기계발형" },
				{ x: 20, y: 7.17, z:200, name:"생활중심형" },
				{ x: 30, y: 4.043, z:200, name:"유흥중심형" },
				{ x: 40, y: 9.647, z:200, name:"쇼핑중심형" },
			]
		}]
	});
	chart1.render();
			 
			var chart2 = new CanvasJS.Chart("chartContainers2", {
				animationEnabled: true,
				title: {
					text: "Military Expenditure of Countries: 2016"
				},
				axisX: {
					interval: 1
				},
				axisY: {
					title: "Expenses in Billion Dollars",
					scaleBreaks: {
						type: "wavy",
						customBreaks: [{
							startValue: 80,
							endValue: 210
							},
							{
								startValue: 230,
								endValue: 600
							}
					]}
				},
				data: [{
					type: "bar",
					toolTipContent: "<img src=\"https://canvasjs.com/wp-content/uploads/images/gallery/javascript-column-bar-charts/\"{url}\"\" style=\"width:40px; height:20px;\"> <b>{label}</b><br>Budget: ${y}bn<br>{gdp}% of GDP",
					dataPoints: [
						{ label: "Israel", y: 17.8, gdp: 5.8, url: "israel.png" },
						{ label: "United Arab Emirates", y: 22.8, gdp: 5.7, url: "uae.png" },
						{ label: "Brazil", y: 22.8, gdp: 1.3, url: "brazil.png"},
						{ label: "Australia", y: 24.3, gdp: 2.0, url: "australia.png" },
						{ label: "South Korea", y: 36.8, gdp: 2.7, url: "skorea.png" },
						{ label: "Germany", y: 41.1, gdp: 1.2, url: "germany.png" },
						{ label: "Japan", y: 46.1, gdp: 1.0, url: "japan.png" },
						{ label: "United Kingdom", y: 48.3, gdp: 1.9, url: "uk.png" },
						{ label: "India", y: 55.9, gdp: 2.5, url: "india.png" },
					]
				}]
			});
			chart2.render();
			
			var chart3 = new CanvasJS.Chart("chartContainers3", {
				animationEnabled: true,
				title: {
					text: "Hourly Average CPU Utilization"
				},
				axisX: {
					title: "Time"
				},
				axisY: {
					title: "Percentage",
					suffix: "%"
				},
				data: [{
					type: "line",
					name: "CPU Utilization",
					connectNullData: true,
					//nullDataLineDashType: "solid",
					xValueType: "dateTime",
					xValueFormatString: "DD MMM hh:mm TT",
					yValueFormatString: "#,##0.##\"%\"",
					dataPoints: [
						{ x: 1501048673000, y: 35.939 },
						{ x: 1501052273000, y: 40.896 },
						{ x: 1501055873000, y: 56.625 },
						{ x: 1501059473000, y: 26.003 },
						{ x: 1501063073000, y: 20.376 },
						{ x: 1501066673000, y: 19.774 },
						{ x: 1501070273000, y: 23.508 },
						{ x: 1501073873000, y: 18.577 },
						{ x: 1501077473000, y: 15.918 },
						{ x: 1501081073000, y: null }, // Null Data
						{ x: 1501084673000, y: 10.314 },
						{ x: 1501088273000, y: 10.574 },
						{ x: 1501091873000, y: 14.422 },
						{ x: 1501095473000, y: 18.576 },
						{ x: 1501099073000, y: 22.342 },
						{ x: 1501102673000, y: 22.836 },
						{ x: 1501106273000, y: 23.220 },
						{ x: 1501109873000, y: 23.594 },
						{ x: 1501113473000, y: 24.596 },
						{ x: 1501117073000, y: 31.947 },
						{ x: 1501120673000, y: 31.142 }
					]
				}]
			});
			chart3.render();
			
			
			var chart4 = new CanvasJS.Chart("chartContainers4", {
				animationEnabled: true,
				exportEnabled: true,
				theme: "light2", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "Depth of Ocean at Different Levels"
				},
				axisY: {
					title: "Depth (in meters)",
					suffix: " m",
					reversed: true
				},
				axisX2: {
					tickThickness: 0
				},
				data: [{
					type: "column",
					axisXType: "secondary",
					yValueFormatString: "#,##0 meters",
					dataPoints: [
						{ y: 300, label: "Continental Shelf" },
						{ y: 3000, label: "Continental Slope" },
						{ y: 4000, label: "Continental Rise" },
						{ y: 6000, label: "Abyssal Plain", indexLabel: "Deepest" },
						{ y: 4400, label: "Sea Mount" }
					]
				}]
			});
			chart4.render();
			
			
			var chart5 = new CanvasJS.Chart("chartContainers5", {
				animationEnabled: true,
				exportEnabled: true,
				theme: "light1", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "Simple Column Chart with Index Labels"
				},
				data: [{
					type: "column", //change type to bar, line, area, pie, etc
					//indexLabel: "{y}", //Shows y value on all Data Points
					indexLabelFontColor: "#5A5757",
					indexLabelPlacement: "outside",
					dataPoints: [
						{ x: 10, y: 71 },
						{ x: 20, y: 55 },
						{ x: 30, y: 50 },
						{ x: 40, y: 65 },
						{ x: 50, y: 92, indexLabel: "Highest" },
						{ x: 60, y: 68 },
						{ x: 70, y: 38 },
						{ x: 80, y: 71 },
						{ x: 90, y: 54 },
						{ x: 100, y: 60 },
						{ x: 110, y: 36 },
						{ x: 120, y: 49 },
						{ x: 130, y: 21, indexLabel: "Lowest" }
					]
				}]
			});
			chart5.render();
			 
}
</script>
<style type="text/css">


	#counsumption_pattern {
	border:1px;
	margin-left:100px; 
	width: 300px;
	height: 300px;
	float: left;
	background-color: gray;
	color: black;
		}
		
		
	#patternDetail{
	margin-left:100px; 
	border-collapse: collapse;
	width:1000px;
	height:400px;
	}	
	
	#variousGraph{
	margin-left:100px; 
	border-collapse: collapse;
	width:1000px;
	height:400px;
	}
	
	#recommend{
	margin-left:100px; 
	border-collapse: collapse;
	width:1000px;
	height:400px;
	}
</style>
</head>
<c:set var="dto" value="${dto}"/> 
<body>

<!-- 	가장 큰 비중을 차지하는 패턴 출력  -->
	<div id="counsumption_pattern">회원님의 소비패턴 분석결과
		<div>	
			<p>당신은</p>
			
			<p>ㅇㅇㅇㅇ형 인간입니다. </p>
		</div>
	</div>
	
<!-- 	패턴별 퍼센트 원형 그래프  -->
	<div id="chartContainers1" style="height: 370px; width: 50%;"></div>
	
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	
<!-- 	패턴 설명 부분  -->
	<div>
		<table  id="patternDetail" border='1'>
		<col width="12.5%"><col width="25%"><col width="12.5%"><col width="25%">
			<tr>
				<td rowspan="2">사 진</td>
				<td height="10%">자기계발형</td>
				<td rowspan="2"> 사 진 </td>

				<td height="10%">생활중심형</td>
			</tr>
			<tr>
				<td>당신은 자기계발형 인간입니다. 문화생활, 뷰티/미용 항목에 많은 관심을 보이고 있네요. </td>
				<td>당신은 생활중심형 인간입니다. 생활중심형 인간은 생활/마트, 음식/외식에 많은 치중을 둡니다. </td>
			</tr>
			<tr>
				<td rowspan="2"> 사 진 </td>
				<td height="10%">유흥중심형</td>
				<td rowspan="2"> 사 진 </td>
				<td height="10%">쇼핑중심형</td>
			</tr>
			<tr>
				<td>당신은 유흥중심형 인간입니다. 술/유흥과 문화/예술에 많은 관심을 보이고 있네요.  </td>
				<td>당신은 쇼핑중심형 인간입니다. 술/유흥과 뷰티/미용 등에 많은 관심을 보이며 저축률보다 소비율이 높군요. </td>
			</tr>
		</table>
	</div>
	
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
<!-- 	지출별 세부 그래프  -->
	<div>
		<table id="variousGraph" border="1">
				<tr>
					<td><div id="chartContainers2" style="height: 100%; width: 100%;"></div></td>
					<td><div id="chartContainers3" style="height: 100%; width: 100%;"></div></td>
					<td><div id="chartContainers4" style="height: 100%; width: 100%;"></div></td>
				</tr>
				<tr>
					<td height="20">김수진님은 저번달에 비해 31.9%를 더 썼습니다. </td>
					<td height="20">이번주에 가장 많은 지출을 한 요일은 금요일입니다. </td>
					<td height="20">이번달에 가장 많이 지출한 분야는 ㅇㅇㅇ입니다. </td>
				</tr>
				<tr>
					<td height="10">좀더 절약해보는 건 어떨까요?</td>
					<td height="10">불금을 즐기시는 분이군요! </td>
					<td height="10">ㅇㅇㅇ를 즐기는 당신! </td>
				</tr>
		</table>
	</div>
	
<br/>
<br/>
<br/>
<br/>
<br/>

<div>
	<table id="recommend" border="1">
		<col width="25%">	<col width="75%">
		<tr>	
			<td><div id="chartContainers5" style="height: 100%; width: 100%;"></div></td>
			<td>
				<ul>
					<li>	계획 이행률은 뫄뫄 퍼센트 입니다. </li>
					<li>	수입을 투자부분에 뫄뫄 퍼센트 입니다.</li>
					<li>	저축부분에 뫄뫄퍼센트 입니다.</li>
					<li>	지출부분 중 필수 지출은 뫄뫄퍼센트 입니다.</li>
					<li>	비필수 지출은 뫄뫄 퍼센트 입니다.</li>
					<li>	평균 구매 신중도는 뫄뫄 퍼센트  입니다.</li>
					<li>	평균 소비 만족도는 뫄뫄 퍼센트 입니다. </li>
					<li>	지출부분에 뫄뫄퍼센트 입니다. </li>
				</ul>
			</td>
		</tr>
	</table>
</div>




</body>
</html>