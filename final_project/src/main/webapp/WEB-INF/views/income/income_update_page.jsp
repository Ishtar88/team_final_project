<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<form action="income_update.do" method="post">
<table class="income_update_page">
	<tr>
		<th>수입명</th>
		<td>
			<input type="text" name="i_name" value="${iDto.i_name }">
		</td>
	</tr>
	<tr>
		<th>상세내용</th>
		<td>
			<input type="text" name="i_memo" value="${iDto.i_memo }">
		</td>
	</tr>
	<tr>
		<th>금액</th>
		<td>
			<input type="text" name="i_money" value="${iDto.i_money }">
		</td>
	</tr>
	<tr>
		<th>고정여부</th>
		<td>
			<input type="text" name="i_fix" value="${iDto.i_fix.equals('Y')?'고정수입':'변동수입' }" placeholder="고정수입:Y / 변동수입:N">
		</td>
	</tr>
	<tr>
		<th>등록날짜</th>
		<td>
			<input type="date" name="reg_date" value='<fmt:formatDate value="${iDto.i_regdate }" pattern="yyyy-MM-dd"/>'>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="완료">
			<input type="button" value="취소" onclick="location.href='income_cancel.do?seq='+${iDto.i_seq }">
		</td>
	</tr>
</table>
</form>
</body>
</html>