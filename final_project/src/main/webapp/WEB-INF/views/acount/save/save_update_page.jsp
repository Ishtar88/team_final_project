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
<script type="text/javascript">



</script>
</head>
<body>
<form action="save_update.do" method="post">
<input type="hidden" name="s_seq" value="${svDto.s_seq }">
	<table class="save_update_body">
		<tr>
			<th>저축분류</th>
			<td>
				<input type="text" name="s_name" value="${svDto.s_detail }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>저축/적금/보험명</th>
			<td>
				<input type="text" name="s_detail" value="${svDto.s_name }">
			</td>
		</tr>
		<tr>
			<th>매달저축금액</th>
			<td>
				<input type="text" name="s_money" value="${svDto.s_money }">
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
				<input type="text" name="s_tax" value="${svDto.s_tax }">
			</td>
		</tr>
		<tr>
			<th>시작날짜</th>
			<td>
				<input type="date" name="s_startdate" value="${svDto.s_startdate }">
				
			</td>
		</tr>
		<tr>
			<th>만기날짜</th>
			<td>
				<input type="date" name="s_enddate" value="${svDto.s_enddate }">
			</td>
		</tr>
		<tr>
			<th>메모</th>
			<td>
				<input type="text" name="s_memo" value="${svDto.s_memo }">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="완료">
			</td>
			<td>
				<input type="button" value="취소" onclick="location.href='save_cancel.do?seq='+${svDto.s_seq }">
			</td>
		</tr>
	</table>
</form>
</body>
</html>