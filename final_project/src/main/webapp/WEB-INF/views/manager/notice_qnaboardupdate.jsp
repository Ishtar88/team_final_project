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
<style type="text/css">
	#container{
		width: 500px;
		margin: auto;
	}
</style>
</head>
<body>
<div id="container">
<h1>게시글 수정하기 </h1>
<form action="manager_qnaupdateboard.do" method="post">
<input type="hidden" name="n_seq" value="${dto.n_seq}">
<table class="ui olive table">
	<col style="width:100px;"><col style="width:400px;">
	<tr>
		<th>아이디</th>
		<td class="ui input">
		<input type="text" value="${dto.id }" name="id" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td class="ui input"><input type="text" name="n_title" value="${dto.n_title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="n_content">${dto.n_content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<button class="ui olive button">수정</button>
			<div class="ui orange button" onclick="location.href='manager_noticeboard_detail.do?n_seq=${dto.n_seq}&count=no'">목록</div>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>

