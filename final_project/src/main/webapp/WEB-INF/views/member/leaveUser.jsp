<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function end(){
	window.close();
}
function pwChk(){
	var pw=$("input[name=m_password]").val();
	$.ajax({
		url : "chkPw.do",
		data : "m_password=" + pw,
		type : "post",
		datatype : "json",
		success : function(obj) {
			if (obj["mdto"]["m_password"]==pw) {
				$("#chk").css("display","block");
			} else {
				alert("비밀번호가 올바르지 않습니다.");
			}
		}
	});
}
function leaveChk(){

	$.ajax({
		url : "getoutUser.do",
		type : "post",
		datatype : "json",
		success : function(obj) {
			if (obj["useable"]=='y') {
				alert("탈퇴가 완료되었습니다. 다음에 또 이용 해 주세요");
				window.opener.location.href="logout.do";
				window.close();
				//location.href="logout.do";
			} else {
				alert("탈퇴에 실패하였습니다.");
				location.href="leaveUser.do";
			}
		}
	});
}
</script>
<style type="text/css">
#chk{
display: none;
}
</style>
</head>
<body>
		<table>
			<tr>
				<td>비밀번호를 다시 입력 해 주세요</td>
			</tr>
			<tr>
				<td>
				<div class="ui icon input">
 				 <input type="password" name="m_password">
				</div>
			
				</td>
			</tr>
			<tr>
				<td>
				<button class="ui blue button" onclick="pwChk()">확인</button>
				<button class="ui grey button" onclick="end()">취소</button>
				</td>
			</tr>
		</table>

	<table id="chk">
			<tr>
				<td>정말로 탈퇴 하시겠습니까?</td>
			</tr>
			<tr>
				<td>
				<button class="ui blue button" onclick="leaveChk()">네</button>
				<button class="ui grey button" onclick="end()">아니오</button>
			</tr>
		</table>

</body>
</html>