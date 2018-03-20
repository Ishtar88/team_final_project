<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../analysis/pattern_header.jsp"></jsp:include>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
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
	chart.render();

}
</script>
<style type="text/css">


	#counsumption_pattern {
	width: 300px;
	height: 300px;
	float: left;
	background-color: black;
	color: white;
		}
		
		
</style>
</head>
<body>
	<div id="counsumption_pattern">뫄뫄님의 소비패턴 분석결과...
		<div>	
			<p>당신은</p>
			
			<p>엄청난 인간!</p>
		</div>
	</div>
	<div id="chartContainer" style="height: 370px; width: 50%;"></div>

</body>
</html>