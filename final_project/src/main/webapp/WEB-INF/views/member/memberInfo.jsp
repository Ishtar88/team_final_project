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
function changeImg(){
	window.open("imgForm.do", "프로필이미지 변경");
	self.close();
}
</script>
<style type="text/css">
img{
height: 300px;
width: 200px;
}
</style>
</head>
<body>
	<a href="modifyUser.do">수정</a>
	<table border="1">
		<tr>
			<th>이미지</th>
			<td><img alt="프로필" src="${mdto.m_profile_img}" name="profile"><input type="button" value="수정" onclick="changeImg()"/></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${mdto.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mdto.m_name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${mdto.m_email}</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${mdto.m_phone}</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>${mdto.m_age}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${mdto.m_gender}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${mdto.m_address}</td>
		</tr>
		<tr>
			<th>직업</th>
			<td>${mdto.m_job}</td>
		</tr>
		<tr>
			<th>결혼</th>
			<td>${mdto.m_mariable}</td>
		</tr>
		<tr>
			<th>관심분야</th>
			<td>${mdto.m_favorite}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><f:formatDate value="${mdto.m_regDate}" pattern="yyyy-MM-dd" /></td>
		</tr>
	</table>
</body>
</html>