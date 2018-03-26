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
	.income_update_page_wrap{
		width: 300px;
	}
</style>
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<form action="income_update.do" method="post">
<div class="income_update_page_wrap">
<table class="income_update_page ui orange table">
	<tr>
		<td>
		수입명
							<i class="ellipsis vertica icon"></i>
				<div class="ui mini input">
			<input type="text" name="i_name" value="${iDto.i_name }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		상세내용
							<i class="ellipsis vertica icon"></i>
				<div class="ui mini input">
			<input type="text" name="i_memo" value="${iDto.i_memo }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		금액
							<i class="ellipsis vertica icon"></i>
				<div class="ui mini input">
			<input type="text" name="i_money" value="${iDto.i_money }">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			고정여부
				<i class="ellipsis vertica icon"></i>
				<div class="ui mini input">
				<input type="radio" name="i_fix" value="Y" checked="${iDto.i_fix=='Y'?'checked':'' }" >고정수입 &nbsp;
				<input type="radio" name="i_fix" value="N" checked="${iDto.i_fix=='N'?'checked':'' }">변동수입
				</div>
		</td>
	</tr>
	<tr>
		<td>
		등록날짜
									<i class="ellipsis vertica icon"></i>
				<div class="ui mini input">
			<input type="date" name="reg_date" value='<fmt:formatDate value="${iDto.i_regdate }" pattern="yyyy-MM-dd"/>'>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button class="ui olive button">수정완료</button>
			<div class="ui orange button" onclick="location.href='income_cancel.do?i_seq=${iDto.i_seq }'">취소</div>
		</td>
	</tr>
</table>
</div>
</form>
</body>
</html>