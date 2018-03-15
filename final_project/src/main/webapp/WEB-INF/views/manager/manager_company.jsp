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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function modifyCompany(){
		location.href=""
// 		여기부터 컴퍼니컨트롤러에 구현해봅시다~! 
	}
	
	function deleteCompany(){
		location.href=""
	}
</script>
</head>
<body>
	<div id="company_table">
		<table border="1">
			<tr>	
				<th>번호유유유유유유유</th>
				<th>회사명</th>
				<th>사업자등록번호</th>
				<th>회사주소</th>
				<th>회사연락처</th>
				<th>회사등록날짜</th>
				<th>관리하기</th>
			</tr>
			<c:choose>
				<c:when test="${empty lists}">
					<tr>
						<td colspan="6">-----등록된 회사가 없습니다.---</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists}" var="dto">
						<tr>
							<td>${dto.b_seq}</td>
							<td>${dto.b_name}</td>
							<td>${dto.b_num}</td>
							<td>${dto.b_address}</td>
							<td>${dto.b_tel}</td>
							<td>${dto.b_regDate}</td>
							<td>
								<input type="button" value="정보수정" onclick="modifyCompany(${dto.b_seq})"/>
								<input type="button" value="기업삭제" onclick="deleteCompany(${dto.b_seq})"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>