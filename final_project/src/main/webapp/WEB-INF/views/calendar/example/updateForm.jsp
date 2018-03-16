<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="CalController.do" method="post">
<input type="hidden" name="command" value="update">
<table class="table table-striped">
	<tr>
		<th>글번호</th>
			<td><input type="text" value="${dto.seq}" readonly="readonly"></td>
		<th>아이디</th>
			<td><input type="text" value="hk" readonly="readonly"></td>
	</tr>
	<tr>
		<th>일정</th>
		<td>
			<select name="year">
				<c:set var="paramyear" value="${fn:substring(dto.mDate,0,4) }"/>
				<c:forEach begin="${paramyear-5 }" end="${paramyear+5 }" step="1" var="i">
					<option value="${i }" ${paramyear==i?"selected":"" }>${i }</option>
				</c:forEach>
			</select>년
			<select name="month">
				<c:forEach begin="1" end="12" step="1" var="i">
					<option value="${i }" ${fn:substring(mDate,4,6)==i?"selected":"" }>${i }</option>
				</c:forEach>
			</select>월
			<select name="date">
				<c:forEach begin="1" end="31" step="1" var="i">
					<option value="${i }" ${fn:substring(mDate,6,8)==i?"selected":"" }>${i }</option>
				</c:forEach>
			</select>일
						<select name="year">
				<c:forEach begin="${paramyear-5 }" end="${paramyear+5 }" step="1" var="i">
					<option value="${i }" ${paramyear==i?"selected":"" }>${i }</option>
				</c:forEach>
			</select>시
						<select name="year">
				<c:forEach begin="${paramyear-5 }" end="${paramyear+5 }" step="1" var="i">
					<option value="${i }" ${paramyear==i?"selected":"" }>${i }</option>
				</c:forEach>
			</select>년
		</td>
	</tr>
	<tr>
		<th>제목</th>
			<td><input type="text" value="${dto.title}" name="title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="20" cols="40" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="수정완료" >
			<input type="button" value="뒤로가기" onclick="location.href='CalController.do?command=calendar'">
		</td>
	</tr>
</table>
</form>
</body>
</html>