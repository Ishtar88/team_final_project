<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
    <%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>시스템오류</h1>
<h2>수정해야함</h2>
<h3>오류메시지: ${msg }</h3>
<a href="CalController.do?command=calendar">돌아가기</a>
</body>
</html>