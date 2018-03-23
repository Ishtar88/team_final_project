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


<script type="text/javascript">


	function spendingDetail2(seq){
		var url='spending_detail.do?seq='+seq;
		var prop='width=600px; height=600px;';
		
		open(url,'',prop); 
	}

	function detailSearch(pick){
		var year=$(".spending_year").html();
		var month=$(".spending_month").html();
		
		//지출상세내역 조회
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
		
		
		//메뉴별 차트 조회내역
			$.ajax({
				url:"spendingChartSearch.do",
				data:"year="+year+"&month="+month+"&pick="+pick,
				datatype:"json",
				success:function(obj){
					var lists=obj["lists"];
					
					if (pick=='date') {
						
						var finals=[];
						var date='';
						
						for (var i = 0; i < lists.length; i++) {
							date=obj.lists[i].p_regdate;
							
							finals.push({y:obj.lists[i].p_money, x:date});
						}
		
		
						var chart = new CanvasJS.Chart("chartContainer", {
							animationEnabled: true,
							theme: "light1", // "light1", "light2", "dark1", "dark2"
							title:{
								text: "날짜별 총 금액"
							},
							axisY: {
								title: ""
							},
							data: [{        
								type: "column",  
								showInLegend: true, 
								legendMarkerColor: "blue",
								legendText: "날짜별 총액",
								xValueType: "dateTime",
								xValueFormatString: "YYYY MM DD",
								dataPoints: finals
							}]
						});
						chart.render();
		
						
						
					}else if (pick=='category') {
						
						var finals=[];
						
						for (var i = 0; i < lists.length; i++) {
							finals.push({y:obj.lists[i].p_money, label:obj.lists[i].p_name})
						}
						
						var chart = new CanvasJS.Chart("chartContainer", {
							animationEnabled: true,
							theme: "light2", // "light1", "light2", "dark1", "dark2"
							title:{
								text: "카테고리별 총 금액"
							},
							axisY: {
								title: ""
							},
							data: [{        
								type: "column",  
								showInLegend: true, 
								legendMarkerColor: "orange",
								legendText: "카테고리별 총액",
								dataPoints: finals
							}]
						});
						chart.render();
				
				}else if (pick='some') {
					
					var finals=[];
					
					for (var i = 0; i < lists.length; i++) {
						finals.push({y:obj.lists[i].p_money, label:obj.lists[i].p_some})
					}
					
					var chart = new CanvasJS.Chart("chartContainer", {
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
							dataPoints: finals
						}]
					});
					chart.render();
					
				}
					
			},error:function(request,status,error){
				alert("chartSearch error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
			}); //ajax 끝
		
		//sidebar 상세내역
		$.ajax({
			url:"spendingSideSearch.do",
			data:"year="+year+"&month="+month+"&pick="+pick,
			datatype:"json",
			success:function(obj){
				
				
				if (pick=='date') {
					
					
					
				}else if(pick=='category'){
				
				
				
				
				
				}else if(pick=='some'){
					
					
					
				}
				
				
				
			},error:function(request,status,error){
				alert("sidebarSearch error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});//ajax 끝
		
	}
	
	function spendingInsert(){
		var url='spending_insert_page.do';
		var prop='width=600px; height=600px;';
		
		open(url,'',prop);
	}

	function spendingDetail(seq){
		
	}
	

</script>
<!----------------------
	지출정보 캔버스 처리
----------------------->
<script type="text/javascript">
window.onload = function () {
	
	var year=$(".spending_year").html();
	var month=$(".spending_month").html();
	
	$.ajax({
		url:"spendingChartSearch.do",
		data:"pick=date&year="+year+"&month="+month,
		datatype:"json",
		success:function(obj){
			var lists=obj["lists"];
				
				var finals=[];
				var date='';
				
				for (var i = 0; i < lists.length; i++) {
					date=obj.lists[i].p_regdate;
					finals.push({x:date,y:obj.lists[i].p_money });
				}


				var chart = new CanvasJS.Chart("chartContainer", {
					animationEnabled: true,
					title: {
						text: "날짜별 지출금액"
					},
					axisX: {
						title: "날짜별"
					},
					axisY: {
						title: "금액",
						suffix: "원"
					},
					data: [{
						type: "line",
						name: "CPU Utilization",
						connectNullData: true,
						//nullDataLineDashType: "solid",
						xValueType: "dateTime",
						dataPoints: finals
					}]
				});
				chart.render();

		},error:function(request,status,error){
			alert("error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	}); //ajax 끝

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
	.pickIsDate,.pickIsSome{display: none;}
	
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
				<!-- 				 -->
				<!--  	pick:date  	-->
				<!--   사이드메뉴 상세내용   -->
				<!-- 				 -->
				<div class="pickIsDate">
					<div class="spending_total_wrap">
						<div class="spending_total_money">
							<span class="field">당월 현재까지 사용 금액: </span>
							<div class="field">
							<c:choose>
								<c:when test="${empty currentMoney}">
									0원
								</c:when><c:otherwise>
									${currentMoney.p_money}원
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						<div class="spending_avg_money">
							<p>일 평균 지출액</p>
							<div class="field">
								<c:choose>
									<c:when test="${empty avgMoney}">
										0원
									</c:when><c:otherwise>
										${avgMoney.p_money }원
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="spending_total_count">
							<p>당월 총 결제 건수</p>
							<div class="field">
								<c:choose>
									<c:when test="${empty totalCount}">
										0원
									</c:when><c:otherwise>
										${totalCount.p_count }회
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<!-- 				 -->
				<!--  	pick:category  	-->
				<!--   사이드메뉴 상세내용   -->
				<!-- 				 -->
				<div class="pickIsCategory">
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
				</div>
				<!-- 				 -->
				<!--  	pick:some  	-->
				<!--   사이드메뉴 상세내용   -->
				<!-- 				 -->
				<div class="pickIsSome">
					<div class="spending_money_top3">
							<table border="1">
								<tr>
									<td colspan="3"><span>지출액 TOP3</span></td>
								</tr>
								<tr>
									<th>순위</th>
									<th>지출수단</th>
									<th>금액</th>
								</tr>
								<c:choose>
									<c:when test="${empty someTotal }">
										<tr>
											<td colspan="3">이번달 지출이 없습니다.</td>
										</tr>
									</c:when><c:otherwise>
									<c:forEach items="${someTotal }" var="dto">
										<tr>
											<td>${dto.p_seq }</td>
											<td>${dto.p_some }</td>
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
									<th>지출수단</th>
									<th>지출건수</th>
								</tr>
								<c:choose>
									<c:when test="${empty someCount }">
										<tr>
											<td colspan="3">이번달 지출이 없습니다.</td>
										</tr>
									</c:when><c:otherwise>
										<c:forEach items="${someCount }" var="dto">
											<tr>
												<td>${dto.p_seq }</td>
												<td>${dto.p_some }</td>
												<td>${dto.p_count }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
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