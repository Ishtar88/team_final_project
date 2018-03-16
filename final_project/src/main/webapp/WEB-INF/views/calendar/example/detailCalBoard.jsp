<%-- <%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
<jsp:useBean id="util" class="comm.util.Util"/>
	<tr>
		<td><input type="checkbox" name="all" onclick="allChk(this.checked)"></td>
		<th>글번호</th>
		<th>아이디</th>
		<th>일정</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
<c:choose>
<c:when test="${empty list}">
	<tr>
		<td colspan="5">---------작성글이 없습니다.----------</td>
	</tr>
</c:when><c:otherwise>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td><input type="checkbox" name="chk" ></td>
			<td><input type="text" value="${dto.seq}" readonly="readonly">${dto.seq}</td>
			<td><input type="text" value="hk" readonly="readonly"></td>
			<td>
				<jsp:setProperty property="toDates" name="util" value="${dto.mDate }"/>
				<jsp:getProperty property="toDates" name="util"/>
			</td>
			<td><input type="text" value="" readonly="readonly">${dto.title}</td>
			<td><input type="text" value="" readonly="readonly">${dto.regdate}</td>
	</tr>
	</c:forEach>
</c:otherwise>
</c:choose>	
	<tr>
		<td>
			<input type="button" value="수정" onclick="location.href='CalController.do?command=updateForm&seq=${dto.seq}'">
			<input type="button" value="삭제" onclick="">
			<input type="button" value="뒤로가기" onclick="location.href='CalController.do?command=calendar'">
		</td>
	</tr>
</table>
</body>
</html> --%>