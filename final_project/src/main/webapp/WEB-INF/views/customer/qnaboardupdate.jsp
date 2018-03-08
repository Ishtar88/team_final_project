<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8"); %>
<jsp:include page="..\header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정하기폼</title>
</head>
<script type="text/javascript">
	function exit(){
		location.href="qnadetail.do?seq="+${dto.q_seq}
	}
</script>
<body>
<h1>게시판 수정하기</h1>
<form action="updateboard.do" method="post">
<input type="hidden" name="seq" value="${dto.q_seq}">
<table border="1">
	<tr>
		<th>번호</th>
		<td>${dto.q_seq}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${dto.q_name}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="${dto.q_title}"/></td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.q_regDate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="content">${dto.q_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<input type="button" value="수정취소" onclick="exit()"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>

