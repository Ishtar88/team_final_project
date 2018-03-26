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
<style type="text/css">
	.stock_update_body_wrap{
		width: 400px;
	}
</style>
</head>
<body>
<form action="stock_update.do" method="post">
<div class="stock_update_body_wrap">
	<table class="stock_update_body ui red table">
		<tr>
			<td class="ui small input">
				주식명
						<i class="ellipsis vertica icon"></i>
				<input type="text" name="s_name" value="${sDto.st_name }">
			</td>
		</tr>
		<tr>
			<td class="ui small input">
			구매수량
					<i class="ellipsis vertica icon"></i>
				<input type="text" name="st_count" value="${sDto.st_count }">
			</td>
		</tr>
		<tr>
			<td class="ui small input">
			매수금액
					<i class="ellipsis vertica icon"></i>
				<input type="text" name="st_money" value="${sDto.st_money }">
			</td>
		</tr>
		<tr>
			<td class="ui transparent input">
			손익률
					<i class="ellipsis vertica icon"></i>
				<input type="text" name="s_inter" value="${sDto.st_money/sDto.st_add }%" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td class="ui small input">
			총 평가금액
					<i class="ellipsis vertica icon"></i>
				<input type="text" name="st_add" value="${sDto.st_add*st_count }">
			</td>
		</tr>
		<tr>
			<td class="ui small input">
			매수날짜
					<i class="ellipsis vertica icon"></i>
				<input type="date" name="st_buydate" value='<fmt:formatDate value="${sDto.st_buydate }" pattern="yyyy-MM-dd"/>'>
			</td>
		</tr>
		<tr>
			<td class="ui small input">
			메모
					<i class="ellipsis vertica icon"></i>
				<input type="text" name="st_memo" value="${sDto.st_memo }">
			</td>
		</tr>
	
		<tr>
			<td>
				<button class="ui olive button">완료</button>
				<div class="ui orange button" onclick="location.href='acount_cancel.do?acount=stock&seq='+${sDto.st_seq }">취소</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>