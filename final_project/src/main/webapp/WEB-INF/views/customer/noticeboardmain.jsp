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
<title>Notice Board Page</title>
<style type="text/css">
 
 #boardtable {
 	margin: auto;
 		width: 600px;
 }

</style>
<script type="text/javascript">
	function insertForm(){
		location.href="insertnotice.do";
	}

</script>
</head>
<body>

<div id="boardtable">
<h1 onclick="showoption()">공지 게시판</h1>
	<table class="ui teal table">
	<col width="50px"><col width="100px"><col width="200px"><col width="150px"><col width="100">
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
					<td>${dto.n_seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.n_delflag=='Y'}">
							<td>---삭제된 글입니다.---</td>
						</c:when>	
						<c:otherwise>
							<td>
							<a href="notice_detail.do?n_seq=${dto.n_seq}&count=count">	
							    ${dto.n_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.n_regDate}" pattern="yyyy년MM월dd일"/> </td>
					<td>${dto.n_readcount}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${count==0 }">
		
			</c:when><c:otherwise>
			<tr>
				<td colspan="10" style="text-align: center;"><c:set var="page"></c:set>
					<c:forEach var="i" begin="0" step="1" end="${count}">
						<a href="notice.do?snum=${i<1?i+1:i+(i*10)}&ennum=${i<1?10:(i+1)*10}">${i+1 }</a>
					</c:forEach>
					</td>
			</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>