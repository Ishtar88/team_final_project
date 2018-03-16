<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<table class="fund_detail">
	<tr>
		<th>지출명</th>
		<td>
			<input type="text" name="p_name" value="${sDto.p_name}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>지출상세내용</th>
		<td>
			<input type="text" name="p_detail" value="${sDto.p_detail }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>지출장소</th>
		<td>
			<input type="text" name="p_location" value="${sDto.p_location }%" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>지출수단</th>
		<td>
			<input type="text" name="p_some" value="${sDto.p_some }%" readonly="readonly">
		</td>
	</tr>
	<c:if test="p_cashable!=null">
		<tr>
			<th>현금영수증</th>
			<td>
				<input type="text" name="p_cashable" value="${sDto.p_cashable }%" readonly="readonly">
			</td>
		</tr>
	</c:if>
	<c:if test="p_card!=null">
		<tr>
			<th>할부</th>
			<td>
				<input type="text" name="p_card" value="${sDto.p_card }%" readonly="readonly">
			</td>
		</tr>
	</c:if>
	<tr>
		<th>지출날짜</th>
		<td>
			<input type="date" name="p_regdate" value='<fmt:formatDate value="${sDto.p_regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>구매만족도</th>
		<td>
			<input type="text" name="p_sat" value="${sDto.p_sat }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>구매필요성</th>
		<td>
			<input type="text" name="p_need" value="${sDto.p_need }" readonly="readonly">
		</td>
	</tr>

	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='spending_update_page.do?seq='+${sDto.p_seq}">
			<input type="button" value="삭제" onclick="location.href='spending_delete.do?seq='+${sDto.p_seq}">
			<input type="button" value="닫기" onclick="self.close()">
		</td>
	</tr>
</table>
</body>
</html>