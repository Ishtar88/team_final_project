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
	지출정보 캔버스 처리
----------------------->
<script type="text/javascript">
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


	function spendingDetail2(seq){
		var url='spending_detail.do?seq='+seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop); 
	}

	function detailSearch(pick){
		var year=$(".spending_year").html();
		var month=$(".spending_month").html();
		$.ajax({
			url:"spendingDetailSearch.do",
			data:"pick="+pick+"&year="+year+"&month="+month,
			type:"get",
			datatype:"json",
			success:function(obj){
				var lists=obj["lists"];
				
				$(".spending_detail_body").children().remove();
				if (lists.length==0) {
					alert("지출이 없습니다.");
				}else if (pick=='date') {
					
					createDate(lists);
					
				}else if (pick=='category') {
					
					createCategory(lists);
					
				}else if (pick=='some') {
					
					createSome(lists);
					
				}

				
			}
			
		});
		
		function createDate(lists){

			var tdName=['p_name','p_detail','p_location','p_money','p_regdate'];
			
			var tableTop=document.getElementsByClassName("spending_detail_body");
			var stTable="<table class='spending_table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<input type='hidden' name='p_seq' value='"+lists[i]['p_seq']+"'>";
				stTr+="<td name='p_name'>"+lists[i]["p_name"];
				stTr+="<td name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td name='p_location'>"+lists[i]["p_location"];
				stTr+="<td name='p_some'>"+lists[i]["p_some"];
				stTr+="<td name='p_money'>"+lists[i]["p_money"]+"</tr>";
				
				stTable+=stTr;
				
			} 
			stTable+="</table>";
			$(".spending_detail_body").append(stTable);
			
		}
		
		function createCategory(lists){

			var tdName=['p_name','p_detail','p_location','p_money'];
			var tableTop=document.getElementsByClassName("spending_detail_body");
			var stTable="<table class='spending_table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<td name='p_name'>"+lists[i]["p_name"];
				stTr+="<td name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td name='p_location'>"+lists[i]["p_location"];
				stTr+="<td name='p_some'>"+lists[i]["p_some"];
				stTr+="<td name='p_money'>"+lists[i]["p_money"]+"</tr>";
				
				stTable+=stTr;
				
			} 
			stTable+="</table>";
			$(".spending_detail_body").append(stTable);
			
		}
		
		function createSome(lists){

			var tdName=['p_name','p_detail','p_location','p_money'];
			var tableTop=document.getElementsByClassName("spending_detail_body");
			var stTable="<table class='spending_table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<td name='p_name'>"+lists[i]["p_name"];
				stTr+="<td name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td name='p_location'>"+lists[i]["p_location"];
				stTr+="<td name='p_some'>"+lists[i]["p_some"];
				stTr+="<td name='p_money'>"+lists[i]["p_money"]+"</tr>";
				
				stTable+=stTr;
				
			} 
			stTable+="</table>";
			$(".spending_detail_body").append(stTable);
			
		}
		
		
		
	}
	
	function spendingInsert(){
		var url='spending_insert_page.do';
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}

	function spendingDetail(seq){
		
	}
	

</script>
<style type="text/css">
	body{position: relative;}
	.spending_header_wrap{
		text-align: center;
		border: 1px;
	}
	.spending_canvas_wrap,.spending_total_wrap,.spending_header_wrap{
		align-content: center;
	}
	.spending_body_wrap{
	
	}
	.spending_total_wrap{
		left: 500px;
		width: 200px; height: 350px;
		background-color: grey;
	}
	
</style>
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
</head>
<body>
<div class="spending_body_wrap">
		<header>
		<br>
			<div class="ui right aligned">
			    <a class="item" href="goal_main.do">목표관리</a>
			    <a class="item" href="acount.do?year=<%=year %>&month=<%=month%>">자산관리</a>
			    <a class="item" href="income_main.do?year=<%=year %>&month=<%=month%>">수입관리</a>
			    <a class="active item" href="spending_main.do?year=<%=year %>&month=<%=month%>">지출관리</a>
			    <a class="item" href="calendar_main.do?year=<%=year %>&month=<%=month%>">달력</a>
		    </div>
		    <br>
		    <div>
		    	<a class="active item" href="#" onclick="detailSearch('date')">날짜</a>
			    <a class="item" href="#" onclick="detailSearch('category')">카테고리</a>
			    <a class="item" href="#" onclick="detailSearch('some')">지불수단</a>
		    </div>
		    <br>
		</header>
		
		<div class="spending_canvas_wrap">
			<div id="chartContainer" style="height: 300px; width: 50%;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
		<div class="spending_total_wrap">
			<div class="spending_total_money">
				<span class="field">총지출: </span>
				<div class="field">
				<c:choose>
					<c:when test="${empty sumMoneyDto}">
						0원
					</c:when><c:otherwise>
						${sumMoneyDto.p_money }원
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="spending_money_top3">
				<table border="1">
					<tr>
						<td colspan="3"><span>지출액 TOP3</span></td>
					</tr>
					<tr>
						<th>순위</th>
						<th>지출명</th>
						<th>금액</th>
					</tr>
					<c:choose>
						<c:when test="${empty moneyDto }">
							<tr>
								<td colspan="3">이번달 지출이 없습니다.</td>
							</tr>
						</c:when><c:otherwise>
						<c:forEach items="${moneyDto }" var="dto">
							<tr>
								<td>${dto.p_card }</td>
								<td>${dto.p_name }</td>
								<td>${dto.p_money }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					<tr><td colspan="3">----------------------</td></tr>
					<tr>
						<td colspan="3"><span>지출건수 TOP3</span></td>
					</tr>
					<tr>
						<th>순위</th>
						<th>지출명</th>
						<th>지출건수</th>
					</tr>
					<c:choose>
						<c:when test="${empty countDto }">
							<tr>
								<td colspan="3">이번달 지출이 없습니다.</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${countDto }" var="dto">
								<tr>
									<td>${dto.p_card }</td>
									<td>${dto.p_name }</td>
									<td>${dto.p_count }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div>
	<div class="spending_body_wrap">
		<div class="spending_header_wrap">
			    <div>
				    <a class="item" href="#">수정</a>
				    <a class="item" href="#">삭제</a>
			    </div>
	    </div>
	</div>
	<div class="spending_insert_icon">
		<a href="#" onclick="spendingInsert()">지출등록</a>	
	</div>
	<div class="spending_header_wrap">
		<header>
			 <div class="spending_searchDate">
				 <a href="spending_main.do?year=<%=year-1 %>&month=<%=month%>" >◁◁</a>
				 <a href="spending_main.do?year=<%=year %>&month=<%=month-1%>" >◀</a>
			 	  	<span class="spending_year"><%=year %>년 </span>
			 	  	<span class="spending_month"><%=month%>월</span>
			     <a href="spending_main.do?year=<%=year %>&month=<%=month+1%>" >▶</a>
		  		 <a href="spending_main.do?year=<%=year+1 %>&month=<%=month%>" >▷▷</a>
			</div>
		</header>
	</div>
		  <!------  ---------->		
		<!---  지출정보 테이블   ---->
		  <!------  ---------->
		<div class="spending_body">
			<div class="spending_body">
				<header>
					<div>
						지출상세내역
					</div>
				</header>
				<div class="spending_detail_body">
					<table class="spending_detail">
						<tr>
							
						</tr>
					</table>
				</div>

			</div>
		</div>
		
	</div>
</body>
</html>