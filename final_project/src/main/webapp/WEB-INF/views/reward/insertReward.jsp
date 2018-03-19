<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function countChk(){
	if(parseInt($("input[name=r_point]").val())<=0){
		$("input[name=r_point]").val("");
	}
}
function chk(){
	var r_name=$("input[name=r_name]").val();
	var r_point=$("input[name=r_point]").val();
	if(r_name=""||r_point==""){
		alert("모든 항목을 빠짐없이 입력 해 주세요");
		return false;
	}
}
</script>
</head>
<body>
	<p>상품등록</p>
	<form action="addReward.do" method="post" enctype="multipart/form-data" onsubmit="return chk()">
		<table border="1">
			<tr>
				<td>상품이미지</td>
				<td><input type="file" name="uploadFile" required="required" /></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="r_name" /></td>
			</tr>
			<tr>
				<td>제휴회사</td>
				<td><select name="b_seq">
						<c:forEach items="${list}" var="cdto">
							<option value="${cdto.b_seq}">${cdto.b_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>분류</td>
				<td><select name="r_detail">
							<option value="외식">외식</option>
							<option value="카페">카페</option>
							<option value="편의점">편의점</option>
							<option value="문화생활">문화생활</option>
				</select></td>
			</tr>
			<tr>
				<td>가격(포인트)</td>
				<td><input type="number" name="r_point" onclick="countChk()"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="상품등록" /></td>
			</tr>
		</table>
	</form>
</body>
</html>