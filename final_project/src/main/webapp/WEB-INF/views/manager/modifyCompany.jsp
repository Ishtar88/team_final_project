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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function updateCompany(el) {
		var b_seq=$(el).parent().parent().children().children().val();
		var b_name=$(el).parent().parent().children().eq(1).children().val();
		var b_num=$(el).parent().parent().children().eq(2).children().val()
		var b_address=$(el).parent().parent().children().eq(3).children().val()
		var b_tel=$(el).parent().parent().children().eq(4).children().val()
		var deal=$(el).parent().parent().children().eq(6).children().val()

		location.href = "updateCompany.do?b_seq=" + b_seq + "&b_name=" + b_name
				+ "&b_num=" + b_num + "&b_address=" + b_address + "&b_tel="
				+ b_tel + "&deal=" + deal;
	}
</script>
<c:if test="${isS}">
	<script type="text/javascript">
		alert("변경이 완료되었습니다.");
		location.href = "modifyCompany.do";
	</script>
</c:if>
</head>
<body>
<div class="ui secondary pointing menu">
  <a class="item" href="insertReward.do">
   상품등록
  </a>
  <a class="item" href="rewardList.do">
   상품정보수정
  </a>
  <a class="item" href="insertCompanyGo.do">
    기업등록
  </a>
  <a class="active item" href="company.do">
    기업정보수정
  </a>
</div>
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
				<th></th>
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
							<td><input type="hidden" name="b_seq" value="${dto.b_seq}" />${dto.b_seq}</td>
							<td><input type="text" name="b_name" value="${dto.b_name}" /></td>
							<td><input type="text" name="b_num" value="${dto.b_num}" /></td>
							<td><input type="text" name="b_address"
								value="${dto.b_address}" /></td>
							<td><input type="text" name="b_tel" value="${dto.b_tel}" /></td>
							<td><f:formatDate value="${dto.b_regDate}" pattern="yyyy-MM-dd"/></td>
							<td><c:set var="deal" value="${dto.deal}" /> <select
								name="deal">
									<option value="Y" ${deal eq "Y"?"selected":""}>Y</option>
									<option value="N" ${deal eq "N"?"selected":""}>N</option>
							</select></td>
							<td><button class="ui olive button"
									onclick="updateCompany(this)">수정완료</button></td>
						</tr>
					</c:forEach>

				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</body>
</html>