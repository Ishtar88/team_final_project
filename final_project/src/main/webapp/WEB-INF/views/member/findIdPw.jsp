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
	function findId() {
		var m_name = $("input[name=m_name]").val();
		var email1 = $("input[name=email1]").val();
		var email2 = $("input[name=email2]").val();
		var m_email = email1 + "@" + email2;

		$.ajax({
			url : "findId.do",
			data : "m_name=" + m_name + "&m_email=" + m_email,
			type : "post",
			datatype : "json",
			success : function(obj) {
				if (obj["chkDto"] == null) {
					alert("등록된 아이디가 없습니다.");
				} else {
					alert("요청하신 아이디는 " + obj["chkDto"]["id"] + " 입니다.");
				}
			}
		});
	}
	function findPw() {
		var id = $("input[name=id]").val();
		var email1 = $("input[name=email11]").val();
		var email2 = $("input[name=email22]").val();
		var m_email = email1 + "@" + email2;

		$.ajax({

			url : "findPw.do",
			data : "id=" + id + "&m_email=" + m_email,
			type : "post",
			datatype : "json",
			async : false,
			success : function(obj) {
				if (obj["chkDto"] == "nomatch") {
					alert("존재하지 않는 정보입니다.");
				} else {
					alert("입력하신 이메일로 임시 비밀번호를 발송하였습니다.");
					alert(obj["m_password"]);

				}
			}
		});
	}
</script>
</head>
<body>
<a href="index.jsp">home</a>
	<p>아이디 찾기</p>
	<table>
		<tr>
			<td>이름</td>
			<td><input type="text" name="m_name" /></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email1" />@<input type="text"
				name="email2" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="찾기"
				onclick="findId()" /></td>
		</tr>
	</table>
	<p>비밀번호 찾기</p>
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" /></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email11" />@<input type="text"
				name="email22" /></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="찾기"
				onclick="findPw()" /></td>
		</tr>
	</table>
</body>
</html>