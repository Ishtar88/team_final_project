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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function end() {
		window.close();
	}

	function pointSum() {
		var point = $("#price").val();
		var count = $("input[name=pro_count]").val();
		$("input[name=po_point]").val(point * count);
	}

	function chk() {
		if (parseInt($("input[name=pro_count]").val()) <= 0) {
			$("input[name=pro_count]").val("");
		}
	}

	function buyChk() {
		var haveP = $("input[name=m_point]").val();
		var needP = $("input[name=po_point]").val();
		var count = $("input[name=pro_count]").val();

		if (count == "") {
			alert("구매 수량을 입력 해 주세요");
			return false;
		} else if (parseInt(haveP) < parseInt(needP)) {
			alert("보유 포인트가 부족합니다");
			return false;
		}

	}

</script>
<c:if test="${isS}">
	<script type="text/javascript">
		alert("구매가 완료되었습니다. <나의 구매내역>에서 QR코드를 확인 하세요.");
		self.close();
	</script>
</c:if>
<style type="text/css">
img {
	height: 100px;
	width: 100px;
}
</style>
</head>
<body>
	<form action="buyReward.do" method="post" onsubmit="return buyChk()">
		<table>
			<tr>
				<td><input type="hidden" value="${loginDto.id}" name="id" /></td>
				<td><input type="hidden" value="${rdto.r_seq}" name="pro_num" /></td>
			</tr>
			<tr>
				<td>상품명<input type="text" value="${rdto.r_name}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>상품가격<input type="text" id="price" value="${rdto.r_point}"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>보유 포인트는<input type="text"
					value="${loginDto.po_point.po_point}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>구매수량<input type="number" name="pro_count" onclick="chk()"
					onchange="pointSum()" /> <input type="text" name="po_point"
					readonly="readonly" readonly="readonly" />

				</td>
			</tr>
			<tr>
				<td>사용기한은 구매일로부터 1년 입니다.</td>
			</tr>
			<tr>
				<td>구매 하시겠습니까?<input type="submit" value="네" /><input
					type="button" value="아니오" onclick="end()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>