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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		width:100px;
		height:100px;
		float:left; 
		padding:10px;  
	}
	
	
</style>
</head>
<body>
<div>
<a href="product.do">
	<img src="resources/img/manager_commercial/product.JPG"  alt="상품관리">
</a>
</div>
<div>
<a href="company.do">
	<img src="resources/img/manager_commercial/company.JPG"  alt="기업관리" >
</a>
</div>

</body>
</html>