<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="manager_header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{
		margin: auto;
		width: 700px;
	}
</style>
</head>
<body>
<div id="container">
<h1>게시글 상세보기</h1>
<table class="ui grey table">
	<tr>
		<th>번호</th>
		<td class="ui transparent input">
		<input type="text" value="${dto.n_seq}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td class="ui transparent input">
		<input type="text" value="${dto.id}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>
		<fmt:formatDate value="${dto.n_regDate}" pattern="yyyy년MM월dd일"/></td>
	</tr>
	<tr>
		<th>제목</th>
		<td class="ui transparent input">
		<input type="text" value="${dto.n_title}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" placeholder="Readonly input here…" readonly>${dto.n_content}</textarea></td>
	</tr>
</table>
	<div class="ui olive button" onclick="location.href='notice_updateForm.do?n_seq=${dto.n_seq}&count=no'">수정</div>
	<div class="ui orange button" onclick="location.href='manager_notice_delete.do?n_seq=${dto.n_seq}'">삭제</div>
	<button class="ui olive button" onclick="location.href='manager_notice.do?snum=${snum}&ennum=${ennum }'">목록</button>
</div>
</body>
</html>