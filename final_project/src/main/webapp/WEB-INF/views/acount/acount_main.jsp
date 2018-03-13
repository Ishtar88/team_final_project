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
<!----------------------
	자산정보 캔버스 처리
----------------------->
<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Crude Oil Reserves vs Production, 2016"
	},	
	axisY: {
		title: "Billions of Barrels",
		titleFontColor: "#4F81BC",
		lineColor: "#4F81BC",
		labelFontColor: "#4F81BC",
		tickColor: "#4F81BC"
	},
	axisY2: {
		title: "Millions of Barrels/day",
		titleFontColor: "#C0504E",
		lineColor: "#C0504E",
		labelFontColor: "#C0504E",
		tickColor: "#C0504E"
	},	
	toolTip: {
		shared: true
	},
	legend: {
		cursor:"pointer",
		itemclick: toggleDataSeries
	},
	data: [{
		type: "column",
		name: "Proven Oil Reserves (bn)",
		legendText: "Proven Oil Reserves",
		showInLegend: true, 
		dataPoints:[
			{ label: "Saudi", y: 266.21 },
			{ label: "Venezuela", y: 302.25 },
			{ label: "Iran", y: 157.20 },
			{ label: "Iraq", y: 148.77 },
			{ label: "Kuwait", y: 101.50 },
			{ label: "UAE", y: 97.8 }
		]
	},
	{
		type: "column",	
		name: "Oil Production (million/day)",
		legendText: "Oil Production",
		axisYType: "secondary",
		showInLegend: true,
		dataPoints:[
			{ label: "Saudi", y: 10.46 },
			{ label: "Venezuela", y: 2.27 },
			{ label: "Iran", y: 3.99 },
			{ label: "Iraq", y: 4.45 },
			{ label: "Kuwait", y: 2.92 },
			{ label: "UAE", y: 3.1 }
		]
	}]
});
chart.render();

