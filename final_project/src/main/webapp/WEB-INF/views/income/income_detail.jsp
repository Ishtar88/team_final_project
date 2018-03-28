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
	.income_detail_wrap{
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
<div class="income_detail_wrap">
<table class="income_detail ui olive table">
	<tr>
		<td>
		수입명
					<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="i_name" value="${iDto.i_name }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		상세내용
					<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="i_memo" value="${iDto.i_memo }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		금액
					<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="i_money" value="${iDto.i_money }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		고정여부
					<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="i_fix" value="${iDto.i_fix.equals('Y')?'고정수입':'변동수입' }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		등록날짜
					<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="date" name="i_regdate" value='<fmt:formatDate value="${iDto.i_regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button class="ui olive button" onclick="location.href='income_update_page.do?&seq='+${iDto.i_seq}">수정</button>
			<div class="ui orange button" onclick="location.href='income_delete.do?seq='+${iDto.i_seq}">삭제</div>
			<div class="ui button" onclick="self.close()">닫기</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>