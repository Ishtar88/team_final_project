<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function searchItem() {
		var search = $("input[name=search]").val();
		var category = $("select[name=category]").val();
		var r_detail = $("input[name=r_detail]").val();
		
		if(search==""){
			alert("검색어를 입력 해 주세요");
		}else{
			$.ajax({
				url : "findReward.do",
				data : "category=" + category + "&search=" + search + "&r_detail="
						+ r_detail + "&sNum=1&eNum=8",
				type : "post",
				datetype : "json",
				success : function(obj) {
					if (obj["list"][0] == null) {
						alert("검색 내역이 없습니다.");
					} else {
						//alert(obj["pcount"]);
						makeTable(obj);
					}
				}
			});
		}

		
	}

	function makeTable(obj) {
		var lists = obj.list;
		$("#all").remove();
		$("#searchResult").children().remove();

		var str = "";
		for (var i = 0; i < lists.length; i++) {
			var rdto = lists[i];
			if (i % 4 == 0) {
				str += "<tr class='tr'>";
			}
			str += "<td><div><img id='img' alt='상품 이미지' src='resources/upload/" + rdto.r_file + "'></div>"
					+ "<div>" + rdto.r_name + "</div>" + "<div>" + rdto.r_point
					+ "</div>" + "<div>" + rdto.b_name.b_name + "</div>"
					+"<div class='ui purple basic button' onclick='buyReward(\""+rdto.r_seq+"\")'>일반구매</div>"
					+"<div class='ui pink basic button' onclick='dobakReward(\""+rdto.r_seq+"\")'>뽑기</div></td>";
			if (i % 4 == 3) {
				str += "</tr>";
			}

		}
		$("#searchResult").append(str);
	}

	// 	var str2="";
	// 	function makePaging(pcount){
	// 		var search = $("input[name=search]").val();
	// 		var category = $("select[name=category]").val();
	// 		var r_detail = $("input[name=r_detail]").val();

	// 		for (var i = 0; i < pcount; i++) {
	// 			str+="<tr><a href='findReward.do?category="+category+"&search="+search+"&r_detail="+r_detail+"&sNum="+i<1?1:1+(i*8)+"&eNum="+i<1?8:(i+1)*8+"</a>"+i+1+"</tr>'";
	// 		}
	// 		$(".tr").next(str2);
	// 	}

	function buyReward(r_seq) {
		window.open("rewardForm.do?r_seq=" + r_seq, "리워드상품 구매",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}

	function searchAll() {
		var r_detail = $("input[name=r_detail]").val();
		location.href = "listOfCategory.do?r_detail=" + r_detail
				+ "&sNum=1&eNum=8";
	}
	
	function dobakReward(r_seq) {
		window.open("dobakForm.do?r_seq=" + r_seq, "리워드상품 뽑기",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}
</script>
<style type="text/css">
#img {
	width: 150px;
	height: 150px;
}

.field {
	display: inline-block;
	width: 150px;
}
</style>
</head>
<body>
<div class="ui grid">

<div class="sixteen wide column"></div>
<div class="sixteen wide column"></div>

<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->

<!-- search part start -->

    <!-- 공백 그리드  -->
<div class="three wide column"></div>

<div id="search" class="ten wide column">
	<div class="field">
		<select class="ui fluid search dropdown" name="category">
			<option value="r_name">제품이름</option>
			<option value="b_name">브랜드</option>
		</select>
	</div>
	<div class="ui icon input">
		<input type="text" placeholder="Search..." name="search">
		<button class="ui yellow button" onclick="searchItem()">검색</button>
		<button class="ui olive button" onclick="searchAll()">전체검색</button>
	</div>
	<input type="hidden" value="${r_detail}" name="r_detail" />
</div>
<!-- search part end -->

    <!-- 공백 그리드  -->
<div class="three wide column"></div>

<!-- --------------------------------------------------------------첫 레이아웃 줄 끝-->    

<!-- --------------------------------------------------------둘째 레이아웃 줄 시작 -->

    <!-- 공백 그리드  -->
<div class="three wide column"></div>

	<div class="ten wide column">
	<table id="all" class="ui table">
		<c:set var="i" value="0" />
		<c:set var="j" value="4" />
		<c:forEach items="${list}" var="rdto">
			<c:if test="${i%j==0}">
				<tr>
			</c:if>
			<td>
				<div>
					<input type="hidden" value="${rdto.r_seq}" name="seq" />
				</div>
				<div>
					<img id="img" alt="상품 이미지" src="resources/upload/${rdto.r_file}">
				</div>
				<div>${rdto.r_name}</div>
				<div>${rdto.b_name.b_name}</div>
				<div>${rdto.r_point}p</div>
				<div class="ui purple basic button" onclick="buyReward('${rdto.r_seq}')">일반구매</div>
				<div class="ui pink basic button" onclick="dobakReward('${rdto.r_seq}')">뽑기</div>
				<input type="hidden" value="${rdto.r_seq}" name="r_seq"/>
			</td>
			<c:if test="${i%j==j-1}">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1}" />
		</c:forEach>

		<tr>
			<td style="text-align: center;" colspan="4">
			 <div class="ui right floated pagination menu">

				<c:forEach var="i" begin="0" end="${pcount-1}" step="1">
					<a class="item"
						href="listOfCategory.do?r_detail=${r_detail}&sNum=${i<1?'1':1+(i*8)}&eNum=${i<1?'8':(i+1)*8}">${i+1}</a>
				</c:forEach>

				</div>
				</td>
		</tr>
		
	</table>
	</div>
	
	    <!-- 공백 그리드  -->
<div class="three wide column"></div>


<div class="three wide column"></div>
<div class="ten wide column">
	<table id="searchResult" class="ui table">

	</table>
</div>
	<div class="three wide column"></div>
	
</div>
</body>
</html>