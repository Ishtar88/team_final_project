<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="regist3.do">
	<table border="1">
		<tr>
			<td>주소</td>
			<td><input type="text" name="address1"/><input type="button" value="우편번호검색"></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td><input type="text" name="address2"/></td>
		</tr>
		<tr>
		<td>직업</td>
		<td>
		<input type="text" name="m_job"/>
		</td>
		</tr>
		<tr>
			<td>결혼여부</td>
			<td><input type="radio" name="m_mariable" value="Y" />기혼
				<input type="radio" name="m_mariable" value="N" />미혼</td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td><input type="checkbox" name="m_favorite" value="패션/뷰티">패션/뷰티
			<input type="checkbox" name="m_favorite" value="음식/요리">음식/요리
			<input type="checkbox" name="m_favorite" value="금융/경제">금융/경제
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<input type="checkbox" name="m_favorite" value="유흥/게임">유흥/게임
			<input type="checkbox" name="m_favorite" value="스포츠/레저">스포츠/레저
			<input type="checkbox" name="m_favorite" value="문화/예술">문화/예술
			<input type="checkbox" name="m_favorite" value="교육/학습">교육/학습
		</td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="회원가입"/></td>
		</tr>
	</table>
</form>
</body>
</html>