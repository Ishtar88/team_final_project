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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//목록으로 돌아가기
	function qnamain(){
		location.href="qnamain.do";
	}
	
</script>
<style type="text/css">
	#container{
		margin: auto;
		width: 500px;
	}
</style>
</head>
<body>
<div>
</div>
<div id="container">
<h1>게시글<small>작성하기</small></h1>
<form action="submitqna.do" method="post">
	<table class="ui orange table">
		<tr>
			<th>제목</th>
			<td><input class="form-control" type="text" name="q_title" placeholder="제목을 입력하세요."/></td>	
			</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" cols="60" rows="10" name="q_content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="ui olive button">글작성</button>
				<div class="ui button" onclick="qnamain()">목록</div>		
			</td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript">
	$(function(){
		$("form").submit(function(){
			var bool=true;
			$("tr>td").each(function(){
				if($(this).children().val()==""){
					alert($(this).children().attr("name")+"을 입력하세요");
					$(this).children().focus();
					bool=false;//submit 이벤트 취소
					return false;//each에 구현된 function()을 종료
				}
			});
			return bool;// submit에 구현된 function() 종료---> submit이벤트가 종료
		});
	});
</script>
</body>
</html>



