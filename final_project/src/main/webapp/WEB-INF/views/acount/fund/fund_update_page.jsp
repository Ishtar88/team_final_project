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
<div class="fund_detail_wrap">
<form action="fund_update.do" method="post">
<div class="stock_update_body_wrap">
	<table class="fund_update_body ui red table">
		<tr>
			<td>
			펀드명
			<i class="ellipsis vertica icon"></i>
							<div class="ui small input">
				<input type="text" name="f_name" value="${fDto.f_name }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			투자원금
			<i class="ellipsis vertica icon"></i>
							<div class="ui small input">
				<input type="text" name="f_money" value="${fDto.f_money }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			손익률
			<i class="ellipsis vertica icon"></i>
							<div class="ui transparent input">
				<input type="text" name="s_inter" value="${sDto.st_money/sDto.st_add }%" readonly="readonly">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			총 평가금액
			<i class="ellipsis vertica icon"></i>
							<div class="ui small input">
				<input type="text" name="f_add" value="${fDto.f_add }">
				</div>
			</td>
		</tr>
		<tr>
			<td>
			매수날짜
					<i class="ellipsis vertica icon"></i>
				<div class="ui small input">
				<input type="date" name="f_buydate" value='<fmt:formatDate value="${fDto.f_buydate }" pattern="yyyy-MM-dd"/>'>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			만기날짜
					<i class="ellipsis vertica icon"></i>
				<div class="ui small input">
				<input type="date" name="f_enddate" value='<fmt:formatDate value="${fDto.f_enddate }" pattern="yyyy-MM-dd"/>'>
				</div>
			</td>
		</tr>
		<tr>
			<td>
			메모
					<i class="ellipsis vertica icon"></i>
				<div class="ui small input">
				<input type="text" name="f_memo" value="${fDto.f_memo }">
				</div>
			</td>
		</tr>
	
		<tr>
			<td>
				<button class="ui olive button">완료</button>
				<div class="ui orange button" onclick="location.href='acount_cancel.do?acount=fund&seq='+${fDto.f_seq }">취소</div>
			</td>
		</tr>
	</table>
</div>
</form>
</div>
</body>
</html>