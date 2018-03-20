<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
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

	$.ajax({
		url : "findReward.do",
		data : "category=" + category + "&search=" + search+ "&r_detail=" + r_detail,
		type : "post",
		datetype : "json",
		success : function(obj) {
			if(obj["list"][0]==null){
				alert("검색 내역이 없습니다.");
			}else{
				makeTable(obj);
			}
		}
	});
}

function makeTable(obj) {
	var lists = obj.list;
	$("#all").remove();
	$("#searchResult").children().remove();

	var str="";
	for (var i = 0; i < lists.length; i++) {
		var rdto = lists[i];
		if(i%4==0){
		str+="<tr class='tr'>";
		}
		str+="<td><div onclick='buyReward("+rdto.r_seq+")'><img alt='상품 이미지' src='resources/upload/" + rdto.r_file + "'></div>"
		+ "<div>" + rdto.r_name + "</div>" + "<div>"
		+ rdto.r_point + "</div>" + "<div>"
		+ rdto.b_name.b_name + "</div></td>";
		if(i%4==3){
			str+="</tr>";
		}
		
	}
		$("#searchResult").append(str);
}


function buyReward(r_seq) {
	window.open("rewardForm.do?r_seq="+r_seq, "리워드상품 구매",
			'location=yes,height=570,width=520,scrollbars=yes,status=yes');
}

function searchAll(){
	var r_detail = $("input[name=r_detail]").val();
	location.href="listOfCategory.do?r_detail="+r_detail;
}
</script>
<style type="text/css">
img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<body>
	<a href="rewardMain.do">main</a>

	<select name="category">
		<option value="r_name">제품이름</option>
		<option value="b_name">브랜드</option>
	</select>
	<input type="text" name="search" />
	<input type="button" value="검색" onclick="searchItem()" />
	<input type="button" value="전체검색" onclick="searchAll()" />
	<input type="hidden" value="${r_detail}" name="r_detail" />

	<table id="all">
		<c:set var="i" value="0" />
		<c:set var="j" value="4" />
		<c:forEach items="${list}" var="rdto">
			<c:if test="${i%j==0}">
				<tr>
			</c:if>
			<td>
				<div onclick="buyReward('${rdto.r_seq}')">
					<div>
						<input type="hidden" value="${rdto.r_seq}" name="seq" />
					</div>
					<div>
						<img alt="상품 이미지" src="resources/upload/${rdto.r_file}">
					</div>
					<div>${rdto.r_name}</div>
					<div>${rdto.b_name.b_name}</div>
					<div>${rdto.r_point}p</div>
				</div>
			</td>
			<c:if test="${i%j==j-1}">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1}" />
		</c:forEach>
	</table>


	<table id="searchResult">

	</table>
</body>
</html>