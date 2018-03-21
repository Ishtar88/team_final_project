<%@page import="java.util.List" %>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<jsp:useBean id="util"  class="com.jsr.project.util.Util"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤엘ㄹ프  </title>
</head>
<script type="text/javascript">
	function exit(){
		location.href="manager_qnadetail.do?q_seq=${dto.q_seq}";
	}
</script>
<body>
<h1>게시글 수정하기 </h1>
<form action="manager_updateboard.do" method="post">
<input type="hidden" name="q_seq" value="${dto.q_seq}">
<table border="1">
	<tr>
		<th>글번호</th>
		<td>${dto.q_seq}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="q_title" value="${dto.q_title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="q_content">${dto.q_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="submit"/>
			<input type="button" value="cancel" onclick="exit()"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>

