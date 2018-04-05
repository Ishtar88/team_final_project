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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var m_profile_img = "";
	$(function() {
		$("input[name=radioChk]").click(function() {
			m_profile_img = $(this).next().val();
		});
	});

	function end() {
		self.close();
	}

	function change() {
		location.href = "imgChange.do?m_profile_img=" + m_profile_img;
	}
</script>
<c:if test="${isS}">
	<script type="text/javascript">
		alert("변경이 완료되었습니다.");
		window.opener.location.href = "getUser.do";
		self.close();
	</script>
</c:if>
<style type="text/css">
img {
	height: 150px;
	width: 150px;
}
</style>
</head>
<body>
	<table class="ui celled table">
		<tr>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/0.png" /></td>
			<td><img alt="프로필" src="resources/img/0.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/1.png" /></td>
			<td><img alt="프로필" src="resources/img/1.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/2.png" /></td>
			<td><img alt="프로필" src="resources/img/2.png"></td>

		</tr>
		<tr>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/3.png" /></td>
			<td><img alt="프로필" src="resources/img/3.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/4.png" /></td>
			<td><img alt="프로필" src="resources/img/4.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/5.png" /></td>
			<td><img alt="프로필" src="resources/img/5.png"></td>
		</tr>
		<tr>

			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/6.png" /></td>
			<td><img alt="프로필" src="resources/img/6.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/7.png" /></td>
			<td><img alt="프로필" src="resources/img/7.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/8.png" /></td>
			<td><img alt="프로필" src="resources/img/8.png"></td>
		</tr>
		<tr>

			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/9.png" /></td>
			<td><img alt="프로필" src="resources/img/9.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/10.png" /></td>
			<td><img alt="프로필" src="resources/img/10.png"></td>
			<td><input type="radio" name="radioChk" />
			<input type="hidden" value="resources/img/11.png" /></td>
			<td><img alt="프로필" src="resources/img/11.png"></td>
		</tr>
		<tr>
			<td colspan="12">
				<button class="ui grey button" onclick="end()">취소</button>
				<button class="ui blue button" onclick="change()">변경완료</button>
			</td>
		</tr>
	</table>
</body>
</html>