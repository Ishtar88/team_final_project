<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<title>Home</title>
</head>
<style type="text/css">
.ui.middle.aligned.input.column {
	margin: 5px;
}

.ui.grid {
	margin-top: 40px;
}

#purple {
	background-color: purple;
}
</style>
<script type="text/javascript">
	function addAcount() {
		var val = $("#insertAcount").children().eq(0).val();
		alert(val);
	}
</script>
<body>

	<div class="ui grid">
		<div class="three wide column"></div>
		<div class="ten wide center aligned column">
			<div class="ui message center aligned column">
				<h2>목표설정</h2>
				<div class="ui middle aligned input">
					<label>총예산</label> <input type="text"
						value="${totalMoneyDto.g_money }" readonly="readonly">
					<div class="">원</div>
				</div>
<!-- 				<table class="ui single line table"> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${empty goalAllSearchList }"> --%>
<!-- 							<tr> -->
<!-- 								<td colspan="3">설정한 목표가 없습니다.</td> -->
<!-- 							</tr> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 						<tr> -->
<!-- 						<th>금액</th> -->
<!-- 						<th>카테고리</th> -->
<!-- 						<th>메모</th> -->
<!-- 					</tr> -->
<%-- 							<c:forEach items="${goalAllSearchList }" var="dto"> --%>
<!-- 								<tr> -->
<!-- 									<td> -->
<%-- 										<input type="text" name="g_money" value="${dto.g_money }"> --%>
<%-- 										<input type="text" name="g_name" value="${dto.g_name }"> --%>
<%-- 										<input type="text" name="g_memo" value="${dto.g_memo }"> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
					

<!-- 				</table> -->

				<c:choose>
					<c:when test="${empty goalAllSearchList }">
						<div>설정한 목표가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${goalAllSearchList }" var="dto">
							<div class="row">
								<div id="insertAcount" class="ui middle aligned input column">
									<input type="text" name="g_money" value="${dto.g_money }" readonly="readonly">
									<span>&nbsp;&nbsp;</span>
									<input type="text" name="g_name" value="${dto.g_name }" readonly="readonly">
									<span>&nbsp;&nbsp;</span>
									<input type="text" name="g_memo" value="${dto.g_memo }" readonly="readonly">
									<span>&nbsp;&nbsp;</span>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>


				<button class="ui right aligned olive button"
					onclick="location.href='goal_insert_page.do'">목표설정</button>
				<button class="ui right aligned button"
					onclick="location.href='goal_update_page.do'">목표수정</button>
			</div>
		</div>

		<div class="three widecolumn"></div>
	</div>
</body>
</html>
