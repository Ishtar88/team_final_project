<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%response.setContentType("text/html; charset=utf-8"); %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">



function backToList(){
	location.href="manager_qna.do";
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
/* 	$(function(){
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
	}); */
</script>
<style type="text/css">
	#replyForm{display:none;}
	#container{
		width: 600px;
		margin: auto;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<h1>게시글 상세보기 </h1>
<div id="container">
	<table class="ui grey table">
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
			<td>
			<c:choose>
				<c:when test="${dto.q_delflag=='N' }">
					${dto.q_title}
				</c:when><c:otherwise>
					${dto.q_title}<span style="color: red;">(삭제글)</span>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="20" cols="60" >${dto.q_content }</textarea> </td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${dto.q_delflag=='N' }">
					<td colspan="2">
						<div class="ui olive button" onclick="location.href='notice_updateForm.do?q_seq=${dto.q_seq}&count=count'">수정</div>
						<div class="ui orange button" onclick="location.href='manager_deleteBoard.do?q_seq=${dto.q_seq}&count=count&snum=${snum}&ennum=${ennum}'">삭제</div>
						<div class="ui button" onclick="replyForm()">답글</div>
						<div class="ui button" onclick="location.href='manager_qna.do?snum=${snum}&ennum=${ennum}'">목록</div>
					</td>
				</c:when><c:otherwise>
					<td colspan="2">
						<div class="ui button" onclick="location.href='manager_qna.do?snum=${snum}&ennum=${ennum}'">목록</div>
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>

	<div id="replyForm">
		<hr>
		<h2>답글달기</h2>
		<form action="replyBoard.do" method="post">
		<input type="hidden" name="q_viewable" value="${dto.q_viewable}">
			<input type="hidden" name="q_seq" value="${dto.q_seq}">
	<table class="ui olive table">
		<tr>
			<th>작성자</th>
			<td class="ui input"><input type="text" name="id" value="${loginDto.id }" readonly="readonly"> </td>
		</tr>
		<tr>
			<th>제목</th>
			<td class="ui input"><input type="text" name="q_title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="ui input"><textarea rows="10" cols="60" name="q_content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2">
				<button class="ui olive button">작성완료</button>
				<div class="ui orange button" id="btn closeReply" onclick="closeReply()">작성취소</div>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</body>
</html>