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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function showQR(pro_seq){
	window.open("showQR.do?pro_seq="+pro_seq, "QR확대",'location=yes,height=570,width=520,scrollbars=yes,status=yes');
}

</script>
<style type="text/css">
#img {
	width: 100px;
	height: 100px;
}
#qr:hover{
cursor: pointer;
}
</style>
</head>
<body>
<div class="ui secondary pointing menu">
  <a class="item" href="getUser.do">
    내 정보
  </a>
  <a class="active item" href="myOrder.do">
    구매 내역
  </a>
</div>
	<table id="all" class="ui celled table">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td style="text-align: center;">구매 내역이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
			<thead>
				<tr>
					<th>상품</th>
					<th>QR(클릭시 확대)</th>
					<th>수량</th>
					<th>구매일</th>
					<th>사용여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="proDto">
					<tr>
						<td><input type="hidden" value="${proDto.pro_seq}"
							name="pro_seq" /> <img id="img" alt="상품 이미지"
							src="resources/upload/${proDto.r_name.r_file}">${proDto.r_name.r_name}
						</td>
						<td><img alt="QR" id="img" src="${proDto.pro_qr}" onclick="showQR(${proDto.pro_seq})" id="qr">
						<a href="qrReceipt.do?pro_seq=${proDto.pro_seq}">QR확인</a>
						</td>
						<td>${proDto.pro_count}</td>
						<td><f:formatDate value="${proDto.pro_regDate}" pattern="yyyy-MM-dd"/></td>
						<td>${proDto.pro_qruse}</td>
					</tr>
				</c:forEach>
				</tbody>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>