function toggleDataSeries(e) {
	if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}

}
</script>
<script type="text/javascript">


	function stToggle(){
		$(".stock_Tr").toggle();
	}
	
	function fdToggle(){
		$(".fund_Tr").toggle();
	}
	
	function lnToggle(){
		$(".loan_Tr").toggle();
	}
	function svToggle(){
		$(".save_Tr").toggle();
	}
	
	function saveDetail(s_seq){
		var url='acount_detail.do?acount=save&seq='+s_seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
	
	function stockDetail(st_seq){
		var url='acount_detail.do?acount=stock&seq='+st_seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
	
	function fundDetail(f_seq){
		var url='acount_detail.do?acount=fund&seq='+f_seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
	
	function loanDetail(l_seq){
		var url='acount_detail.do?acount=loan&seq='+l_seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}
	
</script>
<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int lMonth=cal.get(Calendar.MONTH)+1;
	String month=null;
	if(lMonth<10){
		month="0"+lMonth;
	}
%>
<style type="text/css">
	body{position: relative;}
	.acount_header_wrap{
		text-align: center;
		border: 1px;
	}
	.acount_canvas_wrap,.acount_total_wrap{
		align-content: center;
	}
	.acount_body_wrap{
	
	}
	.acount_total_wrap{
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
			    <a class="active item" href="goal_main.do">목표관리</a>
			    <a class="item" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
			    <a class="item" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
			    <a class="item" href="month_main.do?year=<%=year%>&month=<%=month%>">달력</a>
		    </div>
		</header>
		<div class="acount_canvas_wrap">
			<div id="chartContainer" style="height: 370px; width: 40%;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
		<div class="acount_total_wrap">
			<div class="acount_total_money">
				<p class="field">총예산: </p>
				<div class="field">${aDto.ac_money }</div>
			</div>
		</div>
	<div class="acount_body_wrap">
		<div class="acount_header_wrap">
			    <div>
				    <a class="item" href="acount.do">수정</a>
				    <a class="item">삭제</a>
			    </div>
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
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
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
		  <!------  ---------->		
		<!---  주식정보 테이블   ---->
		  <!------  ---------->
		<div class="acount_body">
			<div class="stock_body">
				<header>
					<a onclick="stToggle()">
						<img alt="plus/minus_icon" class="st_icon" src="resources/icon/plus.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">주식</span>
				</header>
				<table class="stock_Tr" border="1" style="display: none;">
					<tr>
						<th>주식명</th>
						<th>구매 수량</th>
						<th>매수 금액</th>
						<th>손익률</th>
						<th>평가금</th>
						<th>매수날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty sList }">
							<tr>
								<td colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${sList }" var="sDto">
								<tr>
									<td>
										<a href="#" onclick="stockDetail('${sDto.st_seq}')">
											${sDto.st_name }
										</a>
									</td>
									<td>${sDto.st_count }</td>
									<td>${sDto.st_count*sDto.st_money } 원</td>
									<td>${sDto.st_money/sDto.st_add } %</td>
									<td>${sDto.st_count*sDto.st_add }원 </td>
									<td><fmt:formatDate value="${sDto.st_buydate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="4"></td>
									<th>합계</th>
									<td>
										<c:set var="total" value="0" />
										<c:forEach items="${sList}" var="sDto">
											<c:set var="total" value="${total+(sDto.st_count*sDto.st_add)}" />
										</c:forEach>
										${total}
									</td>
								</tr>	
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			
		  <!------  ---------->		
		<!---  펀드정보 테이블   ---->
		  <!------  ---------->
		  	<div class="fund_body">
				<header>
					<a onclick="fdToggle()">
						<img alt="plus/minus_icon" src="resources/icon/plus.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">펀드</span>
				</header>
				<table class="fund_Tr" border="1" style="display: none;">
					<tr>
						<th>펀드명</th>
						<th>투자원금</th>
						<th>손익률</th>
						<th>평가금</th>
						<th>등록날짜</th>
						<th>만기날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty fList }">
							<tr>
								<td colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${fList }" var="fDto">
								<tr>
									<td>
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											${fDto.f_name }
										</a>
									</td>
									<td>${fDto.f_money }</td>
									<td>${fDto.f_money/fDto.f_add }</td>
									<td>${fDto.f_add }</td>
									<td><fmt:formatDate value="${fDto.f_buydate }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${fDto.f_enddate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="4"></td>
									<th>합계</th>
									<td>
										<c:set var="total" value="0" />
										<c:forEach items="${fList}" var="fDto">
											<c:set var="total" value="${total+fDto.f_add}" />
										</c:forEach>
										${total}
									</td>
								</tr>	
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		  <!------  ---------->		
		<!---  대출정보 테이블   ---->
		  <!------  ---------->
		  	<div class="loan_body">
				<header>
					<a onclick="lnToggle()">
						<img alt="plus/minus_icon" src="resources/icon/plus.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">대출</span>
				</header>
				<table class="loan_Tr" border="1" style="display: none;">
					<tr>
						<th>대출명</th>
						<th>대출원금</th>
						<th>잔액</th>
						<th>등록날짜</th>
						<th>만기날짜</th>
					</tr>
					<c:choose>
						<c:when test="${empty lList }">
							<tr>
								<td colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${lList }" var="lDto">
								<tr>
									<td>
										<a href="#" onclick="loanDetail('${lDto.l_seq}')">
											${lDto.l_name }
										</a>
									</td>
									<td>${lDto.l_money }</td>
									<td>${lDto.l_bal }</td>
									<td><fmt:formatDate value="${lDto.l_startdate }" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${lDto.l_enddate }" pattern="yyyy-MM-dd"/></td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="3"></td>
									<th>잔액합계</th>
									<td>
										<c:set var="total" value="0" />
										<c:forEach items="${lList}" var="lDto">
											<c:set var="total" value="${total+lDto.l_bal}" />
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
	</div>
</body>
</html>