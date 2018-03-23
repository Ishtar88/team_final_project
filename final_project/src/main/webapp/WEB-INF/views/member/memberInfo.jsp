<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function leaveUser() {
		window.open("leaveUser.do", "비밀번호 재확인",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}
	function changePw() {
		window.open("changePw.do", "비밀번호 변경",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}
</script>
<style type="text/css">
img {
	height: 200px;
	width: 150px;
}
</style>
</head>
<body>
	<a href="getUser.do">내 정보</a>
	<a href="goal_main.do">예산 설정</a>
	<a href="myOrder.do">구매 내역</a>

	<table class="ui definition table">
		<thead>
			<tr>
				<th></th>
				<th>내 정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>프로필 이미지</td>
				<td><img alt="프로필" src="${mdto.m_profile_img}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" value="${mdto.id}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" value="${mdto.m_name}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" value="${mdto.m_email}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" value="${mdto.m_password}"
					readonly="readonly" /><button class="ui button" onclick="changePw()">비밀번호변경</button>
					</td>
			</tr>
			<tr>
				<td>연락처</td>
				<c:set var="phone" value="${mdto.m_phone}" />
				<td><input type="text" maxlength="3"
					value="${fn:substring(phone,0,3)}" readonly="readonly" size="4px">-<input
					type="text" value="${fn:substring(phone,4,8)}" readonly="readonly"
					size="4px">- <input type="text"
					value="${fn:substring(phone,9,13)}" readonly="readonly" size="4px"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<c:set var="birthDate" value="${mdto.m_birthDate}" />
				<td><input type="text" value="${fn:substring(birthDate,0,4)}"
					readonly="readonly" size="4px">년 <input type="text"
					value="${fn:substring(birthDate,5,7)}" readonly="readonly"
					size="4px">월 <input type="text"
					value="${fn:substring(birthDate,8,10)}" readonly="readonly"
					size="4px">일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="m_gender" value="MALE"
					${mdto.m_gender eq "MALE"?"checked":""} disabled="disabled" />남자 <input
					type="radio" value="FEMALE"
					${mdto.m_gender eq "FEMALE"?"checked":""} name="m_gender"
					disabled="disabled" />여자</td>
			</tr>
			<tr>
			<c:set var="address" value="${mdto.m_address}" />
				<td>우편번호</td>
				<td><input type="text" value="${fn:split(address,'+')[0]}"
					readonly="readonly" size="5px"></td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><input type="text" value="${fn:split(address,'+')[1]}"
					readonly="readonly" size="80px"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" value="${fn:split(address,'+')[2]}"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input type="text" name="m_job" value="${mdto.m_job}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>결혼여부</td>
				<td><input type="radio" name="m_mariable" value="Y"
					${mdto.m_mariable eq "Y"?"checked":""} disabled="disabled" />기혼 <input
					type="radio" name="m_mariable" value="N"
					${mdto.m_mariable eq "N"?"checked":""} disabled="disabled" />미혼</td>
			</tr>
			<tr>
				<td>관심분야</td>
				<c:set var="favorite" value="${mdto.m_favorite}" />
				<td><input type="checkbox" name="m_favorite" value="패션/뷰티"
					${fn:contains(favorite,'패션/뷰티')?"checked":""} disabled="disabled">패션/뷰티
					<input type="checkbox" name="m_favorite" value="음식/요리"
					${fn:contains(favorite,'음식/요리')?"checked":""} disabled="disabled">음식/요리
					<input type="checkbox" name="m_favorite" value="금융/경제"
					${fn:contains(favorite,'금융/경제')?"checked":""} disabled="disabled">금융/경제<input
					type="checkbox" name="m_favorite" value="유흥/게임"
					${fn:contains(favorite,'유흥/게임')?"checked":""} disabled="disabled">유흥/게임
					<input type="checkbox" name="m_favorite" value="스포츠/레저"
					${fn:contains(favorite,'스포츠/레저')?"checked":""} disabled="disabled">스포츠/레저
					<input type="checkbox" name="m_favorite" value="문화/예술"
					${fn:contains(favorite,'문화/예술')?"checked":""} disabled="disabled">문화/예술
					<input type="checkbox" name="m_favorite" value="교육/학습"
					${fn:contains(favorite,'교육/학습')?"checked":""} disabled="disabled">교육/학습</td>
			</tr>
			<tr>
				<td colspan="2">
				<button class="ui yellow button" onclick="location.href='getModiForm.do'">수정</button>
<button class="ui olive button" onclick="leaveUser()">탈퇴</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>