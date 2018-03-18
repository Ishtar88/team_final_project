<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
	$(function(){
		var satStar=document.getElementsByName("p_sat")[0].value;
		var needStar=document.getElementsByName("p_need")[0].value;
		
		if (satStar!=null) {
			var i;
			var image;
			var el;
			for (var i = 1; i <= satStar; i++) {
				image='satImage'+i;
				el=document.getElementById(image);
				el.src="resources/icon/star_full.png";
			}
			
		}
		if (needStar!=null) {
			var i;
			var image;
			var el;
			for (var i = 1; i <= needStar; i++) {
				image='needImage'+i;
				el=document.getElementById(image);
				el.src="resources/icon/star_full.png";
			}
		}
	});
	
	
</script>
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
			<input type="text" name="p_location" value="${sDto.p_location }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>지출금액</th>
		<td>
			<input type="text" name="p_money" value="${sDto.p_money }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>지출수단</th>
		<td>
			<input type="text" name="p_some" value="${sDto.p_some }" readonly="readonly">
		</td>
	</tr>
	<c:if test="${sDto.p_some=='현금'?true:false }">
		<tr>
			<th>현금영수증</th>
			<td>
				<input type="text" name="p_cashable" value="${sDto.p_cashable=='Y'?'발급':'미발급' }" readonly="readonly">
			</td>
		</tr>
	</c:if>
	<c:if test="${sDto.p_some=='카드'?true:false }">
		<tr>
			<th>할부</th>
			<td>
				<input type="text" name="p_card" value="${sDto.p_card }개월" readonly="readonly">
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
				<th>만족도</th>
					<td>
						<input type="hidden" name="p_sat" value="${sDto.p_sat }">
						<c:forEach var="i" begin="1" end="5" step="1">
							<img alt="star" src="resources/icon/star_empty.png" id="satImage${i}">
						</c:forEach>
					</td>
			</tr>
		<tr>
			<th>필요성</th>
				<td>
						<input type="hidden" name="p_need" value="${sDto.p_need }">
					<c:forEach var="i" begin="1" end="5" step="1">
						<img alt="star" src="resources/icon/star_empty.png" id="needImage${i}">
					</c:forEach>
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