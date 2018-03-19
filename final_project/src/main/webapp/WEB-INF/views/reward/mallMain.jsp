<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:include page="../header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function byCategory(r_detail) {
		location.href = "listOfCategory.do?r_detail="+r_detail+"&sNum=1&eNum=8";
	}
</script>
<style type="text/css">
img {
	width: 200px;
	height: 200px;
}
</style>
</head>
<body>
	<a href="insertReward.do">상품등록</a>
	<a href="rewardList.do">상품조회/수정/삭제</a>
	<a href="patternMain.do">패턴분석</a>
	<table>
		<tr>
			<td><img alt="restauraunt"
				src="resources/category/restauraunt.png" onclick="byCategory(a.value)">
				<input type="hidden" id=a value="외식" /></td>
			<td><img alt="cafe" src="resources/category/cafe.png" onclick="byCategory(b.value)"> <input
				type="hidden" id=b value="카페" /></td>
			<td><img alt="store" src="resources/category/store.png" onclick="byCategory(c.value)"> <input
				type="hidden" id=c value="편의점" /></td>
			<td><img alt="ticket" src="resources/category/ticket.png" onclick="byCategory(d.value)">
				<input type="hidden" id=d value="문화생활" /></td>
		</tr>
		<tr>
			<td>외식</td>
			<td>카페</td>
			<td>편의점</td>
			<td>문화생활</td>
		</tr>
	</table>
</body>
</html>