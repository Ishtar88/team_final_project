<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
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
	
	function deleteGoal(g_seq){
		location.href="goal_delete.do?g_seq="+g_seq;
	}
</script>
</head>
<body>
	<div class="ui grid">
		<div class="three wide column"></div>
		<div class="ten wide center aligned column">
			<div class="ui message center aligned column">
			
				<h2>목표수정</h2>
				
				
				<form action="goal_update.do" method="post">
					<div class="ui middle aligned input">
						<label>총예산</label> <input type="text"
							value="${totalMoneyDto.g_money }" readonly="readonly">
						<div class="">원</div>
					</div>
					<c:choose>
						<c:when test="${empty goalAllSearchList }">
							<div>설정한 목표가 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${goalAllSearchList }" var="dto">
								<div class="row">
									<div id="insertAcount" class="ui middle aligned input column">
										<input type="hidden" name="g_seq" value="${dto.g_seq }">
										<input type="text" name="g_money" value="${dto.g_money }">
										<span>&nbsp;&nbsp;</span>
										<input type="text" name="g_name" value="${dto.g_name }">
										<span>&nbsp;&nbsp;</span>
										<input type="text" name="g_memo" value="${dto.g_memo }">
										<span>&nbsp;&nbsp;</span>
										<i class="minus circle icon" onclick="deleteGoal('${dto.g_seq }')"></i>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
					<div class="ui button" onclick="location.href='goal_main.do'">취소</div>
					<button class="ui right aligned olive button">수정완료</button>
				</form>
				
			</div>
		</div>

		<div class="three widecolumn"></div>
	</div>
</body>
</html>