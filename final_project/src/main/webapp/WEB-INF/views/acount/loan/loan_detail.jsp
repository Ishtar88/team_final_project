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
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<table class="loan_detail">
	<tr>
		<th>대출명</th>
		<td>
			<input type="text" name="l_name" value="${sDto.st_name }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>대출원금</th>
		<td>
			<input type="text" name="l_money" value="${lDto.l_money }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>대출상환금</th>
		<td>
			<input type="text" name="l_remane" value="${lDto.l_remane }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>시작날짜</th>
		<td>
			<input type="date" name="l_startdate" value='<fmt:formatDate value="${lDto.l_startdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>만기날짜</th>
		<td>
			<input type="date" name="l_enddate" value='<fmt:formatDate value="${lDto.l_enddate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
			<input type="text" name="l_memo" value="${lDto.l_memo }" readonly="readonly">
		</td>
	</tr>

	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='acount_update_page.do?acount=loan&seq='+${lDto.l_seq}">
			<input type="button" value="삭제" onclick="location.href='acount_delete.do?acount=loan&seq='+${lDto.l_seq}">
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
</table>
</body>
</html>