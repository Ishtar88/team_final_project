<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8"); %>
<jsp:include page="..\manager/manager_header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function exit(){
		location.href="showMember.do"; 
	}
</script>
<body>
	<div>
	<form action="afterModifyMember.do" method="post">
	<input type="hidden" name="dto" value="${dto.id}">
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>연락처</th>
			<th>생년월일</th>
			<th>프로필이미지</th>
			<th>나이</th>
			<th>성별</th>
			<th>등급</th>
			<th>주소</th>
			<th>직업</th>
			<th>가입날짜</th>
			<th>목표갱신일</th>
			<th>탈퇴여부</th>
			<th>결혼여부</th>
			<th>관심분야</th>
			<th>회원관리</th>
		</tr>
		<tr>
			<td><input type="text" name="title" value="${dto.id}"/></td>
			<td><input type="text" name="title" value="${dto.m_name}"/></td>
			<td><input type="text" name="title" value="${dto.m_email}"/></td>
			<td><input type="text" name="title" value="${dto.m_password}"/></td>
			<td><input type="text" name="title" value="${dto.m_phone}"/></td>
			<td><input type="text" name="title" value="${dto.m_birthdate}"/></td>
			<td><input type="text" name="title" value="${dto.m_profile_img}"/></td>
			<td><input type="text" name="title" value="${dto.m_age}"/></td>
			<td><input type="text" name="title" value="${dto.m_gender}"/></td>
			<td><input type="text" name="title" value="${dto.m_grade}"/></td>
			<td><input type="text" name="title" value="${dto.m_address}"/></td>
			<td><input type="text" name="title" value="${dto.m_job}"/></td>
			<td><input type="text" name="title" value="${dto.m_regdate}"/></td>
			<td><input type="text" name="title" value="${dto.m_goaldate}"/></td>
			<td><input type="text" name="title" value="${dto.m_useable}"/></td>
			<td><input type="text" name="title" value="${dto.m_mariable}"/></td>
			<td><input type="text" name="title" value="${dto.m_favorite}"/></td>
		</tr>
		<tr>	
		<td colspan="17">
			<input type="submit" value="submit"/>
			<input type="button" value="cancel" onclick="exit()"/>
		</td>
		</tr>
	</table>
	</form>
	</div>
	
</body>
</html>