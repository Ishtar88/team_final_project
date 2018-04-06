<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

cal.set(year, month - 1, 1);
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

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
			
		//	alert("acountTotalRate 성공 / "+totalRate);
			
			for (var i = 0; i < totalRate.length; i++) {
				finals.push({y:totalRate[i].money , name:totalRate[i].name });
				div+="<div class='totalRateChart'><div>"+totalRate[i].name+" : "+totalRate[i].money+"</div></div>";
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
					
				//	alert("acountDateChartAjax 성공 / "+stChart);
					
					var sFinals=[];
					for (var i = 0; i < sChart.length; i++) {
						sFinals.push({x:new Date(sChart[i].s_enddate) , y:sChart[i].s_tax });
					}

					var stFinals=[];
					for (var i = 0; i < stChart.length; i++) {
						stFinals.push({x:new Date(stChart[i].st_selldate) , y:stChart[i].st_inter });
					}
					
					var fFinals=[];
					for (var i = 0; i < fChart.length; i++) {
						fFinals.push({x:new Date(fChart[i].f_enddate) , y:fChart[i].f_inter });
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
		//	alert("acountDetailChart 성공 / "+list);
			
			var finals=[];
			
			for (var i = 0; i < list.length; i++) {
				finals.push({y:list[i].rate ,label:list[i].detail });
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
		//	alert("acountMaxValueChart 성공 / "+list[0].rate);
			
			var finals=[];
			for (var i = 0; i < list.length; i++) {
				finals.push({y:list[i].rate, label:list[i].detail});
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
			var list=obj["CurrentAcountTotal"];
		//	alert("CurrentAcountTotalChart 성공 / "+list[0].money);
			
			var finals=[];
			for (var i = 0; i < list.length; i++) {
				finals.push({y:list[i].money , label:list[i].name})
			}
			
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
					dataPoints: finals
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


</style>
</head>
<body>
<div class="ui grid">



<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->
<!-- 개월수 세부메뉴 시작  -->

    <input type="hidden" name="year" value="<%=year%>" />
    <input type="hidden" name="month" value="<%=month%>" />
    <input type="hidden" name="lastDay" value="<%=lastDay%>" />
    <input type="hidden" name="sMonth" value="${sMonth}" />
    <input type="hidden" name="eMonth" value="${eMonth}" />
    


    <!-- 개월수 세부메뉴 끝  -->
    
<!-- --------------------------------------------------------------첫 레이아웃 줄 끝-->    

<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- ------------------1, 5 , 1, 5,2 --------------------------------------------둘째 레이아웃 줄 시작 -->
<!-- 공백 그리드  -->
<div class="wide column"></div>



<!--              -->
<!-- 투자 비율 차트 -->
<!--              -->
<div class="five wide colulmn">
<div class="acountTotalChart">
<div>&nbsp;</div>
	<div id="chartContainer1" style="height: 370px; width: 600px;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</div>
</div>



<!-- 공백 그리드  -->
<div class="wide column"></div>


<!--         -->
<!-- 총자산 금액, 유형 및 설명 출력  시작-->
<!--         -->



<div class="five wide column">

	<div class="acountTotalMoney">
	<h1>총자산: <span><fmt:formatNumber type="number" value="${aDto.ac_money }"/></span>원</h1>
	<div class="acountTotalList">
			<div>
				<h2>이번달 총 투자금액: <span><fmt:formatNumber value="${acountMonthMoney.ac_money }" type="number"/> </span> 원 </h2>
			</div>
	<table class=" ui celled table">
		<tr class="aocuntDetail">
			<td>
			<c:choose>
				<c:when test="solution=='SAFE'">
					<span>안정적</span>
				</c:when><c:when test="solution=='OFFEN'">
					<span>공격적</span>
				</c:when><c:otherwise>
					<span>균형적</span>
				</c:otherwise>
			</c:choose>
			투자유형</td>
		</tr>
		<tr>
			<td>
				${dto.a_detail }
			</td>
		</tr>
		</table>
	</div>
</div>
</div>	


<!-- 공백 그리드  -->
<div class="two wide column"></div>


<!-- --------------------------------------------------------------둘째 레이아웃 줄 끝 -->

<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- -----------------1, 6, 1, 7, 1 ---------------------------------------------셋째 레이아웃 줄 시작 -->

<!-- 공백 그리드  -->
<div class="wide column"></div>

<!-- 투자 금액 탑파이브 시작  -->
<div class="six wide column">
		<div class="acountMoneyTop5">
			<table class="ui very basic table">
				<tr>
					<td colspan="4">투자 금액 TOP5</td>
				</tr>
					<c:choose>
						<c:when test="${empty acountMoneyTop }">
						<tr>
							<td>데이터가 없습니다.</td>
						</tr>
						</c:when><c:otherwise>
							<c:forEach items="${acountMoneyTop }" var="dto">
									<tr>
										<td>${dto.rn }. </td><td>${dto.name }</td><td>(${dto.detail })</td> <td>비율(<fmt:formatNumber value="${dto.money/aDto.ac_money*100 }" pattern="0.00"/>%)</td>
									</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
			</table>
		</div>
	</div>


    <!-- 공백 그리드  -->
<div class="wide column"></div>


<!--              -->
<!-- 투자 분류별 내역 -->
<!--              -->
<div class="seven wide column">	
<table class="ui olive table">
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
			<tr>
				<td colspan="6">-------------------검색된 내역이 없습니다.----------------------</td>
			</tr>
			</c:when><c:otherwise>
				<c:forEach items="${totalDetail }" var="dto">
					<tr class="acountDetailTable">
						<td>${dto.name }</td>
						<td>${dto.detail }</td>
						<td><fmt:formatNumber value="${dto.money }" type="number"/>원 </td>
						<td><fmt:formatNumber value="${dto.rate*100}" pattern="0.00"/>%</td>
						<td><fmt:formatNumber value="${dto.re }" pattern="0.00"/>%</td>
						<td>만기여부</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose> 
</table>
</div>


<!-- 공백 그리드  -->
<div class="wide column"></div>


<!-- --------------------------------------------------------셋째 레이아웃 줄 끝 -->
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- -------------------1, 6, 1, 6, 2-------------------------------------------넷째 레이아웃 줄 시작-->



<!-- 공백 그리드  -->
<div class="wide column"></div>



<!--              -->
<!-- 기간별 수익 차트 -->
<!--              -->
<div class="six wide column">
<div class="acountDateChart">
<div>&nbsp;</div>
	<div id="chartContainer2" style="height: 370px; width: 600px;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<br>
	<div class="aocuntMaxMoney">
		<table class="ui celled table">
		<tr>
			<td>1년 중에 가장 수익을 많이 낸 기간은  <span style="color: orange;"><fmt:formatDate value="${yearMoneyTop.s_enddate }" pattern="YYYY"/></span> 년  <span style="color: orange;"><fmt:formatDate value="${yearMoneyTop.s_enddate }" pattern="MM"/></span>월입니다.</td>
		</tr>
		</table>
	</div>
</div>
</div>


<!-- 공백 그리드  -->
<div class="wide column"></div>


<div class="six wide column">
	<div class="acountYearMoney">
	<table class="ui very basic table">
	<tr>
		<td>연간 투자 금액 TOP5</td>
	</tr>
		<c:choose>
			<c:when test="${empty yearAcountMoneyTop }">
			<tr>
				<td>데이터가 없습니다.</td>
			</tr>
			</c:when><c:otherwise>
				<c:forEach items="${yearAcountMoneyTop }" var="dto">
					<tr>
							<td>${dto.rn }. </td><td>${dto.name }</td><td>(${dto.detail })</td><td>비율(<fmt:formatNumber value="${dto.money/aDto.ac_money*100 }" pattern="0.00"/>%)</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
</div>



<!-- 공백 그리드  -->
<div class="two wide column"></div>

<!-- ---------------------------------------------------------넷째 레이아웃 줄 끝-->
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- -------------------1, 6, 1, 6, 2-------------------------------------------다섯째 레이아웃 줄 시작-->

<!-- 공백 그리드  -->
<div class="wide column"></div>

<!--              -->
<!-- 투자별 수익 현황 차트 -->
<!--              -->
	<br>
<div class="six wide column">
<div class="acountDetailChart">
	<div>&nbsp;</div>
	<div id="chartContainer3" style="height: 370px; width: 600px;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="acountDetailList">
		
	</div>
	<div class="aocuntMaxMoney">
		<table class="ui celled table">
			<tr>
				<td>현재 가장 수익을 많이 낸 상품은 <span style="color: orange;">${yearProductTop.detail }</span>이며 <span style="color: orange;">${yearProductTop.rate }%</span>의 수입을 냈습니다.</td>
			</tr>
		</table>	
	</div>
</div>
</div>






<!-- 공백 그리드  -->
<div class='wide column'></div>

<!--              -->
<!--           -->
<!-- 가장 많이 투자하고 있는 수익 차트 -->
<!--              -->

<div class='six wide column'>
<div class="acountMaxValueChart">
<div>&nbsp;</div>
	<div id="chartContainer4" style="height: 300px; width: 600px;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<div class="aocuntMaxValueList">

	</div>
	<div class="acountMaxValueProduct">
	<table class="ui celled table">
	<tr>
		<td>현재 가장 많이 투자하고 있는 상품은 <span style="color: orange;">${acountMaxValueProduct.detail }</span>이며 <span style="color: orange;"><fmt:formatNumber value="${acountMaxValueProduct.money }" type="number"/></span>원입니다.</td>
	</tr>
	</table>
	</div>
</div>
</div>




<!-- 공백 그리드  -->
<div class='two wide column'></div>

<!-- ---------------------------------------------------------five 레이아웃 줄 끝-->


<!-- ---------------------------------------------------------six 레이아웃 줄 start-->

<!-- 공백 그리드  -->
<div class="wide column"></div>


<!--              -->
<!-- 당월 투자 비율 차트 -->
<!--              -->
<div class='six wide column'>
<div class="currentAcountTotalChart">
<div><h2><span class="currentYear"><%=year %></span>년 <span class="currentMonth"><%=month %></span>월</h2></div><br>
	<div id="chartContainer5" style="height: 370px; width: 600px;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	</div>
	<br>
</div>




<!-- 공백 그리드  -->
<div class='"wide column'></div>


<!--              -->
<!-- 당월 투자 분류별 내역 -->
<!--              -->
<br>
<div class='six wide column'>
<div class="currentAcountDetailTable">
<table class="ui olive table">
	<caption>투자분류내역</caption>
	<tr>
		<th>분류</th>
		<th>금액</th>
		<th>비율</th>
		<th>수익률</th>
		<th>만기여부</th>
		
	</tr>
	<c:choose>
		<c:when test="${empty currentAcountDetail }">
			<tr>
				<td colspan="5">------------데이터가 없습니다.--------------</td>			
			</tr>
		</c:when><c:otherwise>
			<c:forEach items="${currentAcountDetail }" var="dto">
				<tr>
					<td>${dto.name}</td>
					<td><fmt:formatNumber value="${dto.money }" type="number"/>원</td>
					<td><fmt:formatNumber value="${dto.re }" type="number"/>%</td>
					<td><fmt:formatNumber value="${dto.rate }" pattern="0.00"/>%</td>
					<td>${dto.detail }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
</div>

<!-- 공백 그리드  -->
<div class='two wide column'></div>



<!-- --------------------------------------------------------------다섯째 레이아웃 줄 끝-->
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<!-- -------------------1, 6, 1, 6, 2-------------------------------------------다섯째 레이아웃 줄 시작-->

<!-- 공백 그리드  -->
<div class='wide column'></div>


<div class="six wide column">
	<div class="acountYearRate">
	<table class="ui very basic table">
		<tr>
		<td colspan="4">투자 수익률 TOP5</td>
		</tr>
		<c:choose>
			<c:when test="${empty acountRateTop5 }">
			<tr>
				<td colspan="4">데이터가 없습니다.</td>
			</tr>
			</c:when><c:otherwise>
				<c:forEach items="${acountRateTop5 }" var="dto">
					<tr>
						<td>${dto.rn }. </td><td>${dto.name }</td><td>(${dto.detail })</td><td>비율(<fmt:formatNumber value="${dto.money/aDto.ac_money*100 }" pattern="0.00"/>%)</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
</div>




<!-- 공백 그리드  -->
<div class='five wide column'></div>



</div>
</body>
</html>