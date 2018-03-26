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
	function findId() {
		var m_name = $("input[name=m_name]").val();
		var email1 = $("input[name=email1]").val();
		var email2 = $("input[name=email2]").val();
		var m_email = email1 + "@" + email2;
		
		if(m_name==""||email1==""||email2==""){
			alert("이름, 이메일을 올바르게 입력 해 주세요.");
		}else{
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

	}
	function findPw() {
		var id = $("input[name=id]").val();
		var email1 = $("input[name=email11]").val();
		var email2 = $("input[name=email22]").val();
		var m_email = email1 + "@" + email2;
		
		if(id==""||email1==""||email2==""){
			alert("아이디, 이메일을 올바르게 입력 해 주세요.");
		}else{
			
		$.ajax({

			url : "findPw.do",
			data : "id=" + id + "&m_email=" + m_email,
			type : "post",
			datatype : "json",
			async : false,
			success : function(obj) {
				if (obj["chkDto"] == "nomatch") {
					alert("등록되지 않은 회원입니다.");
				} else {
					alert("입력하신 이메일로 임시 비밀번호를 발송하였습니다.");
					alert(obj["m_password"]);

				}
			}
		});
		}

	}
</script>
</head>
<body>
	<table class="ui unstackable table">
		<thead>
			<tr>
				<th colspan="2">아이디 찾기</th>
			</tr>
		</thead>
		<tbody>
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
				<td colspan="2">
				<button class="ui olive button" onclick="findId()">검색</button>
				<button class="ui violet button" onclick="location.href='index.jsp'">로그인</button>
				</td>
			</tr>
		</tbody>
	</table>

	<table class="ui unstackable table">
		<thead>
			<tr>
				<th colspan="2">비밀번호 찾기</th>
			</tr>
		</thead>
		<tbody>
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
				<td colspan="2">
				<button class="ui olive button" onclick="findPw()">검색</button>
				<button class="ui violet button" onclick="location.href='index.jsp'">로그인</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>