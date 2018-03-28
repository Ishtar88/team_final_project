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
	.stock_update_page_wrap{
		width: 400px;
	}
</style>
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<div class="stock_update_page_wrap">
<table class="stock_update_page ui olive table">
	<tr>
		<td class="ui transparent input">
			주식명
					<i class="ellipsis vertica icon"></i>
			<input type="text" name="s_name" value="${sDto.st_name }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="ui transparent input">
		구매수량
				<i class="ellipsis vertica icon"></i>
			<input type="text" name="st_count" value="${sDto.st_count }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="ui transparent input">
		매수금액
				<i class="ellipsis vertica icon"></i>
			<input type="text" name="st_money" value="${sDto.st_money }" readonly="readonly">
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
		<td class="ui transparent input">
		총 평가금액
				<i class="ellipsis vertica icon"></i>
			<input type="text" name="st_add" value="${sDto.st_add*st_count }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="ui transparent input">
		매수날짜
				<i class="ellipsis vertica icon"></i>
			<input type="date" name="st_buydate" value='<fmt:formatDate value="${sDto.st_buydate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<td class="ui transparent input">
		메모
				<i class="ellipsis vertica icon"></i>
			<input type="text" name="st_memo" value="${sDto.st_memo }" readonly="readonly">
		</td>
	</tr>

			<tr>
		<td>
			<button class="ui olive button" onclick="location.href='acount_update_page.do?acount=stock&seq=${sDto.st_seq}'">수정</button>
			<div class="ui orange button" onclick="location.href='acount_delete.do?acount=stock&seq=${sDto.st_seq}'">삭제</div>
			<div class="ui grey button" onclick="acountEnd()">매도</div>
			<div class="ui button" onclick="self.close()">닫기</div>
		</td>
	</tr>
</table>
		<form class="acountEndForm" action="acount_end.do" method="post">
			<table class="ui black table">
				<tr>
					<td>
						<input type="hidden" name="seq" value="${sDto.st_seq}">
						<input type="hidden" name="acount" value="stock">
						<div class="ui mini input">
												<div class="ui transparent mini input">
							매도날짜: <input type="date" name="enddate" required="required">
							</div>
						</div>
						<button class="ui olive mini button">매도</button>
						<div class="ui orange mini button" onclick="acount_end_cancel()">취소</div>
					</td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>