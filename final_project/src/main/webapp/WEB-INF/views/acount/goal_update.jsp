<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">


</style>
<script type="text/javascript">
	function addAcount(){
		var val=$("#insertAcount").children().eq(0).val();
		alert(val);
	}
</script>
</head>
<body>
<div class="ui middle aligned center aligned grid">
	<div class="ui eight wide column form">
	<h2>목표설정</h2>
		<div class="ui message">
			<div class="middle aligned center aligned inline fields ">
				<div class="field">
					<div class="ui middle aligned input">
						<div>총예산</div>
					</div>
				</div>
				<div class="field">
					<div class="ui middle aligned input">
						<input type="text" value="100000000">
						<div>원</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui dividing header"></div>
		<form action="goal_insert.do" method="post">
		<div class="ui center aligned inline fields">
			<div class="plus icon field">
				<div class="four wide column">
					<a onclick="addAcount()">
						<img src="resources/icon/minus.png" alt="plus icon" style="width: 30px; height: 30px;">
					</a>
				</div>
			</div>
			
			<div class="ui input" id="insertAcount">
				<input type="text" name="g_money" value="${gDto.g_money }" style="width: 200px;">
				<div>&nbsp;</div>
				<input type="text" name="g_memo" value="${gDto.g_memo }">
			</div>
		</div>
			<div class="ui dividing header"></div>
			<button class="ui right aligned olive button">목표설정</button>
			<button class="ui right aligned button">취소</button>
		</form>
	</div>
</div>
</body>
</html>