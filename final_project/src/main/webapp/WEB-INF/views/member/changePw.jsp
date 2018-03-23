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
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>비밀번호 변경</title>
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

// 	function newPwChk() {
// 		var pw1 = $("input[name=newPw]").val();
// 		var pw2 = $("input[name=newPwChk]").val();
// 		if (pw1 != pw2) {
// 			//alert("비밀번호를 확인 해 주세요");
// 			$("#pwchk").text("비밀번호를 확인 해 주세요.");
// 		} else {
// 			$("#pwchk").text("");
// 			$("#pwchk").text("올바른 비밀번호입니다.");
// 			$("input[name=change]").attr("disabled",false);
// 		}
// 	}

	function pwChange() {
		var newPw = $("input[name=newPw]").val();
		var newPwChk = $("input[name=newPwChk]").val();
		if(newPw!=newPwChk||newPw==""||newPwChk==""){
			alert("비밀번호를 올바르게 입력 해 주세요.");
		}else{
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
			<td>
			<div class="ui icon input">
 				 <input type="password" name="m_password">
				</div>
			<button class="ui blue button" onclick="pwChk()">확인</button>
			<button class="ui grey button" onclick="end()">취소</button>	
			</td>
		</tr>
	</table>

	<table id="chk">
		<tr>
			<td>새로운 비밀번호</td>
			<td><div class="ui icon input">
 				 <input type="password" name="newPw">
				</div>
			</td>
		</tr>
		<tr>
			<td>새로운 비밀번호 확인</td>
			<td><div class="ui icon input">
 				 <input type="password" onchange="newPwChk()" name="newPwChk">
				</div>
				<p id="pwchk"></td>
		</tr>
		<tr>
		<td colspan="2">
		<button class="ui green button" onclick="pwChange()" name="change">변경</button>
		<button class="ui grey button" onclick="end()">취소</button>
		</td>
		</tr>
	</table>
</body>
</html>