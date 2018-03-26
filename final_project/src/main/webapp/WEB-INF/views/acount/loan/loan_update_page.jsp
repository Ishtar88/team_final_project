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
	.loan_update_page_wrap{
		width: 400px;
	}
</style>
</head>
<body>
<form action="loan_update.do" method="post">
<div class="loan_update_body_wrap">
	<table class="loan_update_body ui red table">
		<tr>
			<td>
			대출명
						<i class="ellipsis vertica icon"></i>
					<div class="ui small input">
				<input type="text" name="l_name" value="${lDto.l_name }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			대출원금
						<i class="ellipsis vertica icon"></i>
					<div class="ui small input">
				<input type="text" name="l_money" value="${lDto.l_money }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			대출상환금
						<i class="ellipsis vertica icon"></i>
					<div class="ui transparent input">
				<input type="text" name="l_remane" value="${lDto.l_remane }" readonly="readonly">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			시작날짜
						<i class="ellipsis vertica icon"></i>
					<div class="ui small input">
				<input type="date" name="l_startdate" value='<fmt:formatDate value="${lDto.l_startdate }" pattern="yyyy-MM-dd"/>'>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			만기날짜
						<i class="ellipsis vertica icon"></i>
					<div class="ui small input">
				<input type="date" name="l_enddate" value='<fmt:formatDate value="${lDto.l_enddate }" pattern="yyyy-MM-dd"/>'>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			메모
						<i class="ellipsis vertica icon"></i>
					<div class="ui small input">
				<input type="text" name="l_memo" value="${lDto.l_memo }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<button class="ui olive button">완료</button>
				<div class="ui orange button" onclick="location.href='acount_cancel.do?acount=loan&seq='+${lDto.l_seq }">취소</div>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>