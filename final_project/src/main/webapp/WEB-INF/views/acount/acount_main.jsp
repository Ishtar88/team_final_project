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
	
	$.ajax({
		url:"acountChartAjax.do",
		datatype:"json",
		success:function(obj){
			var svMoney=obj["svMoney"];
			var sMoney=obj["sMoney"];
			var fMoney=obj["fMoney"];
			var lMoney=obj["lMoney"];
			
			
			var chart = new CanvasJS.Chart("chartContainer", {
				animationEnabled: true,
				theme: "light1", // "light1", "light2", "dark1", "dark2"
				title:{
					text: "분류별 총 금액"
				},
				axisY: {
					title: ""
				},
				data: [{        
					type: "column",  
					showInLegend: true, 
					legendMarkerColor: "orange",
					legendText: "분류별 총액",
					dataPoints: [      
						{ y: svMoney.s_money, label: "저축" },
						{ y: sMoney.st_money,  label: "주식" },
						{ y: fMoney.f_money,  label: "펀드" },
						{ y: lMoney.l_money,  label: "대출" }
					]
				}]
			});
			chart.render();

			},error:function(request,status,error){
				alert("error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
			}
		});

}
</script>
<script type="text/javascript">

	$(function(){
		var list=$(".acount_list").children().children();
		
		
		for (var i = 0; i < list.length; i++) {
			list.eq(i).attr("class","item");
		}
		
		list.eq(1).attr("class","active item");
		
	});

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
		var prop='width=450px; height=650px; align-content: center;';
		
		open(url,'',prop);
	}
	
	function stockDetail(st_seq){
		var url='acount_detail.do?acount=stock&seq='+st_seq;
		var prop='width=450px; height=650px;';
		
		open(url,'',prop);
	}
	
	function fundDetail(f_seq){
		var url='acount_detail.do?acount=fund&seq='+f_seq;
		var prop='width=450px; height=650px;';
		
		open(url,'',prop);
	}
	
	function loanDetail(l_seq){
		var url='acount_detail.do?acount=loan&seq='+l_seq;
		var prop='width=450px; height=650px;';
		
		open(url,'',prop);
	}
	
	$('.ui.sticky')
	  .sticky({
	    context: '#insert_acount_icon'
	  })
	;
	
</script>

<style type="text/css">
	.acount_total_wrap{
		width: 300px; height: 100px;
	}
	.acount_body_wrap{
		align-content: center;
	}
	.acount_body{
		width: 700px;
	}
	
	


</style>
<%
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int lMonth = cal.get(Calendar.MONTH) + 1;
	
	if (paramYear != null) {
		year = Integer.parseInt(paramYear);
	}
	if (paramMonth != null) {
		lMonth = Integer.parseInt(paramMonth);
	}
	if (lMonth > 12) {
		lMonth = 1;
		year++;
	}
	if (lMonth == 0) {
		lMonth = 12;
		year--;
	}
	String sMonth=null;
	if(lMonth<10){
		sMonth="0"+lMonth;
	}else{
		sMonth=""+lMonth;
	}
	int month=Integer.parseInt(sMonth);
