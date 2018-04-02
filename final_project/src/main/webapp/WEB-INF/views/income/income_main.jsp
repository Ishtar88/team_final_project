<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	var year=document.getElementsByClassName("income_year")[0].innerHTML;
	var month=document.getElementsByClassName("income_month")[0].innerHTML;
	
	$.ajax({
		url:"incomeChartAjax.do",
		data:"year="+year+"&month="+month,
		datatype:"json",
		success:function(obj){
			var iList=obj["iList"];
			
			var finals=[];
			
			for (var i = 0; i < iList.length; i++) {
				finals.push({y:obj.iList[i].i_money , name:obj.iList[i].i_name});
			}
			
			
			var chart = new CanvasJS.Chart("chartContainer", {
				exportFileName: "Doughnut Chart",
				exportEnabled: true,
				animationEnabled: true,
				title:{
					text: "수입 내역"
				},
				legend:{
					cursor: "pointer",
					itemclick: explodePie
				},
				data: [{
					type: "doughnut",
					innerRadius: 100,
					showInLegend: true,
					toolTipContent: "<b>{name}</b>: ${y} (#percent%)",
					indexLabel: "{name} - #percent%",
					dataPoints: finals
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
		
		list.eq(3).attr("class","active item");
		
	});

	function income_insert_page(){
		var url='income_insert_page.do';
		var prop='width=500px; height=450px;';
		
		open(url,'',prop);
	}
	
	function incomeToggle(){
		$(".income_Tr").toggle();
	}
	
	function income_detail(seq){
		var url='income_detail.do?i_seq='+seq;
		var prop='width=300px; height=300px;';
		
		open(url,'',prop);
	}
</script>
<style type="text/css">

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


<div class="ui grid">
<div class="sixteen wide column for blank"></div>

<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->
<!-- 개월수 세부메뉴 시작  -->


<!--  income calender start -->
<div class="sixteen wide column">
	<div class="ui secondary pointing menu">
			<div class="income_searchDate">
				<a href="income_main.do?year=<%=year-1%>&month=<%=month%>"><i class="angle double left icon"></i></a> 
				<a href="income_main.do?year=<%=year%>&month=<%=month-1%>"><i class="angle left icon"></i></a> 
				<span class="income_year"><%=year%>년</span> 
				<span class="income_month"><%=month%>월</span> 
				<a href="income_main.do?year=<%=year%>&month=<%=month+1%>"><i class="angle right icon"></i></a> 
				<a href="income_main.do?year=<%=year+1%>&month=<%=month%>"><i class="angle double right icon"></i></a>
			</div>
				<div class="income_updateForm">
					<a></a>
		</div>
	</div>
</div>
<!--  income calender end -->

<!-- --------------------------------------------------------------첫 레이아웃 줄 끝-->  


<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- ------------------1, 5 , 1, 5,2 --------------------------------------------둘째 레이아웃 줄 시작 -->



<!-- 공백 그리드  -->
<div class="wide column"></div>


<!-- ㅌㅔㅇㅣㅂㅡㄹ ㅅㅜㅈㅓㅇㅎㅐㅅㅇㅡㅁ ㅈㅗㅎㄱㅔㅅㄷㅏㅇ ㅎㅎ  -->


<!--  income total wrap start -->
<div class="three wide column">
	<div class="income_total_wrap">
		<table class="acount_total_money ui selectable table">
			<tr>
				<td colspan="2" style="text-align: center;">총수입: <c:set
						var="total" value="0" /> <c:forEach items="${iList}" var="iDto">
						<c:set var="total" value="${total+iDto.i_money}" />
					</c:forEach> <fmt:formatNumber value="${total }" type="number" />원
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">수입 TOP5</td>
			</tr>
			<tr class="field">
				<td class="income_top5" colspan="2"><c:choose>
						<c:when test="${empty dtos }">
							<td colspan="2" style="text-align: center;">수입이 없습니다.</td>
						</c:when>
						<c:otherwise>
							<tr>
								<th>수입명</th>
								<th>금액</th>
							</tr>
							<c:forEach items="${dtos }" var="dtos">
								<tr>
									<td>${dtos.i_name }</td>
									<td><fmt:formatNumber value="${dtos.i_money }"
											type="number" />원</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td>
				Insert income
				<!-- insert icon -->
				<a href="#" onclick="income_insert_page()"><img alt="acount_icon"
			src="resources/icon/plus.png" style="width: 25px; height: 25px;"></a></td>
			</tr>
		</table>
	</div>
</div>


<!-- insert icon -->

<!--  income total wrap end -->

<!-- graph start -->
<div class="seven wide column">
	<div class="income_canvas_wrap">
		<div id="chartContainer" style="height: 400px; width: 600PX;"></div>
		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	</div>
</div>
<!-- graph end -->	
	



<div class="four wide column for blank"></div>

<!-- --------------------------------------------------------------둘째 레이아웃 줄 끝 -->

<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>

<!-- ----------------------------------------------------------셋째 레이아웃 줄 시작

<!-- 공백 그리드  -->
<div class="wide column"></div>


	<!------  ---------->
	<!---  상세내역 테이블   start---->
	<!------  ---------->
<div class="six wide column">
	<div class="income_list_body">
		<div class="income_body">
			<header>
				<a href="#" onclick="incomeToggle()"> <img alt="plus/minus_icon"
					src="resources/icon/down_triangle.png"
					style="width: 20px; height: 20px;">
				</a> <span style="vertical-align: middle;">저축</span>
			</header>
			<table class="income_Tr ui selectable gray table" id="svBody"
				border="1">
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
							<td class="selectable" colspan="6" style="text-align: center;">-------조회된
								결과가 없습니다.--------</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${iList }" var="iDto">
							<tr>
								<td class="selectable"><a href="#"
									onclick="income_detail('${iDto.i_seq}')"> ${iDto.i_name } </a>
								</td>
								<td class="selectable"><a href="#"
									onclick="income_detail('${iDto.i_seq}')"> <fmt:formatNumber
											value="${iDto.i_money }" type="number" />원
								</a></td>
								<td class="selectable"><a href="#"
									onclick="income_detail('${iDto.i_seq}')">
										${iDto.i_fix.equals("Y")?"고정수입":"변동수입" } </a></td>
								<td class="selectable"><a href="#"
									onclick="income_detail('${iDto.i_seq}')"> <fmt:formatDate
											value="${iDto.i_regdate }" pattern="yyyy-MM-dd" />
								</a></td>
								<td class="selectable"><a href="#"
									onclick="income_detail('${iDto.i_seq}')"> ${iDto.i_memo } </a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
	<!------  ---------->
	<!---  상세내역 테이블   end---->
	<!------  ---------->
	

	
	
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
<div class="sixteen wide column for blank"></div>
	
	
	
</div>	
</body>
</html>