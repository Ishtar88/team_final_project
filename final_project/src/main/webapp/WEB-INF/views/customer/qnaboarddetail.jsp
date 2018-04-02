<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<jsp:include page="..\header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">



	function updateForm(q_seq){
		var count = "count"; 
		location.href="updateForm.do?q_seq=${dto.q_seq}&count=count";
	}
	
	function delForm(q_seq){
		location.href="deleteBoard.do?q_seq="+q_seq;
	}
	
	function replyForm(){
		$("#replyForm").show();
		 var offset = $("#replyForm").offset().top;
		$("#replyForm").animate({"scrollTop" : offset}, 400);
		//document.getElementById("replyForm").style.display("");
	}
	
	function closeReply(){
		$("#replyForm").hide();
	}
	//입력폼 유효값처리
	$(function(){
		$("#replyForm form").submit(function(){
			var bool=true;
			$("#replyForm tr>td").each(function(){
				var val=$(this).children().val();
				if(val==""){
					alert($(this).children().attr("name")+"을 입력하세요.");
					$(this).children().focus();
					bool= false;//submit 이벤트 취소
					return false; //each에 구현된 function()을 종료
				}
			});
			return bool;
		});
	});
</script>
<style type="text/css">
	#replyForm{display:none;}
	#container{
		margin: auto;
		width: 700px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div id="container">
<h1>게시글 상세보기</h1>
	<table class="ui grey table">
		<tr>
			<th>번호</th>
			<td>${dto.q_seq}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><f:formatDate value="${dto.q_regDate}" pattern="yyyy년MM월dd일"/> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.q_title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="40" readonly="readonly">${dto.q_content}</textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="updateForm(${dto.q_seq})" class="ui olive button">수정</button>
				<button onclick="delForm(${dto.q_seq})" class="ui orange button">삭제</button>
				<button onclick="location.href='qnamain.do?snum=${snum}&ennum=${ennum }'" class="ui button">돌아가기</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>