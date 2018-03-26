<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.income_form_body_wrap{
		width: 300px;
	}
</style>
</head>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<body>
<form action="income_insert.do" method="post" onsubmit="return income_insert()">
<div class="income_form_body_wrap">
	<table class="income_form_body ui olive table">
		<tr>
			<td>
			수입명
								<i class="ellipsis vertica icon"></i>
				<div class="ui input">
				<input type="text" name="i_name" value="${iDto.i_name }" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			상세내용
								<i class="ellipsis vertica icon"></i>
				<div class="ui input">
				<input type="text" name="i_memo" value="${iDto.i_memo }" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			금액
								<i class="ellipsis vertica icon"></i>
				<div class="ui input">
				<input type="text" name="i_money" value="${iDto.i_money }" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			고정여부
								<i class="ellipsis vertica icon"></i>
				<div class="ui input">
				<input type="radio" name="i_fix" value="Y">고정수입 &nbsp;
				<input type="radio" name="i_fix" value="N">변동수입
				</div>
			</td>
		</tr>
				<c:choose>
					<c:when test="${command.equals('calendar') }">
						<tr>
							<td colspan="2">
								<button class="ui olive button">등록</button>
								<div class="ui orange button" onclick="location.href='calendar_detail.do?searchDate=${searchDate}'">돌아가기</div>
							</td>
						</tr>
					</c:when><c:otherwise>
						<tr>
							<td colspan="2">
								<button class="ui olive button">등록</button>
								<div class="ui orange button" onclick="self.close()">취소</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
		</table>
	</div>
</form>
</body>
</html>