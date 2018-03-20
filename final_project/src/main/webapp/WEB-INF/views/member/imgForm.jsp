<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var m_profile_img = "";
	$(function() {
		$("input[name=radioChk]").click(function() {
			m_profile_img = $(this).parent().next().next().children().val();
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
		window.opener.location.href="getUser.do";
		self.close();
	</script>
</c:if>
<style type="text/css">
img {
	height: 200px;
	width: 150px;
}
</style>
</head>
<body>
	<table border="1">
		<tr>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile1.png"></td>
			<td><input type="hidden" value="resources/img/profile1.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile2.png"></td>
			<td><input type="hidden" value="resources/img/profile2.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile3.png"></td>
			<td><input type="hidden" value="resources/img/profile3.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile4.gif"></td>
			<td><input type="hidden" value="resources/img/profile4.gif" /></td>
		</tr>

		<tr>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile1.png"></td>
			<td><input type="hidden" value="resources/img/profile1.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile2.png"></td>
			<td><input type="hidden" value="resources/img/profile1.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile3.png"></td>
			<td><input type="hidden" value="resources/img/profile1.png" /></td>
			<td><input type="radio" name="radioChk" /></td>
			<td><img alt="프로필" src="resources/img/profile4.gif"></td>
			<td><input type="hidden" value="resources/img/profile1.gif" /></td>
		</tr>
		<tr>
			<td colspan="12"><input type="button" value="취소" onclick="end()" />
				<input type="button" value="변경완료" onclick="change()" /></td>
		</tr>
	</table>
</body>
</html>