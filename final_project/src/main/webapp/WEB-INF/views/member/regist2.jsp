<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
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
<title>회원가입</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function searchAdd() {
		window.open("searchAdd.do", "주소찾기",'location=yes,height=570,width=520,scrollbars=yes,status=yes');
	}
	
	
</script>
<c:if test="${isS}">
	<script type="text/javascript">
		alert("가입이 완료되었습니다.");
		window.location.href="index.jsp";
	</script>
</c:if>
</head>
<body>
	<form action="regist3.do" method="post">
		<table class="ui definition table">
		<thead>
				<tr>
					<th colspan="2">*추가 정보 입력 시 100point 추가 지급 됩니다.</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>우편번호</td>
				<td><input type="hidden" id="confmKey" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc="> <input
					type="text" name="zipNo" id="zipNo" readonly="readonly">
					<div class="ui button" onclick="searchAdd()">주소검색</div>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td><input type="text" id="addrRoad" name="addrRoad" size="70px"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="addrDetail"></td>
			</tr>

			<tr>
				<td>직업</td>
				<td><input type="text" name="m_job" /></td>
			</tr>
			<tr>
				<td>결혼여부</td>
				<td><input type="radio" name="m_mariable" value="Y" />기혼 <input
					type="radio" name="m_mariable" value="N" />미혼</td>
			</tr>
			<tr>
				<td>관심분야(다중 선택 가능)</td>
				<td><input type="checkbox" name="m_favorite" value="패션/뷰티">패션/뷰티
					<input type="checkbox" name="m_favorite" value="음식/요리">음식/요리
					<input type="checkbox" name="m_favorite" value="금융/경제">금융/경제   
					<input type="checkbox" name="m_favorite" value="유흥/게임">유흥/게임   
					<input type="checkbox" name="m_favorite" value="스포츠/레저">스포츠/레저   
					<input type="checkbox" name="m_favorite" value="문화/예술">문화/예술   
					<input type="checkbox" name="m_favorite" value="교육/학습">교육/학습   
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<button class="ui olive button">회원가입</button>
				</td>
			</tr>
			</tbody>
		</table>
	</form>
</body>
</html>