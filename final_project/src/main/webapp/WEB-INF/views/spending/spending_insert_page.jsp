<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지출 등록</title>
<script type="text/javascript">
	$(function() {
		$("input[name=p_some]").click(function() {
			var chk = $(this).val();
			if (chk == '현금') {
				$(".cashable_form").css("display","block");
				$(".card_form").css("display","none");
			} else {
				$(".card_form").css("display","block");
				$(".cashable_form").css("display","none");
			}
		});
	});
</script>
<style type="text/css">
.cashable_form, .card_form {
	display: none;
}
</style>
</head>
<body>
	<form action="income_insert.do" method="post">
		<table class="income_form_body">
			<tr>
				<th>지출 대분류</th>
				<td><input type="text" name="p_name" required="required">
				</td>
			</tr>
			<tr>
				<th>지출 소분류</th>
				<td><input type="text" name="p_money" required="required">
				</td>
			</tr>
			<tr>
				<th>지출 장소</th>
				<td><input type="text" name="p_location" required="required">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="text" name="p_money" required="required">
				</td>
			</tr>
			<tr>
				<th>지출수단</th>
				<td><input type="radio" name="p_some" value="현금">현금
					&nbsp; <input type="radio" name="p_some" value="카드">카드</td>
			</tr>
			<tr class="cashable_form">
				<th>현금영수증여부</th>
				<td><input type="radio" name="p_cashable" value="Y">발급
					&nbsp; <input type="radio" name="p_cashable" value="N">미발급</td>
			</tr>
			<tr class="card_form">
				<th>할부</th>
				<td>
					<select name="p_card">
							<option value="1">일시불</option>
							<c:forEach var="i" begin="2" end="12" step="1">
								<option value="${i }">${i }개월</option>
							</c:forEach>

					</select>
				</td>
			</tr>
			<tr>
				<th>만족도</th>
					<td>
						<c:forEach var="i" begin="1" end="5" step="1">
							<img alt="star" src="resources/icon/star_empty.png" name="satImage${i}" onclick="satChk('${i}')" onmouseover="satShow('${i}')" onmouseout="satNoShow('${i}')">
						</c:forEach>
					</td>
			</tr>
			<tr>
				<th>필요성</th>
						<td>
							<c:forEach var="i" begin="1" end="5" step="1">
								<img alt="star" src="resources/icon/star_empty.png" name="needImage${i}" onclick="needChk('${i}')" onmouseover="needShow('${i}')" onmouseout="needNoShow('${i}')">
							</c:forEach>
						</td>
			</tr>
				<tr>
				<td colspan="2">
				<input type="submit" value="등록"> 
				<input type="button" value="취소" onclick="self.close()"></td>
			</tr>
		</table>
	</form>
</body>
</html>