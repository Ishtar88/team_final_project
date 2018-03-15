<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function end(){
	alert("사용이 취소되었습니다");
	location.href="index.jsp";
}

function use(){
	
}

</script>
</head>
<body>
	<div>
		<input type="hidden" value="${proDto.pro_seq}" name="pro_seq" />
	</div>
	<div>
		<img alt="상품 이미지" src="resources/upload/${rdto.r_file.r_file}">
	</div>
	<div>
		상품명<input type="text" value="${proDto.r_name.r_name}" readonly="readonly" />
	</div>
	<div>
		수량<input type="text" value="${proDto.pro_count}" readonly="readonly" />
	</div>
	<div>
		구매자<input type="text" value="${proDto.id}" name="id" readonly="readonly"/>
	</div>
	<div>
		사용 하시겠습니까?<input type="button" value="네" onclick="use()"/><input type="button"
			value="아니오" onclick="end()" />
	</div>
</body>
</html>