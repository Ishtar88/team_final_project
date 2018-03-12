<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>상품등록</p>
	<form action="addReward.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="uploadFile" required="required" /></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="r_name"  /></td>
			</tr>
			<tr>
				<td>제휴회사</td>
				<td><input type="text" name="b_seq"/></td>
			</tr>
			<tr>
				<td>가격(포인트)</td>
				<td><input type="text" name="r_point"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="상품등록" /></td>
			</tr>
		</table>
	</form>
</body>
</html>