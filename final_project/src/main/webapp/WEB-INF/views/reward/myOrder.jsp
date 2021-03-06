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
</head>
<body>
	<table id="all">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td style="text-align: center;">-------구매 내역이
						없습니다.--------</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="proDto">
					<tr>
						<td>
							<div>
								<input type="hidden" value="${proDto.pro_seq}" name="pro_seq" />
							</div>
							<div>
								<img alt="QR" src="${proDto.pro_qr}">
							</div>

							<div>
								상품명<input type="text" name="r_name"
									value="${proDto.r_name.r_name}" readonly="readonly" />
							</div>
							<div>
								구매수량<input type="text" name="r_name" value="${proDto.pro_count}"
									readonly="readonly" />
							</div>
							<div>
								구매일시<input type="text" name="r_name"
									value="${proDto.pro_regDate}" readonly="readonly" />
							</div>
							<div>
								사용여부<input type="text" name="r_name" value="${proDto.pro_qruse}"
									readonly="readonly" />
							</div> <a href="qrReceipt.do?pro_seq=${proDto.pro_seq}">QR확인</a>
						</td>
					</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
	</table>
</body>
</html>