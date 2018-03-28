<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<style type="text/css">
	.calendar_income{
		width: 600px;	
	}
</style>
<title>Insert title here</title>
</head>
<body>
		<div class="calendar_wrap">
			<div class="calendar_income">
				<table class="ui olive table">
					<tr>
						<td><a href="spending_insert_page.do?command=calendar"><img alt="plus" src="resources/icon/plus.png" style="width: 15px; height: 15px;"></a></td>
						<td colspan="4"><span>지출</span></td>
					</tr>
					<tr>
						<th>지출명</th>
						<th>지출상세</th>
						<th>지출장소</th>
						<th>지불수단</th>
						<th>지출금액</th>
					</tr>
					<c:choose>
						<c:when test="${empty pList}">
							<tr>
								<td colspan="5">지출 내역이 없습니다.</td>
							</tr>
						</c:when><c:otherwise>
						<c:forEach items="${pList}" var="pDto">
							<tr>
								<td>${pDto.p_name}</td>
								<td>${pDto.p_detail}</td>
								<td>${pDto.p_location}</td>
								<td>${pDto.p_some}</td>
								<td>${pDto.p_money}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					<tr><td colspan="5">----------------------</td></tr>
					<tr>
						<td><a href="income_insert_page.do?command=calendar"><img alt="plus" src="resources/icon/plus.png" style="width: 15px; height: 15px;"></a></td>
						<td colspan="3"><span>수입</span></td>
					</tr>
					<tr>
						<th>수입명</th>
						<th>상세내용</th>
						<th>고정여부</th>
						<th>수입금액</th>
					</tr>
					<c:choose>
						<c:when test="${empty iList}">
							<tr>
								<td colspan="4">수입내역이 없습니다.</td>
							</tr>
						</c:when><c:otherwise>
							<c:forEach items="${iList }" var="iDto">
								<tr>
									<td>${iDto.i_name }</td>
									<td>${iDto.i_memo }</td>
									<td>${iDto.i_fix=='Y'?'고정수입':'변동수입' }</td>
									<td>${iDto.i_money }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="4">
							<button class="ui orange button" onclick="self.close()">닫기</button>
						</td>				
					</tr>
				</table>
			</div>
		</div>
</body>
</html>