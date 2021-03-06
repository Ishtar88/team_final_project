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
<title>QnA Board Page</title>
<style type="text/css">
 
 #insertbutton {
 		align-content: right;
 }

</style>
<script type="text/javascript">
	function insertForm(){
		location.href="insertform.do";

	
	}
	

</script>
</head>
<body>

<h1>QnA 게시판</h1>
<div id="boardtable">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조횟수</th>
		</tr>
			<c:choose>
		<c:when test="${empty lists}">
			<tr><td colspan="10">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${lists}" var="dto">
				<tr>
					<td>${dto.q_seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.q_delflag=='Y'}">
							<td>---삭제된 글입니다.---</td>
						</c:when>	
						<c:otherwise>
							<td>
							<jsp:setProperty property="arrowNbsp" name="util" value="${dto.q_depth}" />
							<jsp:getProperty property="arrowNbsp" name="util" />
							<a href="qnadetail.do?q_seq=${dto.q_seq}&count=count">	
							    ${dto.q_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.q_regDate}" pattern="yyyy년MM월dd일"/> </td>
					<td>${dto.q_readcount}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	<div id="insertbutton">
			<input type="button" value="글추가" onclick="insertForm()"/>
		</div>
</div>
</body>
</html>