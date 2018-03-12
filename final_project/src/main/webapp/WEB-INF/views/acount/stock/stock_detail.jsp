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
<table class="stock_detail">
	<tr>
		<th>주식명</th>
		<td>
			<input type="text" name="s_name" value="${sDto.st_name }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>구매수량</th>
		<td>
			<input type="text" name="st_count" value="${sDto.st_count }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>매수금액</th>
		<td>
			<input type="text" name="st_money" value="${sDto.st_money }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>손익률</th>
		<td>
			<input type="text" name="s_inter" value="${sDto.st_money/sDto.st_add }%" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>총 평가금액</th>
		<td>
			<input type="text" name="st_add" value="${sDto.st_add*st_count }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>매수날짜</th>
		<td>
			<input type="date" name="st_buydate" value='<fmt:formatDate value="${sDto.st_buydate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
			<input type="text" name="st_memo" value="${sDto.st_memo }" readonly="readonly">
		</td>
	</tr>

	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='acount_update_page.do?acount=stock&seq='+${sDto.st_seq}">
			<input type="button" value="삭제" onclick="location.href='acount_delete.do?acount=stock&seq='+${sDto.st_seq}">
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
</table>
</body>
</html>