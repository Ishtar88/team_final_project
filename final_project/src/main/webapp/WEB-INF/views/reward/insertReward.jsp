<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function countChk(){
	if(parseInt($("input[name=r_point]").val())<=0){
		$("input[name=r_point]").val("");
	}
}
function chk(){
	var r_name=$("input[name=r_name]").val();
	var r_point=$("input[name=r_point]").val();
	if(r_name=""||r_point==""){
		alert("모든 항목을 빠짐없이 입력 해 주세요");
		return false;
	}
}
</script>
</head>
<body>
<div class="ui grid">

<!-- --------------------------------------------------------------첫 레이아웃 줄 시작-->  

    <!-- 공백 그리드  -->
<div class="two wide column"></div>

<div class="twelve wide column">
<div class="ui secondary pointing menu">
  <a class="active item" href="insertReward.do">
   상품등록
  </a>
  <a class="item" href="rewardList.do">
   상품정보수정
  </a>
  <a class="item" href="insertCompanyGo.do">
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


<div class="twelve wide column">
	<form action="addReward.do" method="post" enctype="multipart/form-data" onsubmit="return chk()">
		<table class="ui celled table">
			<tr>
				<th>상품이미지</th>
				<td><input type="file" name="uploadFile" required="required" /></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="r_name" /></td>
			</tr>
			<tr>
				<th>제휴회사</th>
				<td><select name="b_seq">
						<c:forEach items="${list}" var="cdto">
							<option value="${cdto.b_seq}">${cdto.b_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>분류</th>
				<td><select name="r_detail">
							<option value="외식">외식</option>
							<option value="카페">카페</option>
							<option value="편의점">편의점</option>
							<option value="문화생활">문화생활</option>
				</select></td>
			</tr>
			<tr>
				<th>가격(포인트)</th>
				<td><input type="number" name="r_point" onclick="countChk()"/></td>
			</tr>
			<tr>
				<td colspan="2"><button class="ui orange button">등록</button></td>
			</tr>
		</table>
	</form>
</div>

   <!-- 공백 그리드  -->
<div class="two wide column"></div>


</div>
</body>
</html>