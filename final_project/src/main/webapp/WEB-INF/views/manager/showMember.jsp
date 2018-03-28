<%@page import="java.util.List"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<jsp:useBean id="util" class="com.jsr.project.util.Util" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>회원 정보 보기</title>
</head>
<style type="text/css">
.field {
	display: inline-block;
	width: 150px;
}

</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function searchUser() {
	var category = $("select[name=category]").val();
	var search = $("input[name=search]").val();
	
	if(search==""){
		alert("검색어를 입력 해 주세요");
	}else{
		$.ajax({
			url : "searchUser.do",
			data : "category=" + category + "&search=" + search,
			type : "post",
			datetype : "json",
			success : function(obj) {
				//alert(obj["list"][0]["id"]);
				if (obj["list"][0]== null) {
					alert("검색 내역이 없습니다.");
				} else {
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
	$("#searchResult").append("<thead><tr id='searchResult2'><th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th><th>성별</th><th>등급</th><th>주소</th><th>가입일</th><th>탈퇴여부</th></tr></thead>");
	for (var i = 0; i < lists.length; i++) {
		var mdto = lists[i];
		
		str += "<tr><td>"+ mdto.id + "</td><td>"+mdto.m_name+"</td><td>"+mdto.m_email+"</td><td>"+mdto.m_phone+"</td><td>"+mdto.m_gender+
		"</td><td>"+mdto.m_grade+"</td><td>"+mdto.m_address+"</td><td>"+mdto.m_regDate+"</td><td>"+mdto.m_useable+"</td></tr>";
		

	}
	$("#searchResult2").after(str);
}


</script>
<body>
	<div class="field">
		<select class="ui fluid search dropdown" name="category">
			<option value="id">아이디</option>
			<option value="m_name">이름</option>
			<option value="m_phone">전화번호</option>
		</select>
	</div>
	<div class="ui icon input">
		<input type="text" placeholder="Search..." name="search">
		<button class="ui yellow button" onclick="searchUser()">검색</button>
		<button class="ui olive button" onclick="searchAll()">전체검색</button>
	</div>

	<!-- 회원정렬-->
	<table class="ui single line table" id="all">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>성별</th>
			<th>등급</th>
			<th>주소</th>
			<th>가입일</th>
			<th>탈퇴여부</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="17">가입한 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="mdto">
					<tr>
						<td>${mdto.id}</td>
						<td>${mdto.m_name}</td>
						<td>${mdto.m_email}</td>
						<td>${mdto.m_phone}</td>
						<td>${mdto.m_gender}</td>
						<td>${mdto.m_grade}</td>
						<td>${mdto.m_address}</td>
						<td><f:formatDate value="${mdto.m_regDate}"
								pattern="yyyy-MM-dd" /></td>
						<td>${mdto.m_useable}</td>

						<td>
							<div class="ui button" onclick="deleteMember(${dto.id})">탈퇴</div>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
	</table>

	<table id="searchResult" class="ui single line table">

	</table>
</body>
</html>