%>
</head>
<body>
<div class="acount_body_wrap">
	<br>
		<header>
				<div class="acount_list">
				 	 <a class="ui olive button" href="goal_main.do">목표관리</a>
					  <a class="ui olive button" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
				 	 <a class="ui olive button" href="income_main.do?year=<%=year%>&month=<%=month%>">수입관리</a>
				 	 <a class="ui olive button" href="spending_main.do?year=<%=year%>&month=<%=month%>">지출관리</a>
				 	 <a class="ui olive button" href="calendar_main.do?year=<%=year%>&month=<%=month%>">달력</a>
				 </div>
		</header>
	<br>
	<div class="acount_total_wrap">
		<table class="ui selectable inverted table">
			<tr>
				<td class="acount_total_money">
					<h2 class="field" style="text-align: center;">총예산: <fmt:formatNumber value="${aDto.ac_money }" type="number"/>원</h2>
				</td>
			</tr>
		</table>
	</div>
	<div class="acount_Chart">
		<div class="acount_canvas_wrap">
				<div id="chartContainer" style="height: 300px; width: 700px;"></div>
				<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
	</div>
	<div class="mid_header">
		<div class="ui segment" id="insert_acount_icon">
				<a href="acount_insert_page.do"><img alt="acount_icon" src="resources/icon/plus.png" style="width: 17px; height: 17px;">자산등록</a>	
		</div>
	</div>
			<div class="acount_body_wrap">
			<div class="acount_header_wrap">
				<header>
					<div class="ui right aligned">
					    <div class="acount_searchDate">
							 <a href="acount.do?year=<%=year-1%>&month=<%=month%>" >◁◁</a>
							 <a href="acount.do?year=<%=year%>&month=<%=month-1%>" >◀</a>
						 	  	<span class="acount_year"><%=year%>년 </span>
						 	  	<span class="acount_month"><%=month%>월</span>
						     <a href="acount.do?year=<%=year%>&month=<%=month+1%>" >▶</a>
					  		 <a href="acount.do?year=<%=year+1%>&month=<%=month%>" >▷▷</a>
					    </div>
				    </div>
				    <div class="acount_updateForm">
				    	<a></a>
				    </div>
				</header>
		    </div>
		</div>
		  <!------  ---------->		
		<!---  저축정보 테이블   ---->
		  <!------  ---------->
		  <div class="acount_body">
			<div class="save_body" >
				<header>
					<a href="#" href="#" onclick="svToggle()">
						<img alt="plus/minus_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">저축</span>
				</header>
				<table class="save_Tr ui selectable gray table" id="svBody" border="1">
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
								<td class="selectable" colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${svList }" var="svDto">
								<tr>
									<td class="selectable">
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
											${svDto.s_detail }
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
											${svDto.s_name }
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
											<fmt:formatNumber value="${svDto.s_add }" type="number"/> 원
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
											<fmt:formatDate value="${svDto.s_startdate }" pattern="yyyy-MM-dd"/>
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="saveDetail('${svDto.s_seq}')">
											<fmt:formatDate value="${svDto.s_enddate }" pattern="yyyy-MM-dd"/>
										</a>
									</td>
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
										<fmt:formatNumber value="${total}" type="number"/>원
									</td>
								</tr>	
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		  <!------  ---------->		
		<!---  주식정보 테이블   ---->
		  <!------  ---------->
			<div class="stock_body">
				<header>
					<a href="#" onclick="stToggle()">
						<img alt="plus/minus_icon" class="st_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">주식</span>
				</header>
				<table class="stock_Tr ui selectable gray table" border="1">
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
								<td class="selectable" colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${sList }" var="sDto">
								<tr>
									<td class="selectable">
										<a href="#" onclick="stockDetail('${sDto.st_seq}')">
											${sDto.st_name }
										</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="stockDetail('${sDto.st_seq}')">
										${sDto.st_count }
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="stockDetail('${sDto.st_seq}')">
										<fmt:formatNumber value="${sDto.st_count*sDto.st_money }" type="number"/> 원
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="stockDetail('${sDto.st_seq}')">
									<fmt:formatNumber value="${sDto.st_money/sDto.st_add }" pattern="0.00"/> %
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="stockDetail('${sDto.st_seq}')">
									<fmt:formatNumber value="${sDto.st_count*sDto.st_add }" type="number"/> 원 
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="stockDetail('${sDto.st_seq}')">
									<fmt:formatDate value="${sDto.st_buydate }" pattern="yyyy-MM-dd"/>
									</a>
									</td>
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
										<fmt:formatNumber value="${total}" type="number"/> 원
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
					<a href="#" onclick="fdToggle()">
						<img alt="plus/minus_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">펀드</span>
				</header>
				<table class="fund_Tr ui selectable gray table" border="1">
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
								<td class="selectable" colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${fList }" var="fDto">
								<tr>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											${fDto.f_name }
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											<fmt:formatNumber value="${fDto.f_money }" type="number"/> 원
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											<fmt:formatNumber value="${fDto.f_money/fDto.f_add }" pattern="0.00"/>
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											<fmt:formatNumber value="${fDto.f_add }" type="number"/> 원
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											<fmt:formatDate value="${fDto.f_buydate }" pattern="yyyy-MM-dd"/>
										</a>
									</td>
									<td class="selectable">
										<a href="#" onclick="fundDetail('${fDto.f_seq}')">
											<fmt:formatDate value="${fDto.f_enddate }" pattern="yyyy-MM-dd"/>
										</a>
									</td>
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
										<fmt:formatNumber value="${total}" type="number"/> 원
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
					<a href="#" onclick="lnToggle()">
						<img alt="plus/minus_icon" src="resources/icon/down_triangle.png" style="width: 20px; height: 20px;">
					</a>
					<span style="vertical-align: middle;">대출</span>
				</header>
				<table class="loan_Tr ui selectable gray table" border="1">
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
								<td class="selectable" colspan="7" style="text-align: center;">-------조회된 결과가 없습니다.--------</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${lList }" var="lDto">
								<tr>
									<td class="selectable">
										<a href="#" onclick="loanDetail('${lDto.l_seq}')">
											${lDto.l_name }
										</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="loanDetail('${lDto.l_seq}')">
									<fmt:formatNumber value="${lDto.l_money }" type="number"/> 원
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="loanDetail('${lDto.l_seq}')">
									<fmt:formatNumber value="${lDto.l_bal }" type="number"/> 원
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="loanDetail('${lDto.l_seq}')">
									<fmt:formatDate value="${lDto.l_startdate }" pattern="yyyy-MM-dd"/>
									</a>
									</td>
									<td class="selectable">
									<a href="#" onclick="loanDetail('${lDto.l_seq}')">
									<fmt:formatDate value="${lDto.l_enddate }" pattern="yyyy-MM-dd"/>
									</a>
									</td>
								</tr>
							</c:forEach>
								<tr>
								<td colspan="3"></td>
									<th>대출합계</th>
									<td>
											<c:set var="total" value="0" />
										<c:forEach items="${lList}" var="lDto">
											<c:set var="total" value="${total+lDto.l_money}" />
										</c:forEach>
										<fmt:formatNumber value="${total}" type="number"/> 원
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