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
<table class="fund_detail">
	<tr>
		<th>펀드명</th>
		<td>
			<input type="text" name="f_name" value="${fDto.f_name }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>투자원금</th>
		<td>
			<input type="text" name="f_money" value="${fDto.f_money }" readonly="readonly">
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
			<input type="text" name="f_add" value="${fDto.f_add }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>매수날짜</th>
		<td>
			<input type="date" name="f_buydate" value="${fDto.f_buydate }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>만기날짜</th>
		<td>
			<input type="date" name="f_enddate" value="${fDto.f_enddate }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
			<input type="text" name="f_memo" value="${fDto.f_memo }" readonly="readonly">
		</td>
	</tr>

	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='fund_update_page.do?seq='+${fDto.f_seq}">
			<input type="button" value="삭제" onclick="location.href='fund_delete.do?seq='+${fDto.f_seq}">
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
</table>
</body>
</html>