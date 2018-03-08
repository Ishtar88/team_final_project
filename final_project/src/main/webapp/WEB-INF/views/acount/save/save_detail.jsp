<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
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
<table>
	<tr>
		<th>저축분류</th>
		<td>
			<input type="text" name="s_name" value="${svDto.s_name }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>저축/적금/보험명</th>
		<td>
			<input type="text" name="s_detail" value="${svDto.s_detail }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>매달저축금액</th>
		<td>
			<input type="text" name="s_money" value="${svDto.s_money }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>현재금액</th>
		<td>
			<input type="text" name="s_add" value="${svDto.s_add }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>세율</th>
		<td>
			<input type="text" name="s_tax" value="${svDto.s_tax }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>시작날짜</th>
		<td>
			<input type="date" name="s_startdate" value="${svDto.s_startdate }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>만기날짜</th>
		<td>
			<input type="date" name="s_enddate" value="${svDto.s_enddate }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
			<input type="text" name="s_memo" value="${svDto.s_memo }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='save_update_page.do?seq='+${svDto.s_seq}">
		</td>
		<td>
			<input type="button" value="삭제" onclick="location.href='save_delete.do?seq='+${svDto.s_seq}">
		</td>
	</tr>
</table>
</body>
</html>