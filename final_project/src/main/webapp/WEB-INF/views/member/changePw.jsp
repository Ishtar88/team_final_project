<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function end() {
		window.close();
	}

	function pwChk() {
		var pw = $("input[name=m_password]").val();
		$.ajax({
			url : "chkPw.do",
			data : "m_password=" + pw,
			type : "post",
			datatype : "json",
			success : function(obj) {
				if (obj["mdto"]["m_password"] == pw) {
					$("#chk").css("display", "block");
				} else {
					alert("비밀번호가 올바르지 않습니다.");
				}
			}
		});
	}

	function newPwChk() {
		var pw1 = $("input[name=newPw]").val();
		var pw2 = $("input[name=newPwChk]").val();
		if (pw1 != pw2) {
			//alert("비밀번호를 확인 해 주세요");
			$("#pwchk").text("비밀번호를 확인 해 주세요.");
		} else {
			$("#pwchk").text("");
			$("#pwchk").text("올바른 비밀번호입니다.");
		}
	}

	function pwChange() {
		var newPw = $("input[name=newPw]").val();
		$.ajax({
			url : "changePassword.do",
			type : "post",
			data : "m_password=" + newPw,
			datatype : "json",
			success : function(obj) {
				if (obj["change"] == 'y') {
					alert("변경이 완료되었습니다.다시 로그인 해 주세요.");
					window.opener.location.href="index.jsp";
					self.close();
				} else {
					alert("변경에 실패하였습니다.");
					self.close();
				}
			}
		});
	}
</script>
 

<style type="text/css">
#chk {
	display: none;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>현재 비밀번호</td>
			<td><input type="text" name="m_password" /> <input
				type="button" value="확인" onclick="pwChk()" /> <input type="button"
				value="취소" onclick="end()" /></td>
		</tr>
	</table>

	<table id="chk">
		<tr>
			<td>새로운 비밀번호</td>
			<td><input type="text" name="newPw" /></td>
		</tr>
		<tr>
			<td>새로운 비밀번호 확인</td>
			<td><input type="text" onchange="newPwChk()" name="newPwChk" />
				<p id="pwchk"></td>
		</tr>
		<tr>
		<td colspan="2"><input type="button" value="변경" onclick="pwChange()" /> <input
			type="button" value="취소" onclick="end()" /></td>
		</tr>
	</table>
</body>
</html>