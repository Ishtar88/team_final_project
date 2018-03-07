<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function insertForm(){
		location.href="insertqna.do";
	}

</script>
</head>
<body>
<jsp:include page="..\header.jsp"></jsp:include>
<jsp:useBean id="util"  class="com.jsr.project.util.Util"  />
<h1>QnA 게시판</h1>
<div>
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
					<td><input class="form-control" type="checkbox" name="chk" value="${dto.q_seq}"/></td>
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
							<a href="qnadetail?seq=${dto.q_seq}">	
							    ${dto.q_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.q_regDate}" pattern="yy년MM월dd일"/> </td>
					<td>${dto.q_readcount}</td>
					<td>${dto.q_refer}</td>
					<td>${dto.q_step}</td>
					<td>${dto.q_depth}</td>
					<td>${dto.q_delflag}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="10">
			<input type="button" value="글추가" onclick="insertForm()"/>
			<input type="submit" value="삭제" />
		</td>
	</tr>
	</table>
</div>
</body>
</html>