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
	.save_update_body_wrap{
		width: 400px;	
	}
</style>
</head>
<body>
<form action="save_update.do" method="post">
<input type="hidden" name="s_seq" value="${svDto.s_seq }">
<div class="save_update_body_wrap">
	<table class="save_update_body ui red table">
	<tr>
		<td>
			저축분류
				<div class="ui transparent input">
				<input type="text" name="s_detail" value="${svDto.s_detail }" readonly="readonly">
				</div>
		</td>
	</tr>
	<tr>
		<td>
		저축/적금/보험명
		<i class="ellipsis vertica icon"></i>
			<div class="ui small input">
			<input type="text" name="s_name" value="${svDto.s_name }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		매달저축금액
		<i class="ellipsis vertica icon"></i>
			<div class="ui small input">
			<input type="text" name="s_money" value="${svDto.s_money }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		현재금액
		<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="text" name="s_add" value="${svDto.s_add }원" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		세율
		<i class="ellipsis vertica icon"></i>
			<div class="ui small input">
			<input type="text" name="s_tax" value="${svDto.s_tax }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		시작날짜
		<i class="ellipsis vertica icon"></i>
			<div class="ui small input">
			<input type="date" name="s_startdate" value='<fmt:formatDate value="${svDto.s_startdate }" pattern="yyyy-MM-dd"/>'>
			</div>
		</td>
	</tr>
	<tr>
		<td>
		만기날짜
		<i class="ellipsis vertica icon"></i>
		<div class="ui small input">
			<input type="date" name="s_enddate" value='<fmt:formatDate value="${svDto.s_enddate }" pattern="yyyy-MM-dd"/>'>
			</div>
		</td>
	</tr>
	<tr>
		<td>
		메모
		<i class="ellipsis vertica icon"></i>
		<div class="ui small input">
			<input type="text" name="s_memo" value="${svDto.s_memo }">
			</div>
		</td>
	</tr>
		<tr>
			<td>
				<button class="ui olive button">완료</button>
				<div class="ui orange button" onclick="location.href='acount_cancel.do?acount=save&seq='+${svDto.s_seq }">취소</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>