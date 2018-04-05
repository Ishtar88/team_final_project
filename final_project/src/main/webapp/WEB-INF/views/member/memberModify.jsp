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

	$(function() {

	});

	function searchAdd() {
		window.open("searchAdd.do", "주소찾기",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}
	function changeImg() {
		window.open("imgForm.do", "프로필이미지 변경",
				'location=yes,height=700,width=800,scrollbars=yes,status=yes');
	}

	function goHome() {
		location.href = "gohome.do";
	}
	function leaveUser() {
		window.open("leaveUser.do", "비밀번호 재확인",
				'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}

</script>
<style type="text/css">
#img {
	height: 150px;
	width: 150px;
}
</style>
</head>
<body>
<div class="ui secondary pointing menu">
  <a class="active item" href="getUser.do">
    내 정보
  </a>
  <a class="item" href="myOrder.do">
    구매 내역
  </a>
</div>

	<form action="modifyUser.do" method="post">
		<table class="ui definition table">
			<thead>
				<tr>
				<th colspan="2">내 정보 변경</th>
			</tr>
			</thead>
			<tbody>
				<tr>
					<td>이미지</td>
					<td><img id="img" alt="프로필" src="${mdto.m_profile_img}" name="profile">
					<div class="ui button" onclick="changeImg()">이미지 변경</div>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" value="${mdto.id}" readonly="readonly"
						name="id" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" value="${mdto.m_name}"
						readonly="readonly" name="m_name" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" value="${mdto.m_email}"
						readonly="readonly" name="m_email" /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<c:set var="phone" value="${mdto.m_phone}" />
					<td><input type="text" maxlength="3"
						value="${fn:substring(phone,0,3)}" name="phone1" size="4px">-<input
						type="text" value="${fn:substring(phone,4,8)}" maxlength="4"
						name="phone2" size="4px">-<input type="text"
						value="${fn:substring(phone,9,13)}" maxlength="4" name="phone3"
						size="4px"></td>
				</tr>

				<tr>
					<td>생년월일</td>
					<c:set var="birthDate" value="${mdto.m_birthDate}" />
					<td><select id="year" name="year">
							<c:forEach var="i" begin="1950" end="<%=year%>" step="1">
								<option value="${i}"
									${i eq fn:substring(birthDate,0,4)?"selected":""}>${i}</option>
							</c:forEach>
					</select> <select id="month" name="month" onchange="changeDate()">
							<c:forEach var="i" begin="1" end="12">
								<option value="${i}"
									${i eq fn:substring(birthDate,5,7)?"selected":""}>${i}</option>
							</c:forEach>
					</select> <select id="date" name="date">
							<c:forEach var="i" begin="1" end="31">
								<option value="${i}"
									${i eq fn:substring(birthDate,8,10)?"selected":""}>${i}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>성별</td>
					<td colspan="2"><input type="radio" name="m_gender"
						value="MALE" ${mdto.m_gender eq "MALE"?"checked":""} />남자 <input
						type="radio" value="FEMALE"
						${mdto.m_gender eq "FEMALE"?"checked":""} name="m_gender" />여자</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<c:set var="address" value="${mdto.m_address}" />
					<td><input type="hidden" id="confmKey" name="confmKey"
						value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc="> <input
						type="text" name="zipNo" id="zipNo"
						value="${fn:split(address,'+')[0]}" readonly="readonly" size="5px">
						<div class="ui button" onclick="searchAdd();">주소검색</div></td>
				</tr>
				<tr>
					<td>도로명주소</td>
					<td><input type="text" id="addrRoad" name="addrRoad"
						value="${fn:split(address,'+')[1]}" size="80px"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="addrDetail"
						value="${fn:split(address,'+')[2]}"></td>
				</tr>

				<tr>
					<td>직업</td>
					<td><input type="text" name="m_job" value="${mdto.m_job}" /></td>
				</tr>
				<tr>
					<td>결혼여부</td>
					<td><input type="radio" name="m_mariable" value="Y"
						${mdto.m_mariable eq "Y"?"checked":""} />기혼 <input type="radio"
						name="m_mariable" value="N" ${mdto.m_mariable eq "N"?"checked":""} />미혼</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<c:set var="favorite" value="${mdto.m_favorite}" />
					<td><input type="checkbox" name="m_favorite" value="패션/뷰티"
						${fn:contains(favorite,'패션/뷰티')?"checked":""}>패션/뷰티 <input
						type="checkbox" name="m_favorite" value="음식/요리"
						${fn:contains(favorite,'음식/요리')?"checked":""}>음식/요리 <input
						type="checkbox" name="m_favorite" value="금융/경제"
						${fn:contains(favorite,'금융/경제')?"checked":""}>금융/경제 <input
						type="checkbox" name="m_favorite" value="유흥/게임"
						${fn:contains(favorite,'유흥/게임')?"checked":""}>유흥/게임 <input
						type="checkbox" name="m_favorite" value="스포츠/레저"
						${fn:contains(favorite,'스포츠/레저')?"checked":""}>스포츠/레저 <input
						type="checkbox" name="m_favorite" value="문화/예술"
						${fn:contains(favorite,'문화/예술')?"checked":""}>문화/예술 <input
						type="checkbox" name="m_favorite" value="교육/학습"
						${fn:contains(favorite,'교육/학습')?"checked":""}>교육/학습</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="ui orange button" onclick="location.href='getUser.do'">취소</div>
						<button class="ui olive button">변경완료</button>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>