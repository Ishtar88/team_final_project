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
<style type="text/css">
	.fund_detail_wrap{
		width: 300px;
	}
</style>
</head>
<body>
<c:if test="${isc }">
	<script type="text/javascript">
		self.close();
	</script>
</c:if>
<div class="fund_detail_wrap">
<table class="fund_detail ui olive table">
	<tr>
		<td>
		지출명
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="p_name" value="${sDto.p_name}" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		지출상세내용
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="p_detail" value="${sDto.p_detail }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		지출장소
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="p_location" value="${sDto.p_location }" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		지출금액
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="p_money" value="${sDto.p_money }원" readonly="readonly">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		지출수단
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="text" name="p_some" value="${sDto.p_some }" readonly="readonly">
			</div>
		</td>
	</tr>
	<c:if test="${sDto.p_some=='현금'?true:false }">
		<tr>
			<td>
			현금영수증
								<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
				<input type="text" name="p_cashable" value="${sDto.p_cashable=='Y'?'발급':'미발급' }" readonly="readonly">
				</div>
			</td>
		</tr>
	</c:if>
	<c:if test="${sDto.p_some=='카드'?true:false }">
		<tr>
			<td>
			할부
			<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
				<input type="text" name="p_card" value="${sDto.p_card }개월" readonly="readonly">
				</div>
			</td>
		</tr>
	</c:if>
	<tr>
		<td>
		지출날짜
			<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
			<input type="date" name="p_regdate" value='<fmt:formatDate value="${sDto.p_regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly">
			</div>
		</td>
	</tr>
			<tr>
					<td>
				만족도
								<i class="ellipsis vertica icon"></i>
					<div class="ui transparent input">
						<input type="hidden" name="p_sat" value="${sDto.p_sat }">
						</div>
						<c:forEach var="i" begin="1" end="5" step="1">
							<img alt="star" src="resources/icon/star_empty.png" id="satImage${i}">
						</c:forEach>
					</td>
			</tr>
		<tr>
				<td>
					필요성
							<i class="ellipsis vertica icon"></i>
				<div class="ui transparent input">
						<input type="hidden" name="p_need" value="${sDto.p_need }">
						</div>
					<c:forEach var="i" begin="1" end="5" step="1">
						<img alt="star" src="resources/icon/star_empty.png" id="needImage${i}">
					</c:forEach>
				</td>
		</tr>

	<tr>
		<td>
			<button class="ui olive button" onclick="location.href='spending_update_page.do?seq='+${sDto.p_seq}">수정</button>
			<div class="ui orange button" onclick="location.href='spending_delete.do?seq='+${sDto.p_seq}">삭제</div>
			<div class="ui button" onclick="self.close()">닫기</div>
		</td>
	</tr>
</table>
</div>
</body>
</html>