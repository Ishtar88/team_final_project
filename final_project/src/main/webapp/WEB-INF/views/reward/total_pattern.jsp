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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	window.onload = function() {

		var totalVisitors = 883000;
		var visitorsData = {
			"New vs Returning Visitors" : [ {
				click : visitorsChartDrilldownHandler,
				cursor : "pointer",
				explodeOnClick : false,
				innerRadius : "75%",
				legendMarkerType : "square",
				name : "New vs Returning Visitors",
				radius : "100%",
				showInLegend : true,
				startAngle : 90,
				type : "doughnut",
				dataPoints : [ {
					y : 519960,
					name : "New Visitors",
					color : "#E7823A"
				}, {
					y : 363040,
					name : "Returning Visitors",
					color : "#546BC1"
				} ]
			} ],
			"New Visitors" : [ {
				color : "#E7823A",
				name : "New Visitors",
				type : "column",
				dataPoints : [ {
					x : new Date("1 Jan 2015"),
					y : 33000
				}, {
					x : new Date("1 Feb 2015"),
					y : 35960
				}, {
					x : new Date("1 Mar 2015"),
					y : 42160
				}, {
					x : new Date("1 Apr 2015"),
					y : 42240
				}, {
					x : new Date("1 May 2015"),
					y : 43200
				}, {
					x : new Date("1 Jun 2015"),
					y : 40600
				}, {
					x : new Date("1 Jul 2015"),
					y : 42560
				}, {
					x : new Date("1 Aug 2015"),
					y : 44280
				}, {
					x : new Date("1 Sep 2015"),
					y : 44800
				}, {
					x : new Date("1 Oct 2015"),
					y : 48720
				}, {
					x : new Date("1 Nov 2015"),
					y : 50840
				}, {
					x : new Date("1 Dec 2015"),
					y : 51600
				} ]
			} ],
			"Returning Visitors" : [ {
				color : "#546BC1",
				name : "Returning Visitors",
				type : "column",
				dataPoints : [ {
					x : new Date("1 Jan 2015"),
					y : 22000
				}, {
					x : new Date("1 Feb 2015"),
					y : 26040
				}, {
					x : new Date("1 Mar 2015"),
					y : 25840
				}, {
					x : new Date("1 Apr 2015"),
					y : 23760
				}, {
					x : new Date("1 May 2015"),
					y : 28800
				}, {
					x : new Date("1 Jun 2015"),
					y : 29400
				}, {
					x : new Date("1 Jul 2015"),
					y : 33440
				}, {
					x : new Date("1 Aug 2015"),
					y : 37720
				}, {
					x : new Date("1 Sep 2015"),
					y : 35200
				}, {
					x : new Date("1 Oct 2015"),
					y : 35280
				}, {
					x : new Date("1 Nov 2015"),
					y : 31160
				}, {
					x : new Date("1 Dec 2015"),
					y : 34400
				} ]
			} ]
		};

		var newVSReturningVisitorsOptions = {
			animationEnabled : true,
			theme : "light2",
			title : {
				text : "New VS Returning Visitors"
			},
			subtitles : [ {
				text : "Click on Any Segment to Drilldown",
				backgroundColor : "#2eacd1",
				fontSize : 16,
				fontColor : "white",
				padding : 5
			} ],
			legend : {
				fontFamily : "calibri",
				fontSize : 14,
				itemTextFormatter : function(e) {
					return e.dataPoint.name + ": "
							+ Math.round(e.dataPoint.y / totalVisitors * 100)
							+ "%";
				}
			},
			data : []
		};

		var visitorsDrilldownedChartOptions = {
			animationEnabled : true,
			theme : "light2",
			axisX : {
				labelFontColor : "#717171",
				lineColor : "#a2a2a2",
				tickColor : "#a2a2a2"
			},
			axisY : {
				gridThickness : 0,
				includeZero : false,
				labelFontColor : "#717171",
				lineColor : "#a2a2a2",
				tickColor : "#a2a2a2",
				lineThickness : 1
			},
			data : []
		};

		var chart = new CanvasJS.Chart("chartContainer",
				newVSReturningVisitorsOptions);
		chart.options.data = visitorsData["New vs Returning Visitors"];
		chart.render();

		function visitorsChartDrilldownHandler(e) {
			chart = new CanvasJS.Chart("chartContainer",
					visitorsDrilldownedChartOptions);
			chart.options.data = visitorsData[e.dataPoint.name];
			chart.options.title = {
				text : e.dataPoint.name
			}
			chart.render();
			$("#backButton").toggleClass("invisible");
		}

		$("#backButton")
				.click(
						function() {
							$(this).toggleClass("invisible");
							chart = new CanvasJS.Chart("chartContainer",
									newVSReturningVisitorsOptions);
							chart.options.data = visitorsData["New vs Returning Visitors"];
							chart.render();
						});

		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			theme : "light2",
			title : {
				text : "Site Traffic"
			},
			axisX : {
				valueFormatString : "DD MMM",
				crosshair : {
					enabled : true,
					snapToDataPoint : true
				}
			},
			axisY : {
				title : "Number of Visits",
				crosshair : {
					enabled : true
				}
			},
			toolTip : {
				shared : true
			},
			legend : {
				cursor : "pointer",
				verticalAlign : "bottom",
				horizontalAlign : "left",
				dockInsidePlotArea : true,
				itemclick : toogleDataSeries
			},
			data : [ {
				type : "line",
				showInLegend : true,
				name : "Total Visit",
				markerType : "square",
				xValueFormatString : "DD MMM, YYYY",
				color : "#F08080",
				dataPoints : [ {
					x : new Date(2017, 0, 3),
					y : 650
				}, {
					x : new Date(2017, 0, 4),
					y : 700
				}, {
					x : new Date(2017, 0, 5),
					y : 710
				}, {
					x : new Date(2017, 0, 6),
					y : 658
				}, {
					x : new Date(2017, 0, 7),
					y : 734
				}, {
					x : new Date(2017, 0, 8),
					y : 963
				}, {
					x : new Date(2017, 0, 9),
					y : 847
				}, {
					x : new Date(2017, 0, 10),
					y : 853
				}, {
					x : new Date(2017, 0, 11),
					y : 869
				}, {
					x : new Date(2017, 0, 12),
					y : 943
				}, {
					x : new Date(2017, 0, 13),
					y : 970
				}, {
					x : new Date(2017, 0, 14),
					y : 869
				}, {
					x : new Date(2017, 0, 15),
					y : 890
				}, {
					x : new Date(2017, 0, 16),
					y : 930
				} ]
			}, {
				type : "line",
				showInLegend : true,
				name : "Unique Visit",
				lineDashType : "dash",
				dataPoints : [ {
					x : new Date(2017, 0, 3),
					y : 510
				}, {
					x : new Date(2017, 0, 4),
					y : 560
				}, {
					x : new Date(2017, 0, 5),
					y : 540
				}, {
					x : new Date(2017, 0, 6),
					y : 558
				}, {
					x : new Date(2017, 0, 7),
					y : 544
				}, {
					x : new Date(2017, 0, 8),
					y : 693
				}, {
					x : new Date(2017, 0, 9),
					y : 657
				}, {
					x : new Date(2017, 0, 10),
					y : 663
				}, {
					x : new Date(2017, 0, 11),
					y : 639
				}, {
					x : new Date(2017, 0, 12),
					y : 673
				}, {
					x : new Date(2017, 0, 13),
					y : 660
				}, {
					x : new Date(2017, 0, 14),
					y : 562
				}, {
					x : new Date(2017, 0, 15),
					y : 643
				}, {
					x : new Date(2017, 0, 16),
					y : 570
				} ]
			} ]
		});
		chart.render();

		function toogleDataSeries(e) {
			if (typeof (e.dataSeries.visible) === "undefined"
					|| e.dataSeries.visible) {
				e.dataSeries.visible = false;
			} else {
				e.dataSeries.visible = true;
			}
			chart.render();
		}

	}
</script>

<style>
#backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

.invisible {
	display: none;
}
</style>
</head>
<body>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<button class="btn invisible" id="backButton">< Back</button>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
	<table>
		<tr>
			<td>총 지출액</td>
			<td colspan="2">700,000</td>
		</tr>
		<tr>
			<td>지출부분</td>
			<td>60%</td>
			<td>700,000</td>
		</tr>
		<tr>
			<td>투자/저축부분</td>
			<td>40%</td>
			<td>700,000</td>
		</tr>
	</table>
<table>
		<tr>
			<td>목표달성률</td>
			<td colspan="2">80%</td>
		</tr>
		<tr>
			<td>카테고리별 상세내역</td>
		</tr>
			<c:forEach items="list" var="adto">
			<tr>
			<td>카테고리명</td>
			<td>10%초과지출</td>
			</tr>
			</c:forEach>
	</table>
</body>
</html>