<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<script type="text/javascript">

	function income_insert(){
		
	}
</script>
<body>
<form action="income_insert.do" method="post" onsubmit="return income_insert()">
	<table class="income_form_body">
		<tr>
			<th>수입명</th>
			<td>
				<input type="text" name="i_name" required="required">
			</td>
		</tr>
		<tr>
			<th>상세내용</th>
			<td>
				<input type="text" name="i_memo" required="required">
			</td>
		</tr>
		<tr>
			<th>금액</th>
			<td>
				<input type="text" name="i_money" required="required">
			</td>
		</tr>
		<tr>
			<th>고정여부</th>
			<td>
				<input type="radio" name="i_fix" value="Y">고정수입 &nbsp;
				<input type="radio" name="i_fix" value="N">변동수입
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="취소" onclick="self.close()">
			</td>
		</tr>
	</table>
</form>
</body>
</html>