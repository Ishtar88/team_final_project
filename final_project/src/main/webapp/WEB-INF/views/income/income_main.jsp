<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="income_header.jsp"></jsp:include>
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

	function save_detail(s_seq){
		var url='save_detail.do?seq='+s_seq;
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
		<div class="income_canvas_wrap">
			<div id="chartContainer" style="height: 400px; width: 50%;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
		<div class="income_total_wrap">
			<div class="acount_total_money">
				<p class="field">총수입: </p>
				<div class="field">${aDto.ac_money }</div>
				<div class="field">
					<span>수입 TOP5</span>
					<div></div>
				</div>
			</div>
		</div>
	</header>
	<div class="income_body_wrap">
		<div class="income_header_wrap">
			<header>
				<div class="ui right aligned">
				    <div class="income_searchDate">
					    <a href="#" >◁◁</a>
					    <a href="#" >◀</a>
					    	<span class="income_year">${year }년 </span>
					    	<span class="income_month">${month }월</span>
					    <a href="#" >▶</a>
					    <a href="#" >▷▷</a>
				    </div>
			    </div>
			    <div class="income_updateForm">
			    	<a></a>
			    </div>
			</header>
	    </div>
	</div>
	<div class="acount_insert_icon">
		<a href="acount_insert_page.do">저축등록</a>	
	</div>
		  <!------  ---------->		
		<!---  저축정보 테이블   ---->
		  <!------  ---------->
		<div class="save_body">
			<div class="save_body">
				<header>
					<a href="#" onclick="svToggle()">
						<img alt="plus/minus_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">저축</span>
				</header>
				<table class="save_Tr" id="svBody" border="1" style="display: none;">
					<tr>
						<th>저축분류</th>
						<th>저축/적금/보험명</th>
						<th>현재금액</th>
						<th>시작날짜</th>
						<th>만기날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty svList }">
							<tr>
								<td colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${svList }" var="svDto">
								<tr>
									<td>${svDto.s_detail }</td>
									<td>
										<a href="#" onclick="save_detail('${svDto.s_seq}')">
											${svDto.s_name }
										</a>
									</td>
									<td>${svDto.s_add } 원</td>
									<td><fmt:formatDate value="${svDto.s_startdate }" pattern="yyyy-MM-dd"/> </td>
									<td><fmt:formatDate value="${svDto.s_enddate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="3"></td>
									<th>합계</th>
									<td>
										<c:set var="total" value="0" />
										<c:forEach items="${svList}" var="svDto">
											<c:set var="total" value="${total+svDto.s_add}" />
										</c:forEach>
										${total}
									</td>
								</tr>	
						</c:otherwise>
					</c:choose>
				</table>
			</div>

			
		</div>
	</div>
</body>
</html>