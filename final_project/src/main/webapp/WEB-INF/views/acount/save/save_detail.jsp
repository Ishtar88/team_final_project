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
	.acountEndForm{display: none; vertical-align: middle;}
	.save_update_page_wrap{
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
<div class="save_update_page_wrap">
<table class="save_update_page ui olive table">
	<tr>

		<td class="ui transparent input">
			저축분류
			<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
				<input type="text" name="s_detail" value="${svDto.s_detail }" readonly="readonly">
				</div>
		</td>
	</tr>
	<tr>
		<td>
		저축/적금/보험명
		<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="text" name="s_name" value="${svDto.s_name }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		매달저축금액
		<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="text" name="s_money" value="${svDto.s_money }원" readonly="readonly">
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
			<div class="ui transparent input">
			<input type="text" name="s_tax" value="${svDto.s_tax }%" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		시작날짜
		<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="date" name="s_startdate" value='<fmt:formatDate value="${svDto.s_startdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		만기날짜
		<i class="ellipsis vertica icon"></i>
		<div class="ui transparent input">
			<input type="date" name="s_enddate" value='<fmt:formatDate value="${svDto.s_enddate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		메모
		<i class="ellipsis vertica icon"></i>
		<div class="ui transparent input">
			<input type="text" name="s_memo" value="${svDto.s_memo }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<button class="ui olive button" onclick="location.href='acount_update_page.do?acount=save&seq='+${svDto.s_seq}">수정</button>
			<div class="ui orange button" onclick="location.href='acount_delete.do?acount=save&seq='+${svDto.s_seq}">삭제</div>
			<div class="ui grey button" onclick="acountEnd()">만기</div>
			<div class="ui button" onclick="self.close()">닫기</div>
		</td>
	</tr>
	</table>
		<form class="acountEndForm" action="acount_end.do" method="post">
			<table class="ui black table">
				<tr>
					<td>
						<input type="hidden" name="seq" value="${svDto.s_seq}">
						<input type="hidden" name="acount" value="save">
						<div class="ui mini input">
												<div class="ui transparent input">
							만기날짜: <input type="date" pattern="yyyy-MM" name="enddate">
							</div>
						</div>
						<button class="ui black mini button">등록</button>
						<div class="ui orange mini button" onclick="acount_end_cancel()">취소</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>