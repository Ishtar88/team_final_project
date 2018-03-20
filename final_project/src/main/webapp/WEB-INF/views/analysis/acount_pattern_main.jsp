<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function () {

	
	/* --------- */
	/* 투자 비율 차트 */
	/* --------- */
	var chart = new CanvasJS.Chart("acountTotalChart", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: "State Operating Funds"
		},
		legend:{
			cursor: "pointer",
			itemclick: explodePie
		},
		data: [{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{name}: <strong>{y}%</strong>",
			indexLabel: "{name} - {y}%",
			dataPoints: [
				{ y: 26, name: "School Aid", exploded: true },
				{ y: 20, name: "Medical Aid" },
				{ y: 5, name: "Debt/Capital" },
				{ y: 3, name: "Elected Officials" },
				{ y: 7, name: "University" },
				{ y: 17, name: "Executive" },
				{ y: 22, name: "Other Local Assistance"}
			]
		}]
	});
	chart.render();
	}

	function explodePie (e) {
		if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
		} else {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
		}
		e.chart.render();

	}
	
	
	/* --------- */
	/* 기간별 수익 차트 */
	/* --------- */
		var chart = new CanvasJS.Chart("acountDateChart", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Simple Line Chart"
		},
		axisY:{
			includeZero: false
		},
		data: [{        
			type: "line",       
			dataPoints: [
				{ y: 450 },
				{ y: 414},
				{ y: 520, indexLabel: "highest",markerColor: "red", markerType: "triangle" },
				{ y: 460 },
				{ y: 450 },
				{ y: 500 },
				{ y: 480 },
				{ y: 480 },
				{ y: 410 , indexLabel: "lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
				{ y: 500 },
				{ y: 480 },
				{ y: 510 }
			]
		}]
	});
	chart.render();
	
	/* --------- */
	/* 기간별 수익 차트 */
	/* --------- */
	var chart = new CanvasJS.Chart("acountDetailChart", {
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
				{ y: 67, label: "Inbox" },
				{ y: 28, label: "Archives" },
				{ y: 10, label: "Labels" },
				{ y: 7, label: "Drafts"},
				{ y: 15, label: "Trash"},
				{ y: 6, label: "Spam"}
			]
		}]
	});
	chart.render();

</script>
</head>
<body>
<div>
	<a href="#">Main</a>
	<a href="#">종합패턴</a>
	<a href="#">지출패턴</a>
	<a href="#">투자패턴</a>
</div>

<!--         -->
<!-- 총자산 금액 -->
<!--         -->
<div class="acountTotalMoney">
	<h1>총자산 </h1>
	<h1>000 </h1>
	<h1>원 </h1>
</div>

<!--              -->
<!-- 투자 비율 차트 -->
<!--              -->
<div class="acountTotalChart">
	<div id="acountTotalChart" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntDetail">
		<h3>OOO형 투자유형</h3>
		<div>
			유형설명
		</div>
	</div>
	
	<div class="acountMoneyTop5">
		<h3>투자 금액 TOP5</h3>
		<div>
			<span>1.</span><span>주식분류(주식)</span>(<span>주식명(하이닉스)</span>)<span>비율(30%)</span>
			<span>2.</span><span>주식분류(주식)</span>(<span>주식명(삼성전자)</span>)<span>비율(21%)</span>
			<span>3.</span><span>주식분류(적금)</span>(<span>주식명(기업은행 정기적금)</span>)<span>비율(17%)</span>
		</div>
	</div>
</div>

<table class="acountDetailTable" border="1">
	<caption>투자분류내역</caption>
	<tr>
		<th>분류</th>
		<th>금액</th>
		<th>비율</th>
		<th>수익률</th>
		
	</tr>
	<tr>
		<td>
			<input type="text" name="p_name" value="주식">
		</td>
	</tr>
</table>

<!--              -->
<!-- 기간별 수익 차트 -->
<!--              -->
<div class="acountDateChart">
	<div id="acountDateChart" style="height: 370px; width: 70%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntMaxMoney">
		<h3>1년 중에 가장 수익을 많이 낸 기간은 OO년 OO월입니다.</h3>
	</div>
	
	<div class="acountYearMoney">
		<h3>연간 투자 금액 TOP5</h3>
		<div>
			<span>1.</span><span>주식분류(주식)</span>(<span>주식명(하이닉스)</span>)<span>비율(30%)</span>
			<span>2.</span><span>주식분류(주식)</span>(<span>주식명(삼성전자)</span>)<span>비율(21%)</span>
			<span>3.</span><span>주식분류(적금)</span>(<span>주식명(기업은행 정기적금)</span>)<span>비율(17%)</span>
		</div>
	</div>
</div>

<!--              -->
<!-- 투자별 수익 현황 차트 -->
<!--              -->
<div class="acountDetailChart">
	<div id="acountDetailChart" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntMaxMoney">
		<h3>현재 가장 수익을 많이 낸 상품은 OO이며 OO%의 수입을 냈습니다.</h3>
	</div>
	
	<div class="acountYearMoney">
		<h3>투자 수익률 TOP5</h3>
		<div>
			<span>1.</span><span>주식분류(주식)</span>(<span>주식명(하이닉스)</span>)<span>비율(30%)</span>
			<span>2.</span><span>주식분류(주식)</span>(<span>주식명(삼성전자)</span>)<span>비율(21%)</span>
			<span>3.</span><span>주식분류(적금)</span>(<span>주식명(기업은행 정기적금)</span>)<span>비율(17%)</span>
		</div>
	</div>
</div>
</body>
</html>