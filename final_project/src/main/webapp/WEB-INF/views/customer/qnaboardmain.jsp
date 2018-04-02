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
<title>QnA Board Page</title>
<style type="text/css">
 
 #insertbutton {
 		align-content: right;
 }
	#boardtable{
	margin:auto;
		width: 600px;
	}
</style>
<script type="text/javascript">
	function insertForm(){
		location.href="insertform.do";

	
	}
	

</script>
<script type="text/javascript">
	function qnaSearch(){
		
		var search = $("input[name=search]").val();
		var category = $("select[name=category]").val();
		
		if (search=="") {
			
		}
		
		if(search==""){
			alert("검색어를 입력 해 주세요");
		}else{
			$.ajax({
				url : "qnaDetailAjax.do",
				data : "category=" + category + "&search=" + search + "&snum=1&ennum=10",
				type : "post",
				datetype : "json",
				success : function(obj) {
					if (obj["list"][0] == null) {
						alert("검색 내역이 없습니다.");
					} else {
						//alert("성공");
						makeTr(obj);
					}
				}
			});
		}
		
		function makeTr(obj) {
			var lists = obj.list;
			$("#table").children().remove();

			var str = "";
			str += "<tr class='tr'><th>번호</th><th>작성자</th><th>제목</th><th>작성일</th><th>조횟수</th></tr>";
			for (var i = 0; i < lists.length; i++) {
				var dto = lists[i];
				var date=new Date(dto.q_regDate);
				var year=date.getYear()+"";
				year=year.substring(1, 3);
				var month=date.getMonth()+1;
				if (month<10) {
					month="0"+month;
				}
				var regdate="20"+year+"년"+month+"월"+date.getDate()+"일";
					str += "<tr><td>"+dto.q_seq+"</td><td>"+dto.id+"</td><td>"+dto.q_title+"</td><td>"+regdate+"</td><td>"+dto.q_readcount+"</td></tr>";
					str += "";
			}
			$("#table").append(str);
		}
		
	}

</script>
</head>
<body>

<div id="boardtable">
<h1>QnA 게시판</h1>
<div class="seach_input_wrap">
		<div>
			<select class="ui fluid search dropdown" name="category" style="width: 150px; display: inline-block;">
				<option value="id">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option></option>
			</select>
		</div>
			<div class="ui action mini input">
				<input type="text" placeholder="검색어를 입력해주세요." name="search">
				  <button class="ui icon button">
 				   <i class="search icon" onclick="qnaSearch()"></i>
 				   </button>
			</div>
</div>


	<table id="table" class="ui teal table">
	<col width="50px"><col width="100px"><col width="200px"><col width="150px"><col width="100px">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조횟수</th>
		</tr>
			<c:choose>
		<c:when test="${empty lists}">
			<tr><td colspan="10" style="text-align: center;">---작성된 글이 없습니다.---</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${lists}" var="dto">
				<tr>
					<td>${dto.q_seq}</td>
					<td>${dto.id}</td>
					<c:choose>
						<c:when test="${dto.q_delflag=='Y'}">
							<td>---삭제된 글입니다.---</td>
						</c:when>	
						<c:otherwise>
							<td>
							<jsp:setProperty property="arrowNbsp" name="util" value="${dto.q_depth}" />
							<jsp:getProperty property="arrowNbsp" name="util"/>
							<a href="qnadetail.do?q_seq=${dto.q_seq}&count=count">
							    ${dto.q_title}</a>
							</td>
						</c:otherwise>
					</c:choose>
					<td><f:formatDate value="${dto.q_regDate}" pattern="yyyy년MM월dd일"/></td>
					<td>${dto.q_readcount}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		<c:choose>
		<c:when test="${count==0 }">
		
			</c:when><c:otherwise>
			<tr>
				<td colspan="10" style="text-align: center;"><c:set var="page"></c:set>
					<c:forEach var="i" begin="0" step="1" end="${count-1}">
						<a href="qnamain.do?snum=${i<1?i+1:i+(i*10)}&ennum=${i<1?10:(i+1)*10}">${i+1 }</a>
					</c:forEach>
					</td>
			</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div id="insertbutton">
			<button class="ui olive button" onclick="insertForm()">글추가</button>
		</div>
</div>
</body>
</html>