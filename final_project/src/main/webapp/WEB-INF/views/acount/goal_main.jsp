<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
	<title>Home</title>
</head>
<script type="text/javascript">

	$(function(){
		var list=$(".acount_list").children().children();
		
		
		for (var i = 0; i < list.length; i++) {
			list.eq(i).attr("class","item");
		}
		
		list.eq(0).attr("class","active item");
		
	});

	function addAcount(){
		var val=$("#insertAcount").children().eq(0).val();
		alert(val);
	}
</script>
<body>
<a href="getUser.do">내 정보</a>
<a href="goal_main.do">예산 설정</a>
<a>구매 내역</a>
<div class="ui middle aligned center aligned grid">
	<div class="ui eight wide column form">
	<h2>목표설정</h2>
		<div class="ui message">
			<div class="middle aligned center aligned inline fields ">
				<div class="field">
					<div class="ui middle aligned input">
						<div>총예산</div>
					</div>
				</div>
				<div class="field">
					<div class="ui middle aligned input">
						<input type="text" value="${totalMoneyDto.g_money }" readonly="readonly">
						<div class="ui middle aligned">원</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ui dividing header"></div>
		<div class="ui center aligned fields">
			<div class="plus icon field">
			</div>
			<div>
				<div id="acountName" style="width: 100px;"></div>
			</div>
			<c:choose>
				<c:when test="${empty goalAllSearchList }">
					
				</c:when><c:otherwise>
					<c:forEach items="${goalAllSearchList }" var="dto">
							<div id="insertAcount">
								<input type="text" name="g_money" value="${dto.g_money }" style="width: 200px;">
								<span>&nbsp;&nbsp;</span>
								<input type="text" name="g_name" value="${dto.g_name }">
							</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
			<div class="ui dividing header"></div>
			<button class="ui right aligned olive button" onclick="location.href='goal_insert_page.do'">목표설정</button>
			<button class="ui right aligned button" onclick="location.href='goal_update_page.do'">목표수정</button>
	</div>
</div>
</body>
</html>
