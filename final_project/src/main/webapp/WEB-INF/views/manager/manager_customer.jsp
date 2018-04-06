<%@page import="java.util.List" %>
<%@ page isELIgnored ="false" %>
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
<style type="text/css">	
	#noticeboard{
		width:450px;
		height:600px;
		float:left;
		margin-left:20px;
		margin-right:20px;
	}
	
	#qnaboard{
		width:450px;
		height:600px;
		float:left;

	}

</style>
<title>Manager Board Main Page</title>

</head>
<body>
<h1>관리자 게시판 관리</h1>

<!-- 공지게시판 시작 -->
<div id="noticeboard"> 
<span><a href="manager_notice.do?snum=1&ennum=10">자세히보기</a></span>
<table class="ui very basic table">
<caption>공지게시판</caption>
<col width="50px"><col width="50px"><col width="200px"><col width="100px">
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
			<c:forEach begin="0" end="10" step="1" var="i">
					<tr>
						<td>${n_lists[i].n_seq}</td>
						<td>${n_lists[i].id}</td>
						<c:choose>
							<c:when test="${n_lists[i].n_delflag=='Y'}">
								<td>----삭제된 글입니다.----</td>
							</c:when>
							<c:otherwise>
								<td>
									<a href="manager_noticeboard_detail.do?n_seq=${n_lists[i].n_seq}&count=count">
										${n_lists[i].n_title}</a>
								</td>
							</c:otherwise>
						</c:choose>
						<td><f:formatDate value="${n_lists[i].n_regDate}" pattern="yy-MM-dd"/></td>
					</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</table>
</div>

<!-- qna게시판 시작 -->
<div id="qnaboard"> 
<span><a href="manager_qna.do?snum=1&ennum=10">자세히보기</a></span>
<table class="ui very basic table">
<caption>QnA게시판</caption>
<col width="50px"><col width="50px"><col width="200px"><col width="100px">
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
			<c:forEach begin="0" end="10" step="1" var="i">
				<tr>
					<td>${q_lists[i].q_seq}</td>
					<td>${q_lists[i].id}</td>
						<td>
							<a href="manager_qnadetail.do?q_seq=${q_lists[i].q_seq}&count=count">	
<%-- 							<jsp:setProperty property="arrowNbsp" name="util" value="${dto.q_depth}" /> --%>
<%-- 							<jsp:getProperty property="arrowNbsp" name="util" /> --%>
							 	   ${q_lists[i].q_title}
							  	  <c:if test="${q_lists[i].q_delflag=='Y'}">
							   	 <span style="color: red;">(삭제글)</span>
							    </c:if>
							</a>
						</td>
					<td><f:formatDate value="${q_lists[i].q_regDate}" pattern="yy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
</table>
</div>
</body>
</html>