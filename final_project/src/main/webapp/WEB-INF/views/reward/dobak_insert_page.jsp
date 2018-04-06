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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function end() {
		window.close();
	}
	
	function buyChk() {
		var haveP = $("input[name=haveP]").val();
		var needP = $("input[name=point]").val();
		var needPP=Math.abs(parseInt(needP));

		if (parseInt(haveP) < parseInt(needPP)) {
			alert("보유 포인트가 부족합니다");
			return false;
		}

	}
</script>
<c:choose>
	<c:when test="${isc eq 'success'}">
		<script type="text/javascript">
			alert("뽑기에 성공하셨습니다. <나의 구매내역>에서 QR코드를 확인 하세요.");
			self.close();
		</script>
	</c:when>
	<c:when test="${isc eq 'fail'}">
		<script type="text/javascript">
			alert("뽑기에 실패하셨습니다. 다음에 다시 도전 해 주세요.");
			self.close();
		</script>
	</c:when>
</c:choose>
<title>Insert title here</title>
</head>
<body>

	<form action="dobak_check.do" method="post" onsubmit="return buyChk()">
		<table class="ui pink table">
			<tr>
				<td><input type="hidden" value="${loginDto.id}" name="id" /></td>
				<td><input type="hidden" value="${loginDto.po_point.po_point}" name="haveP" /></td>
				<td><input type="hidden" value="${rdto.r_seq}" name="r_seq" /></td>
				<td><input type="hidden" value="${-rdto.r_point*0.05}"
					name="point" /></td>
			</tr>
			<tr>
				<td>상품명 <input type="text" value="${rdto.r_name}"
					readonly="readonly" /></td>
			</tr>

			<tr>
				<td>뽑기 도전 시 정가의 5%인 <f:formatNumber value="${rdto.r_point*0.05}" pattern="0"/>포인트가 차감됩니다. 도전 하시겠습니까?</td>
			</tr>
			<tr>
				<td>
					<button class="ui pink button">네</button>
					<div class="ui grey button" onclick="end()">아니오</div>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>