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
<title>Insert title here</title>
<script type="text/javascript">
	function modifyCompany() {
		location.href = "modifyCompany.do";
	}
</script>
</head>
<body>
	<div class= "ui grid">
	
	<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->
	
	
	<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
	<div class="twelve wide column">
	<div class="ui secondary pointing menu">
		<a class="active item" href="insertReward.do"> 상품등록 </a> 
		<a class="active item" href="rewardList.do"> 상품정보수정 </a>
		<a class="item" href="insertCompanyGo.do"> 기업등록 </a> 
		<a class="item" href="company.do"> 기업정보수정 </a>
	</div>
	</div>
	
	<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
	<!-- --------------------------------------------------------------첫 레이아웃 줄 끝-->    
	
	<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
	<div class="ten wide column">
	<table class="ui single line table">
		<thead>
			<tr>
				<th>번호</th>
				<th>회사명</th>
				<th>사업자등록번호</th>
				<th>회사주소</th>
				<th>회사연락처</th>
				<th>등록일</th>
				<th>거래여부</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty lists}">
					<tr>
						<td colspan="6">등록된 회사가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists}" var="dto">
						<tr>
							<td>${dto.b_seq}</td>
							<td><input type="text" name="b_name" value="${dto.b_name}"
								readonly="readonly" /></td>
							<td><input type="text" name="b_name" value="${dto.b_num}"
								readonly="readonly" /></td>
							<td><input type="text" name="b_name"
								value="${dto.b_address}" readonly="readonly" /></td>
							<td><input type="text" name="b_name" value="${dto.b_tel}"
								readonly="readonly" /></td>
							<td><f:formatDate value="${dto.b_regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:set var="deal" value="${dto.deal}" /> <select
								name="deal">
									<option value="Y" ${deal eq "Y"?"selected":""}>Y</option>
									<option value="N" ${deal eq "N"?"selected":""}>N</option>
							</select></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="7">
							<div class="ui button" onclick="modifyCompany()">수정</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	</div>
	
	<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
	</div>
</body>
</html>