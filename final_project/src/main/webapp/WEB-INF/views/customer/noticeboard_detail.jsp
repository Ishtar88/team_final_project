<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function goback(){
		location.href="notice.do";
	}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<h1>게시글 상세보기</h1>
<table class="table table-striped" border="1">
	<tr>
		<th>번호</th>
		<td>${dto.n_seq}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.n_regDate}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.n_title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea class="form-control" rows="10" cols="60" placeholder="Readonly input here…" readonly>${dto.n_content}</textarea></td>
	</tr>
</table>
<input type="button"  value="목록" onclick="goback()"/>
</div>
</body>
</html>