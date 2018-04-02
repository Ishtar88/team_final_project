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

	$(function(){
		
		var list=$(".acount_list").children().children();
		
		
		for (var i = 0; i < list.length; i++) {
			list.eq(i).attr("class","item");
		}
		
		list.eq(4).attr("class","active item");
		
	});
	
	$(".pickIsDate").show();
	$(".pickIsCategory").hide();
	$(".pickIsSome").hide();


	function spendingDetail2(seq){
		var url='spending_detail.do?seq='+seq;
		var prop='width=400px; height=650px;';
		
		open(url,'',prop); 
	}

	function detailSearch(pick){
		var year=$(".spending_year").html();
		var month=$(".spending_month").html();
		
		var list=$(".second_menu").children().children();
		
		
		for (var i = 0; i < list.length; i++) {
			list.eq(i).attr("class","item");
		}
			switch (pick) {
			case "date":
					list.eq(0).attr("class","active item");
				break;
			case "category":
				list.eq(1).attr("class","active item");
			break;
			case "some":
				list.eq(2).attr("class","active item");
			break;

			default:
				break;
			}

		
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
			var stTable="<table class='spending_table ui selectable gray table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<input type='hidden' name='p_seq' value='"+lists[i]['p_seq']+"'>";
				stTr+="<td class='selectable' name='p_name'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_name"]+"</a>";
				stTr+="<td class='selectable' name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td class='selectable' name='p_location'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_location"]+"</a>";
				stTr+="<td class='selectable' name='p_some'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_some"]+"</a>";
				stTr+="<td class='selectable' name='p_money'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_money"]+"원</a></tr>";
				
				stTable+=stTr;
				
			} 
			stTable+="</table>";
			$(".spending_detail_body").append(stTable);
			
		}
		
		function createCategory(lists){

			var tdName=['p_name','p_detail','p_location','p_money'];
			var tableTop=document.getElementsByClassName("spending_detail_body");
			var stTable="<table class='spending_table ui selectable gray table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<td class='selectable' name='p_name'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_name"]+"</a>";
				stTr+="<td class='selectable' name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td class='selectable' name='p_location'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_location"]+"</a>";
				stTr+="<td class='selectable' name='p_some'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_some"]+"</a>";
				stTr+="<td class='selectable' name='p_money'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_money"]+"원</a></tr>";
				
				stTable+=stTr;
				
			} 
			stTable+="</table>";
			$(".spending_detail_body").append(stTable);
			
		}
		
		function createSome(lists){

			var tdName=['p_name','p_detail','p_location','p_money'];
			var tableTop=document.getElementsByClassName("spending_detail_body");
			var stTable="<table class='spending_table ui selectable gray table' border='1'>";
				stTable+="<tr><th>지출명</th><th>지출상세</th><th>지출장소</th><th>지출수단</th><th>지출금액</th></tr>";
 			for (var i = 0; i < lists.length; i++) { //tr생성
				var stTr="<tr>";
				stTr+="<td class='selectable' name='p_name'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_name"]+"</a>";
				stTr+="<td class='selectable' name='p_detail'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_detail"]+"</a>";
				stTr+="<td class='selectable' name='p_location'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_location"]+"</a>";
				stTr+="<td class='selectable' name='p_some'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_some"]+"</a>";
				stTr+="<td class='selectable' name='p_money'><a href='#' onclick='spendingDetail2("+"\""+lists[i]["p_seq"]+"\""+")'>"+lists[i]["p_money"]+"원</a></tr>";
				
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
					var currentMoney=obj["currentMoney"];
					var avgMoney=obj["avgMoney"];
					var totalCount=obj["totalCount"];
					$(".spending_total_money").children().next().remove();
					$(".spending_avg_money").children().next().remove();
					$(".spending_total_count").children().next().remove();
					
					$(".pickIsDate").show();
					$(".pickIsCategory").hide();
					$(".pickIsSome").hide();
					
					if (currentMoney==null) {
						var cMoney="<td style='color:red;'>저장된 데이터가 없습니다.</td>";
						$(".spending_total_money").append(cMoney);
						
					}else{
						var cMoney="<td>"+currentMoney.p_money+"원</td>";
						$(".spending_total_money").append(cMoney);
					}
					if (avgMoney==null) {
						var aMoney="<td style='color:red;'>저장된 데이터가 없습니다.</td>";
						$(".spending_avg_money").append(aMoney);
					}else{
						var aMoney="<td>"+avgMoney.p_money+"원</td>";
						$(".spending_avg_money").append(aMoney);
					}
					if (totalCount==null) {
						var tCount="<td style='color:red;'>저장된 데이터가 없습니다.</td>";
						$(".spending_total_count").append(tCount);
					}else{
						var tCount="<td>"+totalCount.p_count+"회</td>";
						$(".spending_total_count").append(tCount);
					}
					
					
					
				}else if(pick=='category'){
					var sumMoneyDto=obj["sumMoneyDto"];
					var countDto=obj["countDto"];
					var moneyDto=obj["moneyDto"];
					
					$(".pickIsDate").hide();
					$(".pickIsCategory").show();
					$(".pickIsSome").hide();
				
				
				
				}else if(pick=='some'){
					var someTotal=obj["someTotal"];
					var someCount=obj["someCount"];
					$(".someMoney").children().remove();
					$(".someCount").children().remove();
					
					$(".pickIsDate").hide();
					$(".pickIsCategory").hide();
					$(".pickIsSome").show();
					
					if (someTotal==null) {
						var cMoney="<tr><td colspan='3'; style='color:red;'>저장된 데이터가 없습니다.</td></tr>";
						$(".someMoney").append(cMoney);
						
					}else{
						var cMoney="";
						for (var i = 0; i < someTotal.length; i++) {
							cMoney+="<tr><td>"+someTotal[i].p_seq+"</td><td>"+someTotal[i].p_some+"</td><td>"+someTotal[i].p_money+"원</td><td></tr>";
						}
						
						$(".someMoney").append(cMoney);
					}
					
					
					if (someCount==null) {
						var aMoney="<tr><td colspan='3'; style='color:red;'>저장된 데이터가 없습니다.</td></tr>";
						$(".someCount").append(aMoney);
					}else{
						
						var aMoney="";
						for (var i = 0; i < someCount.length; i++) {
							aMoney+="<tr><td>"+someCount[i].p_seq+"</td><td>"+someCount[i].p_some+"</td><td>"+someCount[i].p_count+"회</td><td></tr>";
						}
						
						$(".someCount").append(aMoney);
					}
					
					
					
				}
				
				
				
			},error:function(request,status,error){
				alert("sidebarSearch error! / "+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});//ajax 끝
		
	}
	
	function spendingInsert(){
		var url='spending_insert_page.do';
		var prop='width=400px; height=750px;';
		
		open(url,'',prop);
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
/* 	th{ */
/* 		text-align: center; */
/* 	} */
/* 	.spending_header_wrap{ */
/* 		text-align: center; */
/* 	} */
/* 	.spending_canvas_wrap,.spending_total_wrap,.spending_header_wrap{ */
/* 		align-content: center; */
/* 	} */

/* 	.spending_total_wrap{ */
/* 		width: 300px; height: 350px; */
/* 		position: absolute; left: 320px; top: 100px; */
/* 	} */
/* 	.pickIsDate,.pickIsSome{display: none;} */
/* 	.spending_header_wrap{ */
/* 		align-content: center; */
/* 	} */
/* 	.spending_detail_body{ */
/* 		width: 700px; */
/* 	} */
/* 	.pickIsSome{ */
/* 		position: absolute; left: 320px; top: 100px; */
/* 		width: 300px; height: 300px; */
/* 	} */
/* 	.spending_body,.spending_detail_body,.acount_Chart{ */
/* 		margin: auto; */
/* 	} */
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


<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->
<div class="ui grid">

<!-- 	second menu start -->
		<div class="sixteen wide column">
		    <div class="ui secondary pointing menu">
		    	<a class="active item" id="date" href="#" onclick="detailSearch('date')">날짜</a>
			    <a class="item" id="category" href="#" onclick="detailSearch('category')">카테고리</a>
			    <a class="item" id="some" href="#" onclick="detailSearch('some')">지불수단</a>
		    </div>
		</div>
<!-- 	second menu end -->		
		
<!-- --------------------------------------------------------------첫 레이아웃 줄  끝 -->


<!-- --------------------------------------------------------------2 레이아웃 줄 시작 -->

<!--  calendar start -->

	<div class="sixteen wide column ">
	<div class="spending_header_wrap">
		<header>
			 <div class="spending_searchDate">
				 <a href="spending_main.do?year=<%=year-1 %>&month=<%=month%>" ><i class="angle double left icon"></i></a>
				 <a href="spending_main.do?year=<%=year %>&month=<%=month-1%>" ><i class="angle left icon"></i></a>
			 	  	<span class="spending_year" style="color: black;"><%=year %>년</span>
			 	  	<span class="spending_month" style="color: black;"><%=month%>월</span>
			     <a href="spending_main.do?year=<%=year %>&month=<%=month+1%>" ><i class="angle right icon"></i></a>
		  		 <a href="spending_main.do?year=<%=year+1 %>&month=<%=month%>" ><i class="angle double right icon"></i></a>
			</div>
		</header>
	</div>
	</div>
	<br>
	
<!--  calendar end -->	
<!-- --------------------------------------------------------------2 레이아웃 줄  끝 -->

		
<!-- 공백 그리드  -->
<div class="wide column"></div>		
		
<!-- 		spending graph start  -->
	<div class="seven wide column">
		<div class="spending_canvas_wrap">
			<div id="chartContainer" style="height: 300px; width: 620px;"></div>
			<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		</div>
	</div>		
		
<!-- 		spending graph end  -->
		
	<div class="four wide column">
				<!-- 				 -->
				<!--  	pick:date  	-->
				<!--   사이드메뉴 상세내용   -->
				<!-- 				 -->
				<div class="pickIsDate">
					<table class="spending_total_wrap ui selectable compact table">
						<tr class="spending_total_money">
							<td class="field">당월 현재까지 사용 금액: </td>
						</tr>
						<tr class="spending_avg_money">
							<td>일 평균 지출액</td>
						</tr>
						<tr class="spending_total_count">
							<td>당월 총 결제 건수</td>
						</tr>
					</table>
				</div>
				<!-- 				 -->
				<!--  	pick:category  	-->
				<!--   사이드메뉴 상세내용   -->
				<!-- 				 -->
				<div class="pickIsCategory">
					<div class="spending_total_wrap">
						<div class="spending_money_top3">
							<table class="ui selectable compact table">
								<tr class="spending_total_money">
									<td class="field">총지출: </td>
									<td class="field">
									<c:choose>
										<c:when test="${empty sumMoneyDto}">
											원
										</c:when><c:otherwise>
											<fmt:formatNumber value="${sumMoneyDto.p_money }" type="number"/>
											원
										</c:otherwise>
									</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="text-align: center;"><span>지출액 TOP3</span></td>
								</tr>
								<tr>
									<th>순위</th>
									<th>지출명</th>
									<th>금액</th>
								</tr>
								<c:choose>
									<c:when test="${empty moneyDto }">
										<tr>
											<td colspan="3" style="text-align: center;">이번달 지출이 없습니다.</td>
										</tr>
									</c:when><c:otherwise>
									<c:forEach items="${moneyDto }" var="dto">
										<tr>
											<td class="categoryMoney_p_card">${dto.p_card }</td>
											<td class="categoryMoney_p_name">${dto.p_name }</td>
											<td class="categoryMoney_p_money">
											<fmt:formatNumber value="${dto.p_money }" type="number"/>원
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
								</c:choose>
								<tr><td colspan="3" style="text-align: center;"></td></tr>
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
											<td colspan="3" style="text-align: center;">이번달 지출이 없습니다.</td>
										</tr>
									</c:when><c:otherwise>
										<c:forEach items="${countDto }" var="dto">
											<tr>
												<td class="categoryCount_p_card">${dto.p_card }</td>
												<td class="categoryCount_p_name">${dto.p_name }</td>
												<td class="categoryCount_p_count">${dto.p_count }회</td>
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
							<table class="ui selectable compact table">
								<tr>
									<td colspan="3" style="text-align: center;"><span>지출액 TOP3</span></td>
								</tr>
								<tr>
									<th>순위</th>
									<th>지출수단</th>
									<th>금액</th>
								</tr>
								<tbody class="someMoney">
								</tbody>

								<tr><td colspan="3"></td></tr>
								<tr>
									<td colspan="3" style="text-align: center;"><span>지출건수 TOP3</span></td>
								</tr>
								<tr>
									<th>순위</th>
									<th>지출수단</th>
									<th>지출건수</th>
								</tr>
								<tbody class="someCount">
								</tbody>
								
							</table>
						</div>
					</div>
		</div>
		
		<!-- 공백 그리드  -->
<div class="three wide column"></div>		
		
		
	<div class="spending_insert_icon">
		<a href="#" onclick="spendingInsert()">
		<img alt="plus/minus_icon" class="st_icon" src="resources/icon/plus.png" style="width: 25px; height: 25px;">
		</a>	
	</div>

	
	
	
<!-- 	under construction ------------------------------------------------- -->
		  <!------  ---------->		
		<!---  지출정보 테이블   ---->
		  <!------  ---------->
<!-- 		<div class="spending_body"> -->
<!-- 			<div class="spending_body"> -->
<!-- 				<div class="spending_detail_body"> -->
<!-- 					<table class="spending_detail ui selectable gray table"> -->
<%-- 					<caption>지출상세내역</caption> --%>
<!-- 						<tr> -->
							
<!-- 						</tr> -->
<!-- 					</table> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	under construction ------------------------------------------------- -->
		
	</div>
</body>
</html>