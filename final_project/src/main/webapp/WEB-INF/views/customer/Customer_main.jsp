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
<style type="text/css">	
	#noticeboard{
		width:400px;
		height:400px;
		float:left;
		margin-left:20px;
		margin-right:20px;
		background-color: gray;
	}
	
	#qnaboard{
		width:400px;
		height:400px;
		float:left;
		background-color: gray;

	}

</style>
<title>Customer Board Main Page</title>

</head>
<body>
<h1>고객센터</h1>

<!-- 공지게시판 시작 -->
<div id="noticeboard"> 
<span><a href="notice.do">공지게시판</a></span>
<table border="1">
<col width="50px"><col width="50px"><col width="200px"><col width="50px">
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
		<c:choose>
			<c:when test="${empty n_lists}">
			<tr><td colspan="4"> ----작성된 글이 없습니다.-----</td></tr>
			</c:when>
		<c:otherwise>
			<c:forEach items="${n_lists}" var="dto">
				<tr>
					<td>${dto.n_seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.n_delflag=='Y'}">
							<td>----삭제된 글입니다.----</td>
						</c:when>
						<c:otherwise>
							<td>
								<a href="noticedetail.do?seq=${dto.n_seq}">
									${dto.n_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.n_regDate}" pattern="yy년MM월dd일"/></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</table>
</div>

<!-- qna게시판 시작 -->
<div id="qnaboard"> 
<span><a href="qnamain.do">QnA게시판</a></span>
<table border="1">
<col width="50px"><col width="50px"><col width="200px"><col width="50px">
	<tr>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
		<c:choose>
			<c:when test="${empty q_lists}">
			<tr><td colspan="4"> ----작성된 글이 없습니다.-----</td></tr>
			</c:when>
		<c:otherwise>
			<c:forEach items="${q_lists}" var="dto">
				<tr>
					<td>${dto.q_seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.q_delflag=='Y'}">
							<td>----삭제된 글입니다.----</td>
						</c:when>
						<c:otherwise>
							<td>
								<jsp:setProperty property="arrowNbsp" name="util" value="${dto.q_depth}"/>
								<jsp:getProperty property="arrowNbsp" name="util"/>
								<a href="qnadetail.do?seq=${dto.q_seq}">
									${dto.q_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.q_regDate}" pattern="yy년MM월dd일"/></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</table>
</div>
</body>
</html>