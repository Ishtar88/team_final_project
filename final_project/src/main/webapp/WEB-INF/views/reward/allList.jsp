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

	function change(el){
		var input=$(el).parent().parent().find("input");
		for (var i = 0; i < input.length-2; i++) {
			input.eq(i).attr("disabled",false);
		}
		$(el).parent().parent().find("select").attr("disabled",false);
	}
</script>
<style type="text/css">
img {
	height: 100px;
	width: 100px;
}
</style>
</head>
<body>
	<form action="updateReward.do" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>상품번호</td>
				<td>상품이미지</td>
				<td>분류</td>
				<td>상품이름</td>
				<td>포인트</td>
				<td>업체명</td>
				<td>등록일</td>
				<td>판매여부</td>
			</tr>
			<c:forEach items="${list}" var="rdto">
				<tr>
					<td><input type="hidden" value="${rdto.r_seq}" name="r_seq" />${rdto.r_seq}</td>
					<td><img alt="상품 이미지" src="resources/upload/${rdto.r_file}">
						<input type="file" name="r_file" disabled="disabled" required="required"/></td>
					<td><select name="r_detail" disabled="disabled">
							<option value="외식">외식</option>
							<option value="카페">카페</option>
							<option value="편의점">편의점</option>
							<option value="문화생활">문화생활</option>
					</select></td>
					<td><input type="text" value="${rdto.r_name}" name="r_name"
						disabled="disabled" /></td>
					<td><input type="number" value="${rdto.r_point}"
						name="r_point" disabled="disabled" /></td>
					<td><select name="b_seq" disabled="disabled">
							<c:forEach items="${cList}" var="cdto">
								<option value="${cdto.b_seq}">${cdto.b_name}</option>
							</c:forEach>
					</select></td>
					<td><input type="text" value="${rdto.r_regDate}"
						readonly="readonly" disabled="disabled" /></td>
					<td><select name="r_sell" disabled="disabled">
							<option value="Y">Y</option>
							<option value="N">N</option>
					</select></td>
					<td><input type="button" value="변경" onclick="change(this)"/> <input
						type="submit" value="수정완료" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>