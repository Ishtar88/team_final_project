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
<table class="fund_detail">
	<tr>
		<th>펀드명</th>
		<td>
			<input type="text" name="f_name" value="${fDto.f_name }">
		</td>
	</tr>
	<tr>
		<th>투자원금</th>
		<td>
			<input type="text" name="f_money" value="${fDto.f_money }">
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
			<input type="text" name="f_add" value="${fDto.f_add }">
		</td>
	</tr>
	<tr>
		<th>매수날짜</th>
		<td>
			<input type="date" name="buy_date" value='<fmt:formatDate value="${fDto.f_buydate }" pattern="yyyy-MM-dd"/>'>
		</td>
	</tr>
	<tr>
		<th>만기날짜</th>
		<td>
			<input type="date" name="en_date" value='<fmt:formatDate value="${fDto.f_enddate }" pattern="yyyy-MM-dd"/>'>
		</td>
	</tr>
	<tr>
		<th>메모</th>
		<td>
			<input type="text" name="f_memo" value="${fDto.f_memo }">
		</td>
	</tr>

	<tr>
		<td>
			<input type="submit" value="완료">
			<input type="button" value="취소" onclick="location.href='acount_cancel.do?acount=fund&seq='+${fDto.f_seq }">
		</td>
	</tr>
</table>
</body>
</html>