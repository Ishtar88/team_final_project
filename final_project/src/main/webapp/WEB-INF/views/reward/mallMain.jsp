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


table{
	margin-left : 50px;
	margin-top : 100px;
}
.img {
	width: 250px;
	height: 250px;
	padding-right:20px;
}
img:hover{
cursor: pointer;
opacity: 0.5;

}
.text{
text-align: center;
font-size: 20px;
}

</style>
</head>
<body>
	<h2>POINT MALL</h2>
	<table>
		<tr>
			<td><img class="img" alt="restauraunt"
				src="resources/category/restaurant.jpg" onclick="byCategory(a.value)">
				<input  type="hidden" id=a value="외식" /></td>
			<td><img  class="img" alt="cafe" src="resources/category/coffee.jpg" onclick="byCategory(b.value)"> <input
				type="hidden" id=b value="카페" /></td>
			<td><img  class="img" alt="store" src="resources/category/store.jpg" onclick="byCategory(c.value)"> <input
				type="hidden" id=c value="편의점" /></td>
			<td><img  class="img"  alt="ticket" src="resources/category/ticket.jpg" onclick="byCategory(d.value)">
				<input type="hidden" id=d value="문화생활" /></td>
		</tr>
		<tr>
			<td class="text">외식</td>
			<td class="text">카페</td>
			<td class="text">편의점</td>
			<td class="text">문화생활</td>
		</tr>

	</table>
</body>
</html>