<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	
<script type="text/javascript">
	function searchAdd() {
		window.open("searchAdd.do", "주소찾기");
	}
</script>
</head>
<body>
<table border="1">
		<tr>
			<th>이미지</th>
			<td><img alt="프로필" src="${mdto.m_profile_img}" name="profile"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" value="${mdto.m_name}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="${${mdto.m_email}}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text"><input type="text"><input type="text"></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_age}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="radio" name="m_gender"
						value="MALE" />남자
				<input type="radio" value="FEMALE" name="m_gender"/>여자</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="hidden" id="confmKey" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc="> <input
					type="text" name="zipNo" id="zipNo" value="">
					<input type="button" value="주소검색" onclick="searchAdd();"></td>
			</tr>
			<tr>
				<th><label>도로명주소</label></th>
				<td><input type="text" id="addrRoad" name="addrRoad" value=""></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="addrDetail" value=""></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_address}</td>
		</tr>
		<tr>
			<th>직업</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_job}</td>
		</tr>
		<tr>
			<th>결혼</th>
			<td><input type="radio" name="m_mariable" value="Y" />기혼 <input
					type="radio" name="m_mariable" value="N" />미혼</td>
		</tr>
		<tr>
				<td>관심분야</td>
				<td><input type="checkbox" name="m_favorite" value="패션/뷰티">패션/뷰티
					<input type="checkbox" name="m_favorite" value="음식/요리">음식/요리
					<input type="checkbox" name="m_favorite" value="금융/경제">금융/경제
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="m_favorite"
					value="유흥/게임">유흥/게임 <input type="checkbox"
					name="m_favorite" value="스포츠/레저">스포츠/레저 <input
					type="checkbox" name="m_favorite" value="문화/예술">문화/예술 <input
					type="checkbox" name="m_favorite" value="교육/학습">교육/학습</td>
			</tr>
		<tr>
			<th>가입일</th>
			<td><input type="text" value="${mdto.m_regDate}" readonly="readonly"/></td>
		</tr>
	</table>
</body>
</html>