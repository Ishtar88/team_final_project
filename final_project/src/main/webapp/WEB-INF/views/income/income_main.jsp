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
<!----------------------
	수입정보 캔버스 처리
----------------------->
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark2",
		exportFileName: "Doughnut Chart",
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: "Monthly Expense"
		},
		legend:{
			cursor: "pointer",
			itemclick: explodePie
		},
		data: [{
			type: "doughnut",
			innerRadius: 90,
			showInLegend: true,
			toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
			indexLabel: "{name} - #percent%",
			dataPoints: [
				{ y: 450, name: "Food" },
				{ y: 120, name: "Insurance" },
				{ y: 300, name: "Travelling" },
				{ y: 800, name: "Housing" },
				{ y: 150, name: "Education" },
				{ y: 150, name: "Shopping"},
				{ y: 250, name: "Others" }
			]
		}]
	});
	chart.render();

	function explodePie (e) {
		if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
		} else {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
		}
		e.chart.render();
	}

	}
</script>
<script type="text/javascript">

	function income_insert_page(){
		var url='income_insert_page.do';
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
	
	function incomeToggle(){
		$(".income_Tr").toggle();
	}
	
	function income_detail(seq){
		var url='income_detail.do?i_seq='+seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
</script>
<style type="text/css">
		body{position: relative;}
	.income_header_wrap{
		text-align: center;
		border: 1px;
	}
	.income_canvas_wrap,.income_total_wrap{
		align-content: center;
	}
	.income_body_wrap{
		align-content: center;
	}
	.income_total_wrap{
		left: 500px;
		width: 200px; height: 200px;
		background-color: grey;
	}	
</style>
</head>
<body>
<div class="acount_body_wrap">
	<header>
		<div class="ui right aligned">
		    <a class="item" href="goal_main.do">목표관리</a>
		    <a class="active item" href="income_main.do?year=2018&month=03">수입관리</a>
		    <a class="item" href="spending_main.do?year=2018&month=03">지출관리</a>
		    <a class="item" href="month_main.do?year=2018&month=03">달력</a>
	    </div>
	</header>
		<div class="income_canvas_wrap">
			<div id="chartContainer" style="height: 400px; width: 50%;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
		<div class="income_total_wrap">
			<div class="acount_total_money">
				<p class="field">총수입: </p>
				<div class="field">
					<c:set var="total" value="0" />
						<c:forEach items="${iList}" var="iDto">
						<c:set var="total" value="${total+iDto.i_money}" />
					</c:forEach>
					${total}
				</div>
				<div class="field">
					<span>수입 TOP5</span>
					<div class="income_top5">
						<c:choose>
							<c:when test="${empty dtos }">
								<div>수입이 없습니다.</div>
							</c:when><c:otherwise>
								<table>
									<tr>
										<th>수입명</th>
										<th>금액</th>
									</tr>
									<c:forEach items="${dtos }" var="dtos">
										<tr>
											<td>${dtos.i_name }</td>
											<td>${dtos.i_money }</td>
										</tr>
									</c:forEach>
								</table>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	<div class="income_body_wrap">
		<div class="income_header_wrap">
			<header>
				<div class="ui right aligned">
				    <div class="income_searchDate">
					    <a href="#" >◁◁</a>
					    <a href="#" >◀</a>
					    	<span class="income_year">${year }년 </span>
					    	<span class="income_month">${month }월</span>
					    <a href="" >▶</a>
					    <a href="#" >▷▷</a>
				    </div>
			    </div>
			    <div class="income_updateForm">
			    	<a></a>
			    </div>
			</header>
	    </div>
	</div>
	<div class="income_insert_icon">
		<a href="#" onclick="income_insert_page()">수입등록</a>	
	</div>
		  <!------  ---------->		
		<!---  상세내역 테이블   ---->
		  <!------  ---------->
		<div class="income_list_body">
			<div class="income_body">
				<header>
					<a href="#" onclick="incomeToggle()">
						<img alt="plus/minus_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">저축</span>
				</header>
				<table class="income_Tr" id="svBody" border="1" style="display: none;">
					<tr>
						<th>수입명</th>
						<th>금액</th>
						<th>고정여부</th>
						<th>날짜</th>
						<th>메모</th>
					</tr>
					<c:choose>
						<c:when test="${empty iList }">
							<tr>
								<td colspan="6" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${iList }" var="iDto">
								<tr>
									<td>
										<a href="#" onclick="income_detail('${iDto.i_seq}')">
											${iDto.i_name }
										</a>
									</td>
									<td>${iDto.i_money } 원</td>
									<td>${iDto.i_fix.equals("Y")?"고정수입":"변동수입" }</td>
									<td><fmt:formatDate value="${iDto.i_regdate }" pattern="yyyy-MM-dd"/></td>
									<td>${iDto.i_memo }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>

			
		</div>
	</div>
</body>
</html>