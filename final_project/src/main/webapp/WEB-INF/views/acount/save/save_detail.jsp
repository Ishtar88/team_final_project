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
<script type="text/javascript">
	function acountEnd(){
		$(".acountEndForm").toggle();
		
	}
	
	function acount_end_cancel(){
		$(".acountEndForm").css("display","none");
	}
</script>
<style type="text/css">
	.acountEndForm{display: none;}
</style>
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<table class="save_detail">
	<tr>
		<th>저축분류</th>
		<td>
			<input type="text" name="s_detail" value="${svDto.s_detail }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>저축/적금/보험명</th>
		<td>
			<input type="text" name="s_name" value="${svDto.s_name }" readonly="readonly">
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
			<input type="date" name="s_startdate" value='<fmt:formatDate value="${svDto.s_startdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>만기날짜</th>
		<td>
			<input type="date" name="s_enddate" value='<fmt:formatDate value="${svDto.s_enddate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
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
			<input type="button" value="수정" onclick="location.href='acount_update_page.do?acount=save&seq='+${svDto.s_seq}">
			<input type="button" value="삭제" onclick="location.href='acount_delete.do?acount=save&seq='+${svDto.s_seq}">
			<input type="button" value="만기" onclick="acountEnd()">
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
	</table>
		<form class="acountEndForm" action="acount_end.do" method="post">
			<table>
				<tr>
					<td>
						<input type="hidden" name="seq" value="${svDto.s_seq}">
						<input type="hidden" name="acount" value="save">
						<input type="date" name="enddate" required="required">
						<span>만기날짜를 입력해주세요</span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="만기등록">
						<input type="button" value="등록 취소" onclick="acount_end_cancel()">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>