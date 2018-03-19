<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
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
	<form action="regist3.do" method="post">
		<table border="1">
		<tr>
		<td colspan="2">
		*추가 정보 입력 시 100point 추가 지급 됩니다.
		</td>
		</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="hidden" id="confmKey" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc="> <input
					type="text" name="zipNo" id="zipNo" readonly="readonly">
					<input type="button" value="주소검색" onclick="searchAdd();"></td>
			</tr>
			<tr>
				<th><label>도로명주소</label></th>
				<td><input type="text" id="addrRoad" name="addrRoad"></td>
			</tr>
			<tr>
				<th>상세주소</th>
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
				<td colspan="2"><input type="submit" value="회원가입" /></td>
			</tr>
		</table>
	</form>
</body>
</html>