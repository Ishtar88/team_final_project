<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지에 오신 것을 환영합니다.</title>
</head>
<body>
<h1> 매니저 메인 페이지 입니다 </h1>
<a href="#">회원정보 관리</a><br/>
<a href="manager_notice.do">공지게시판 관리</a><br/>
<a href="manager_qna.do">QnA게시판 관리</a>
</body>
</html>