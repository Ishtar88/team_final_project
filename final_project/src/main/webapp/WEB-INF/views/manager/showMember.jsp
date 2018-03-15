<%@page import="java.util.List" %>
<%@page import="java.nio.charset.Charset" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<jsp:include page="..\manager/manager_header.jsp"></jsp:include>
<jsp:useBean id="util" class="com.jsr.project.util.Util"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
</head>
<style type="text/css">


</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function searchId(){
		var id = $("input[name=search]").val();
		
		$.ajax({
			url:"searchMember.do",
			data:"id="+id,
			type="get"; 
			datetype="json"; 
			success function(obj){
				goToSearched(obj); 
			}
		});
	}
		function goToSearched(obj){
			var lists = obj.list; 
			$(".members_table").remove(); 
			
			for(var i =0, i<lists.length; i++){
				var dto=lists[i]; 
				$("show_table").children(
						"<table><tr><th>아이디 </th><th>이름</th><th>이메일</th><th>비밀번호</th><th>연락처</th><th>생년월일</th><th>프로필이미지</th><th>나이</th><th>성별</th><th>등급</th><th>주소</th><th>직업</th><th>가입날짜</th><th>목표갱신일</th><th>탈퇴여부</th><th>결혼여부</th><th>관심분야</th></tr><tr><td>" 
						+ dto.id + "</td><td>" + dto.m_name +" </td><td>" + dto.m_email + "</td><td>"+ dto.m_password+
						"</td><td>"+ dto.m_phone + "</td><td>"+${dto.m_birthdate}+ "</td><td>" +${dto.m_profile_img}+
						"</td><td>" + ${dto.m_age} + "</td><td>"+${dto.m_gender}+"</td><td>"+${dto.m_grade}+
						"</td><td>"+${dto.m_address}+"</td><td>" + ${dto.m_job} + "</td><td>" + ${dto.m_regdate}+
						"</td><td>" +{dto.m_goaldate}+ "</td><td>" +${dto.m_useable} +"</td><td>"+ ${dto.m_mariable}+
						"</td><td>"+${dto.m_favorite}+"</td></tr></table>");
			}
		}
		
		function modifyMember(id){
			location.href="modifyMember.do?id="id; 
		}
		
		function deleteMember(id){
			location.href="deleteMember.do?id="id; 
		}
</script>
<body>
<!-- 회원검색~ -->
아이디를 입력하세요! 
<table>
<tr>
<td><input type="text" name="id"></td>
<td><input type="button" value="id" onclick="searchId()"></td>
</tr>
</table>
<div class="show_table">
<!-- 회원정렬~ -->
	<table border="1" class="members_table">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>연락처</th>
			<th>생년월일</th>
			<th>프로필이미지</th>
			<th>나이</th>
			<th>성별</th>
			<th>등급</th>
			<th>주소</th>
			<th>직업</th>
			<th>가입날짜</th>
			<th>목표갱신일</th>
			<th>탈퇴여부</th>
			<th>결혼여부</th>
			<th>관심분야</th>
			<th>회원관리</th>
		</tr>
			<c:choose>
				<c:when test="${empty lists}">
				<tr>
					<td colspan="17">--가입한 회원이 없습니다.</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${lists}" var="dto">
						<tr>
						<td>${dto.id}</td>
						<td>${dto.m_name}</td>
						<td>${dto.m_email}</td>
						<td>${dto.m_password}</td>
						<td>${dto.m_phone}</td>
						<td>${dto.m_birthdate}</td>
						<td>${dto.m_profile_img}</td>
						<td>${dto.m_age}</td>
						<td>${dto.m_gender}</td>
						<td>${dto.m_grade}</td>
						<td>${dto.m_address}</td>
						<td>${dto.m_job}</td>
						<td>${dto.m_regdate}</td>
						<td>${dto.m_goaldate}</td>
						<td>${dto.m_useable}</td>
						<td>${dto.m_mariable}</td>
						<td>${dto.m_favorite}</td>
							<td>
								<input type="button" value="정보수정" onclick="modifyMember(${dto.m_id})"/>
								<input type="button" value="기업삭제" onclick="deleteMember(${dto.m_id})"/>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	</table>
</div>

</body>
</html>


