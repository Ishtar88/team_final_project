<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
				<td><input type="text" name="m_password" /></td>
			</tr>
			<tr>
				<td><input type="button" value="확인" onclick="pwChk()"/><input type="button"
					value="취소" onclick="end()" /></td>
			</tr>
		</table>

	<table id="chk">
			<tr>
				<td>정말로 탈퇴 하시겠습니까?</td>
			</tr>
			<tr>
				<td><input type="button" value="네" onclick="leaveChk()"/><input type="button"
					value="아니오" onclick="end()"/></td>
			</tr>
		</table>

</body>
</html>