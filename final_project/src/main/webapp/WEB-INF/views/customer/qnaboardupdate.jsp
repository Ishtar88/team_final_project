<%@page import="java.util.List" %>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="..\header.jsp"></jsp:include>
<jsp:useBean id="util"  class="com.jsr.project.util.Util"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헤엘ㄹ프  </title>
<style type="text/css">
	#container{
		margin: auto;
		width: 700px;
	}
</style>
</head>
<script type="text/javascript">
	function exit(){
		var snum=$("input[name=snum]").val();
		var ennum=$("input[name=ennum]").val();
		location.href="qnadetail.do?q_seq=${dto.q_seq}&count=count&snum="+snum+"&ennum="+ennum;
	}
</script>
<body>
<div id="container">
<h1>게시글 수정하기 </h1>
<form action="updateboard.do" method="post">
<input type="hidden" name="q_seq" value="${dto.q_seq}">
<input type="hidden" name="snum" value="${snum}">
<input type="hidden" name="ennum" value="${ennum}">
<table class="ui orange table">
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
			<button class="ui olive button">수정</button>
			<div class="ui orange button" onclick="exit()">취소</div>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>

