<%@page import="java.util.List"%>
<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<jsp:useBean id="util" class="com.jsr.project.util.Util" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class= "ui grid">


	<!-- --------------------------------------------------------------첫 레이아웃 줄 시작 -->
	

	<!-- 공백 그리드  -->
	<div class="two wide column"></div>

	
	<div class="twelve wide column">
<div class="ui secondary pointing menu">
  <a class="item" href="insertReward.do">
   상품등록
  </a>
  <a class="item" href="rewardList.do">
   상품정보수정
  </a>
  <a class="active item" href="insertCompanyGo.do">
    기업등록
  </a>
  <a class="item" href="company.do">
    기업정보수정
  </a>
</div>
	</div>
	
		<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
		<!-- --------------------------------------------------------------첫 레이아웃 줄 끝-->    
	
		<!-- 공백 그리드  -->
	<div class="two wide column"></div>
	
	<form action="insertCompany.do" method="post">
		<table class="ui celled table">
			<tr>
				<th>회사명</th>
				<td><input type="text" name="b_name" /></td>
			</tr>
			<tr>
				<th>사업자등록번호</th>
				<td><input type="text" name="b_num" /></td>
			</tr>
			<tr>
				<th>회사주소</th>
				<td><input type="text" name="b_address" /></td>
			</tr>
			<tr>
				<th>회사연락처</th>
				<td><input type="text" name="b_tel" /></td>
			</tr>
			<tr>
			<td colspan="2"><button class="ui orange button">등록</button></td>
			</tr>
		</table>
	</form>
	
</div>	
</body>
</html>