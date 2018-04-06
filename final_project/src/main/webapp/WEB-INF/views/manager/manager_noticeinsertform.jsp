<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<jsp:include page="manager_header.jsp"></jsp:include>
<html>
<head>
<style type="text/css">
	#container{
		width: 600px;
		margin: auto;
	}
</style>
</head>
<body>
<div id="container">
<h1>게시글<small>작성하기</small></h1>
<form action="insertnotice.do" method="post">
<input type="hidden" name="id" value="ASD"/>
<input type="hidden" name="snum" value="1"/>
<input type="hidden" name="ennum" value="10"/>
	<table class="ui gray table">
		<tr>
			<th>제목</th>
			<td class="ui input"><input type="text" name="n_title"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="60" rows="10" name="n_content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="ui olive button">글작성</button>
				<div class="ui orange button" onclick="location.href='manager_notice.do?snum=${snum}&ennum=${ennum}'">목록</div>		
			</td>
		</tr>
	</table>
</form>
</div>
<script type="text/javascript">
/* 	$(function(){
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
	}); */
</script>
</body>
</html>