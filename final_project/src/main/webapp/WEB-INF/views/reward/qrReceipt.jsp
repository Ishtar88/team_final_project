<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function end() {
		alert("사용이 취소되었습니다");
		location.href = "index.jsp";
	}
</script>
<c:if test="${isS}">
	<script type="text/javascript">
		alert("사용이 완료되었습니다.");
		window.location.href = "index.jsp";
	</script>
</c:if>
<style type="text/css">
img{
height: 200px;
width: 200px;
}
</style>
</head>
<body>
	<form action="useQR.do" method="post">
		<div>
			<img alt="상품 이미지" src="resources/upload/${proDto.r_name.r_file}">
		</div>
		<div>
			<input type="hidden" value="${proDto.pro_seq}" name="pro_seq" />
		</div>
		<div>
			상품명:${proDto.r_name.r_name}
		</div>
		<div>
			수량:${proDto.pro_count}
		</div>
		<div>
			구매자:${proDto.id}
		</div>
		<div>
			사용 하시겠습니까?
			<button class="ui olive button">네</button>
			<div class="ui button" onclick="end()">아니오</div>
		</div>
	</form>
</body>
</html>