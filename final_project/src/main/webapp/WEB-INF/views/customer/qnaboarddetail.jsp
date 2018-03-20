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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">



function backToList(){
	location.href="qnamain.do";
}

	function updateForm(seq){
		location.href="updateqna.do?seq="+seq;
	}
	
	function delForm(seq){
		//글여러개 삭제하는 기능을 사용하기 위해 "chk"이름으로 seq를 전달함
		location.href="deleteBoard.do?chk="+seq;
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
</style>
<title>Insert title here</title>
</head>
<body>
<h1>게시글 상세보기</h1>
<form action="" >
<div id="container">
	<table class="table table-striped" border="1">
		<tr>
			<th>번호</th>
			<td>${dto.q_seq}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><f:formatDate value="${dto.q_regDate }" pattern="yyyy년MM월dd일"/> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.q_title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="40" >${dto.q_content }</textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="updateForm(${dto.q_seq})" class="btn btn-success">
				<input type="button" value="삭제" onclick="delForm(${dto.q_seq})" class="btn btn-danger">
				<input type="button" value="답글" onclick="replyForm()" class="btn btn-success">
				<input type="button" value="목록" onclick="backToList()" class="btn btn-success">
			</td>
		</tr>
	</table>
	</form>
	<div id="replyForm">
		<hr>
		<h2>답글달기</h2>
		<form action="replyBoard.do" method="post">
			<input type="hidden" name="q_seq" value="${dto.q_seq}">
	<table class="table table-striped" border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="id" class="form-control"> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="form-control"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="40" name="content" class="form-control"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="작성완료" class="btn btn-success">
				<input type="button" value="작성취소" id="btn closeReply" onclick="closeReply()">
			</td>
		</tr>
	</table>
		</form>
	</div>
</div>
</body>
</html>