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
	.fund_update_page_wrap{
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
<div class="fund_update_page_wrap">
<table class="fund_update_page ui olive table">
	<tr>
		<td>
		펀드명
		<i class="ellipsis vertica icon"></i>
						<div class="ui transparent input">
			<input type="text" name="f_name" value="${fDto.f_name }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		투자원금
		<i class="ellipsis vertica icon"></i>
						<div class="ui transparent input">
			<input type="text" name="f_money" value="${fDto.f_money }" readonly="readonly">
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
						<div class="ui transparent input">
			<input type="text" name="f_add" value="${fDto.f_add }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		매수날짜
				<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="date" name="f_buydate" value='<fmt:formatDate value="${fDto.f_buydate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		만기날짜
				<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="date" name="f_enddate" value='<fmt:formatDate value="${fDto.f_enddate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		메모
				<i class="ellipsis vertica icon"></i>
			<div class="ui transparent input">
			<input type="text" name="f_memo" value="${fDto.f_memo }" readonly="readonly">
			</div>
		</td>
	</tr>

	<tr>
		<td>
			<button class="ui olive button" onclick="location.href='acount_update_page.do?acount=fund&seq='+${fDto.f_seq}">수정</button>
			<div class="ui orange button" onclick="location.href='acount_delete.do?acount=fund&seq='+${fDto.f_seq}">삭제</div>
			<div class="ui grey button" onclick="acountEnd()">만기</div>
			<div class="ui button" onclick="self.close()">닫기</div>
		</td>
	</tr>
</table>
		<form class="acountEndForm" action="acount_end.do" method="post">
			<table class="ui black table">
				<tr>
					<td>
						<input type="hidden" name="seq" value="${fDto.f_seq}">
						<input type="hidden" name="acount" value="fund">
						<div class="ui transparent input">
						만기날짜: <input type="date" name="enddate" required="required">
						</div>
						<button class="ui black mini button" value="만기등록">만기</button>
						<div class="ui orange mini button" onclick="acount_end_cancel()">취소</div>
					</td>
				</tr>
			</table>
		</form>
</div>
</body>
</html>