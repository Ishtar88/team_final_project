<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int date = cal.get(Calendar.DATE);
%>
<script type="text/javascript">
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var date = date.getDate();

	function idChk() {
		var id = $("input[name=id]").val();
		if(id==""){
			alert("아이디를 입력 해 주세요");
		}else{
		$.ajax({

			url : "idChkAjax.do",
			data : "id=" + id,
			type : "post",
			datatype : "json",
			success : function(obj) {
				if (obj["mdto"] == null) {
					$("#idchk").text("사용 가능한 아이디입니다.");
				} else {
					$("#idchk").text("이미 사용중인 아이디입니다.");
				}
			}
		});
			
		}

	}

	function pwChk() {
		var pw1 = $("input[name=m_password]").val();
		var pw2 = $("input[name=m_password_chk]").val();
		if (pw1 != pw2) {
			//alert("비밀번호를 확인 해 주세요");
			$("#pwchk").text("비밀번호를 확인 해 주세요.");
		} else {
			$("#pwchk").text("");
			$("#pwchk").text("올바른 비밀번호입니다.");
		}
	}

	function formChk() {
		var id = $("input[name=id]").val();
		var pw = $("input[name=m_password]").val();
		var pwchk = $("input[name=m_password_chk]").val();
		var email1 = $("input[name=eamil1]").val();
		var phone1 = $("input[name=phone1]").val();
		var phone2 = $("input[name=phone2]").val();
		var phone3 = $("input[name=phone3]").val();
		var gender = $("input[name=m_gender]");

		var idchk = $("#idchk").text();
		var pwchk = $("#pwchk").text();
		var mailchk = $("#mailChk").text();

		if (id == "" || pw == "" || pwchk == "" || email1 == ""
				|| phone1 == "" || phone2 == "" || phone3 == "") {
			alert("모든 칸을 정확히 입력 해 주세요.");
			return false;
		}else if($("#man").prop("checked")==false&&$("#woman").prop("checked")==false){
			alert("모든 칸을 정확히 입력 해 주세요.");
			return false;
		}
		else if (idchk.match("이미") || idchk == "") {
			alert("아이디를 확인 해 주세요.");
			return false;
		} else if (pwchk.match("확인")) {
			alert("비밀번호를 확인 해 주세요.");
			return false;
		} else if (mailchk.match("않은")) {
			alert("인증번호를 확인 해 주세요.");
			return false;
		}

	}

	var chkNum = "";

	function sendMail() {
		var email1 = $("input[name=email1]").val();
		var email2 = $("input[name=email2]").val();
		var mailadd = $("select[name=mailadd]").val();
		if(email1==""){
			alert("이메일을 올바르게 입력 해 주세요");
		}else if(mailadd.match("self") && email2==""){
			alert("이메일을 올바르게 입력 해 주세요");
		}else if (mailadd.match("self") && email2!="") {
			var m_email = email1 + "@" + email2;
			$.ajax({

				url : "mailChkAjax.do",
				data : "m_email=" + m_email,
				type : "post",
				datatype : "json",
				async : false,
				success : function(obj) {
					alert("인증번호를 발송하였습니다. 인증번호를 확인 후 입력 해 주세요.");
					chkNum = obj["chkNum"];
				}
			});
			
		} else {
			var m_email = email1 + "@" + mailadd;
			$.ajax({

				url : "mailChkAjax.do",
				data : "m_email=" + m_email,
				type : "post",
				datatype : "json",
				async : false,
				success : function(obj) {
					alert("인증번호를 발송하였습니다. 인증번호를 확인 후 입력 해 주세요.");
					chkNum = obj["chkNum"];
				}
			});
		}

	}

	function chkMail() {
		var inputNum = $("input[name=chkEmail]").val();
		if (inputNum == chkNum) {
			$("#mailChk").text("올바른 인증 번호입니다.");
		} else {
			$("#mailChk").text("올바르지 않은 인증 번호입니다.");
		}
	}
	
	function mailaddd(){
		var mailadd = $("select[name=mailadd]").val();
		if (mailadd.match("self")) {
			$("input[name=email2]").attr("readonly", false);
		} else {
			$("input[name=email2]").val("");
			$("input[name=email2]").attr("readonly", true);
		}
	}

	$(function() {

		$('.phoneNum').keyup(function() {
			this.value = this.value.replace(/[^0-9]/g, '');
		});
		
// 		if($("#man").prop("checked")==false&&$("#woman").prop("checked")==false){
// 			alert("A");
// 		}
		
	});
	
	function a(){
	}
</script>
<style type="text/css">
</style>
</head>
<body>
	<form action="regist2.do" onsubmit="return formChk()" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" />
					<p id="idchk"></p></td>
				<td><input type="button" value="중복확인" onclick="idChk()"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="2"><input type="text" name="m_name" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" name="m_password" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td colspan="2"><input type="password" name="m_password_chk"
					onchange="pwChk()" />
					<p id="pwchk"></p></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email1" />@ <input type="text"
					name="email2" /> <select name="mailadd" onchange="mailaddd(this.selected)">
						<option value="self">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
				</select></td>
				<td><input type="button" value="인증" onclick="sendMail()"></td>
			</tr>
			<tr>
				<td>인증번호 입력</td>
				<td colspan="2"><input type="text" name="chkEmail"
					onchange="chkMail()" />
					<p id="mailChk"></p></td>

			</tr>
			<tr>
				<td>연락처</td>
				<td colspan="2"><input type="text" name="phone1" maxlength="3"
					class="phoneNum" size="4px" />-<input type="text" name="phone2"
					maxlength="4" class="phoneNum" size="4px" />-<input type="text"
					name="phone3" maxlength="4" class="phoneNum" size="4px" /></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="2"><select id="year" name="year">
						<c:forEach var="i" begin="1950" end="<%=year%>">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> <select id="month" name="month" onchange="changeDate()">
						<c:forEach var="i" begin="1" end="12">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> <select id="date" name="date">
						<c:forEach var="i" begin="1" end="31">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>성별</td>
				<td colspan="2">
					<input type="radio" name="m_gender" id="man" value="MALE" onclick="a('1')"/>남자
					<input type="radio" name="m_gender" id="woman" value="FEMALE" onclick="a('2')"/>여자
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="다음" /></td>
			</tr>
		</table>
	</form>
</body>
</html>