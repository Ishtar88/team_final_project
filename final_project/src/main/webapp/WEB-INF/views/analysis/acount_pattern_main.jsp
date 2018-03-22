<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="pattern_header.jsp"></jsp:include>
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
<script type="text/javascript">
window.onload = function () {

	var year=document.getElementsByClassName("currentYear")[0].innerHTML;
	var month=document.getElementsByClassName("currentMonth")[0].innerHTML;
	month=parseInt(month);
	if (month<10) {
		month="0"+month;
	}
	
	
			/* --------- */
			/* 투자 비율 차트 */
			/* --------- */
	$.ajax({
		url:"acountTotalRate.do",
		datatype:"json",
		success:function(obj){
			var totalRate=obj["totalRate"];
			
			var finals=[];
			var div="";
			
			for (var i = 0; i < totalRate.length; i++) {
				finals.push({y:obj.totalRate[i].money , name:obj.totalRate[i].name });
				div+="<div class='totalRateChart'><div>"+obj.totalRate[i].name+" : "+obj.totalRate[i].money+"</div></div>";
			}
			
		 	var acountTotalChart = new CanvasJS.Chart("chartContainer1", {
				exportEnabled: true,
				animationEnabled: true,
				title:{
					text: "투자 비율 차트"
				},
				legend:{
					cursor: "pointer",
				},
				data: [{
					type: "pie",
					showInLegend: true,
					toolTipContent: "{name}: <strong>{y}원</strong>",
					indexLabel: "{name} - {y} 원",
					dataPoints: finals
				}]
			});
			acountTotalChart.render();

			function explodePie (e) {
				if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
					e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
				} else {
					e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
				}
				e.acountTotalChart.render();

			}  
			
			
			
			
			
		},error:function(request,status,error){
			alert("acountTotalRate error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});

	
			/* --------- */
			/* 기간별 수익 차트 */
			/* --------- */
			$.ajax({
				url:"acountDateChartAjax.do",
				data:"year="+year+"&month="+month,
				datatype:"json",
				success:function(obj){
					var sChart=obj["sChart"];
					var stChart=obj["stChart"];
					var fChart=obj["fChart"];
					
					var sFinals=[];
					for (var i = 0; i < sChart.length; i++) {
						sFinals.push({x:new Date(obj.sChart[i].s_enddate) , y:obj.sChart[i].s_tax });
					}

					var stFinals=[];
					for (var i = 0; i < stChart.length; i++) {
						stFinals.push({x:new Date(obj.stChart[i].st_selldate) , y:obj.stChart[i].st_inter });
					}
					
					var fFinals=[];
					for (var i = 0; i < fChart.length; i++) {
						fFinals.push({x:new Date(obj.fChart[i].f_enddate) , y:obj.fChart[i].f_inter });
					}
					
					
					
					var acountDateChart = new CanvasJS.Chart("chartContainer2", {
		 				title:{
		 					text: "기간별 수익 차트"
		 				},
		 				axisY:[{
		 					title: "save",
		 					lineColor: "#C24642",
		 					tickColor: "#C24642",
		 					labelFontColor: "#C24642",
		 					titleFontColor: "#C24642",
		 					suffix: "k"
		 				},
		 				{
		 					title: "stock",
		 					lineColor: "#369EAD",
		 					tickColor: "#369EAD",
		 					labelFontColor: "#369EAD",
		 					titleFontColor: "#369EAD",
		 					suffix: "k"
		 				}],
		 				axisY2: {
		 					title: "fund",
		 					lineColor: "#7F6084",
		 					tickColor: "#7F6084",
		 					labelFontColor: "#7F6084",
		 					titleFontColor: "#7F6084",
		 					prefix: "$",
		 					suffix: "k"
		 				},
		 				toolTip: {
		 					shared: true
		 				},
		 				legend: {
		 					cursor: "pointer",
		 					itemclick: toggleDataSeries
		 				},
		 				data: [{
		 					type: "line",
		 					name: "save",
		 					color: "#369EAD",
		 					showInLegend: true,
		 					axisYIndex: 1,
		 					dataPoints: sFinals
		 				},
		 				{
		 					type: "line",
		 					name: "stock",
		 					color: "#C24642",
		 					axisYIndex: 0,
		 					showInLegend: true,
		 					dataPoints: stFinals
		 				},
		 				{
		 					type: "line",
		 					name: "fund",
		 					color: "#7F6084",
		 					axisYType: "secondary",
		 					showInLegend: true,
		 					dataPoints: fFinals
		 				}]
		 			});
		 			acountDateChart.render();

		 			function toggleDataSeries(e) {
		 				if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		 					e.dataSeries.visible = false;
		 				} else {
		 					e.dataSeries.visible = true;
		 				}
		 				e.chart.render();
		 			} 
					
					
					
				},error:function(request,status,error){
					alert("acountDateChartAjax error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});


	
	

 		
	
	
	/*  */
	/* 투자별 수익 현황 차트 */
	/*  */
	/* error: ajax 통신 결과값이 acountDateChartAjax의 값이 넘어옴 */
	$.ajax({
		url:"acountDetailChart.do",
		data:"year="+year+"&month="+month,
		datatype:"json",
		success:function(obj){
			var list=obj["list"];
			alert("acountDetailChart 성공 / "+list);
			
			var finals=[];
			
			for (var i = 0; i < list.length; i++) {
				finals.push({y:obj.list[i].rate ,x:obj.list[i].detail });
			}
			
			var acountDetailChart = new CanvasJS.Chart("chartContainer3", {
				animationEnabled: true,
				title:{
					text: "투자별 수익 현황",
					horizontalAlign: "left"
				},
				data: [{
					type: "doughnut",
					startAngle: 60,
					//innerRadius: 60,
					indexLabelFontSize: 17,
					indexLabel: "{label} - #percent%",
					toolTipContent: "<b>{label}:</b> {y} (#percent%)",
					dataPoints: finals
				}]
			});
			acountDetailChart.render();
			
			
		},error:function(request,status,error){
			alert("acountDetailChart error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});
	

	
	
	
	/*  */
	/* 가장 많이 투자하고 있는 수익 차트 */
	/*  */
	$.ajax({
		url:"acountMaxValueChart.do",
		datatype:"json",
		success:function(obj){
			var list=obj["acountMaxValue"];
			alert("acountMaxValueChart 성공 / "+list);
			
			var finals=[];
			for (var i = 0; i < list.length; i++) {
				finals.push({y:obj.list[i].rate, label:obj.list[i].detail});
			}
			
			
			var acountMaxValueChart = new CanvasJS.Chart("chartContainer4", {
				animationEnabled: true,
				title:{
					text: "투자 수익률 차트",
					horizontalAlign: "left"
				},
				data: [{
					type: "doughnut",
					startAngle: 60,
					//innerRadius: 60,
					indexLabelFontSize: 17,
					indexLabel: "{label} - #percent%",
					toolTipContent: "<b>{label}:</b> {y} (#percent%)",
					dataPoints: finals
				}]
			});
			acountMaxValueChart.render();
			
			
		},error:function(request,status,error){
			alert("acountMaxValueChart error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
		
	});

	
	
	
	
	/*  */
	/* 당월 투자 비율 차트 */
	/*  */
	$.ajax({
		url:"CurrentAcountTotalChart.do",
		data:"year="+year+"&month="+month,
		datatype:"json",
		success:function(obj){
			
			alert("CurrentAcountTotalChart 성공 / ");
			
			var CurrentAcountTotalChart = new CanvasJS.Chart("chartContainer5", {
				animationEnabled: true,
				title:{
					text: "당월 투자 비율 차트",
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
			CurrentAcountTotalChart.render(); 
			
		},error:function(request,status,error){
			alert("CurrentAcountTotalChart error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
	

}


</script>
<style type="text/css">
	.acountTotalSidebar,.acountMoneyTop5,.acountYearMoney{
		background-color: gray;
	}
</style>
</head>
<body>


<!--         -->
<!-- 총자산 금액 -->
<!--         -->
<div class="acountTotalMoney">
	<h1>총자산: <span><fmt:formatNumber type="number" value="${aDto.ac_money }"/></span>원</h1>
</div>

<!--              -->
<!-- 투자 비율 차트 -->
<!--              -->
<div class="acountTotalChart">
	<div id="chartContainer1" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="acountTotalList">
	
	</div>
	<div class="acountTotalSidebar">
		<div class="aocuntDetail">
			<h3>OOO형 투자유형</h3>
			<div>
				유형설명
			</div>
		</div>
		
		<div class="acountMoneyTop5">
			<h3>투자 금액 TOP5</h3>
				<c:choose>
					<c:when test="${empty acountMoneyTop }">
					<div>
						<div>데이터가 없습니다.</div>
					</div>
					</c:when><c:otherwise>
						<c:forEach items="${acountMoneyTop }" var="dto">
							<div>
								<div>
									<span>${dto.rn }. </span><span>${dto.name }</span>(<span>${dto.detail }</span>) <span>비율(<fmt:formatNumber value="${dto.money/aDto.ac_money*100 }" pattern="0.00"/>%)</span>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
</div>

<!--              -->
<!-- 투자 분류별 내역 -->
<!--              -->
<table border="1">
	<caption>투자분류내역</caption>
	<tr>
		<th>분류</th>
		<th>투자명</th>
		<th>금액</th>
		<th>비율</th>
		<th>수익률</th>
		<th>만기여부</th>
		
	</tr>
		<c:choose>
			<c:when test="${empty totalDetail }"> 
			<tr class="acountDetailTable">
				<td colspan="6">-------------------검색된 내역이 없습니다.----------------------</td>
			</tr>
			</c:when><c:otherwise>
				<c:forEach items="${totalDetail }" var="dto">
					<tr class="acountDetailTable">
						<td>${dto.name }</td>
						<td>${dto.detail }</td>
						<td><fmt:formatNumber value="${dto.money }" type="number"/> </td>
						<td><fmt:formatNumber value="${dto.rate*100}" pattern="0.00"/>%</td>
						<td><fmt:formatNumber value="${dto.re }" pattern="0.00"/>%</td>
						<td>만기여부</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose> 
</table>

<!--              -->
<!-- 기간별 수익 차트 -->
<!--              -->
<div class="acountDateChart">
	<div id="chartContainer2" style="height: 370px; width: 70%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntMaxMoney">
		<h3>1년 중에 가장 수익을 많이 낸 기간은  <fmt:formatDate value="${yearMoneyTop.s_enddate }" pattern="YYYY"/> 년  <fmt:formatDate value="${yearMoneyTop.s_enddate }" pattern="MM"/>월입니다.</h3>
	</div>
	
	<div class="acountYearMoney">
		<h3>연간 투자 금액 TOP5</h3>
		<c:choose>
			<c:when test="${empty yearAcountMoneyTop }">
			
			</c:when><c:otherwise>
				<c:forEach items="${yearAcountMoneyTop }" var="dto">
					<div>
						<span>${dto.rn }</span><span>${dto.name }</span>(<span>${dto.detail }</span>)<span>비율(<fmt:formatNumber value="${dto.money/aDto.ac_money*100 }" pattern="0.00"/>%)</span>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!--              -->
<!-- 투자별 수익 현황 차트 -->
<!--              -->
<div class="acountDetailChart">
	<div id="chartContainer3" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="acountDetailList">
		
	</div>
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

<!--              -->
<!--           -->
<!-- 가장 많이 투자하고 있는 수익 차트 -->
<!--              -->
<div class="acountMaxValueChart">
	<div id="chartContainer4" style="height: 200px; width: 30%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntMaxValueList">

	</div>
	
	<div class="acountMaxValueDetail">
		<h3>현재 가장 수익을 많이 낸 상품은 이며 %의 수입을 냈습니다.</h3>
	</div>
</div>


<!--              -->
<!-- 당월 투자 비율 차트 -->
<!--              -->
<div class="currentAcountTotalChart">
<div><h2><span class="currentYear"><%=year %></span>년 <span class="currentMonth"><%=month %></span>월</h2></div>
	<div id="chartContainer5" style="height: 370px; width: 50%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="acountTotalList">
	
	<div class="currentAcountTotalMoney">
		<h1>이번달 총자산 </h1>
		<h1>000 </h1>
		<h1>원 </h1>
	</div>
	
	</div>
	<div class="currentAcountDetail">
		<h3>OOO형 투자유형</h3>
		<div>
			유형설명
		</div>
	</div>
</div>

<!--              -->
<!-- 당월 투자 분류별 내역 -->
<!--              -->
<table class="currentAcountDetailTable" border="1">
	<caption>투자분류내역</caption>
	<tr>
		<th>분류</th>
		<th>금액</th>
		<th>비율</th>
		<th>수익률</th>
		<th>만기여부</th>
		
	</tr>
	<tr>
		<td>
			<input type="text" name="p_name" value="주식">
		</td>
	</tr>
</table>
</body>
</html>