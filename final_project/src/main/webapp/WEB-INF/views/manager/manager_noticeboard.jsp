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
<title>QnA Board Page</title>
<script type="text/javascript">
	
	//전체선택 체크
	function allSel(bool){
		$("input[name=chk]").prop("checked",bool);
	}
	
</script>
<style type="text/css">
 
 #boardtable {
 		width: 600px;
 		margin: auto;
 }

</style>
</head>
<body>

<div id="boardtable">
<h1>공지 게시판</h1>
<form action="notice_multiDel.do" method="post">
	<table class="ui grey table">
		<tr>
			<th><input type="checkbox" name="all" onclick="allSel(this.checked)"></th>
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
					<td><input type="checkbox" name="chk" value="${dto.n_seq}"/></td>
					<td>${dto.n_seq}</td>
					<td>${dto.id}</td>
							<td>
							<a href="manager_noticeboard_detail.do?n_seq=${dto.n_seq}&count=count">	
							    ${dto.n_title}</a>
							</td>

					<td><f:formatDate value="${dto.n_regDate}" pattern="yyyy년MM월dd일"/> </td>
					<td>${dto.n_readcount}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		<c:choose>
		<c:when test="${count<2 }">
			<a href="manager_notice.do?snum=1&ennum=10">1</a>
			</c:when><c:otherwise>
			<tr>
				<td colspan="10" style="text-align: center;"><c:set var="page"></c:set>
					<c:forEach var="i" begin="0" step="1" end="${count}">
						<a href="manager_notice.do?snum=${i<1?i+1:i+(i*10)}&ennum=${i<1?10:(i+1)*10}">${i+1 }</a>
					</c:forEach>
					</td>
			</tr>
			</c:otherwise>
		</c:choose>
	<tr>
		<td colspan="10">
			<div class="ui olive button" onclick="location.href='insertnoticeform.do'">글추가</div>
			<button class="ui orange button">삭제</button>
		</td>
	</tr>
	</table>
</form>
</div>
</body>
</html>