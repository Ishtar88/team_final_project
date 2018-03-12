<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8"); %>
<jsp:include page="..\header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>왜이러세요 ㅠㅠ </title>
</head>
<script type="text/javascript">
	function exit(){
		location.href="qnadetail.do?seq="+${dto.q_seq}
	}
</script>
<body>
<h1>Modify</h1>
<form action="updateboard.do" method="post">
<input type="hidden" name="seq" value="${dto.q_seq}">
<table border="1">
	<tr>
		<th>seq number</th>
		<td>${dto.q_seq}</td>
	</tr>
	<tr>
		<th>id</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>title</th>
		<td><input type="text" name="title" value="${dto.q_title}"/></td>
	</tr>
	<tr>
		<th>content</th>
		<td><textarea rows="10" cols="60" name="content">${dto.q_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="submit"/>
			<input type="button" value="cancle" onclick="exit()"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>

