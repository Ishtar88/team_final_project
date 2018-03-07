<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int date = cal.get(Calendar.DATE);
%>
<script type="text/javascript">
var date=new Date();
var year=date.getFullYear();
var month=date.getMonth()+1;
var date=date.getDate();

	function idChk() {
		var id = $("input[name=id]").val();
	
		$.ajax({

			url : "idChkAjax.do",
			data : "id=" + id,
			type : "post",
			datatype : "json",
			success : function(obj) {
				if (obj["mdto"] == null) {
					$("#idchk").text("��� ������ ���̵��Դϴ�.");
				} else {
					$("#idchk").text("�̹� ������� ���̵��Դϴ�.");
				}
			}
		});
	}

	function pwChk() {
		var pw1 = $("input[name=m_password]").val();
		var pw2 = $("input[name=m_password_chk]").val();
		if (pw1 != pw2) {
			//alert("��й�ȣ�� Ȯ�� �� �ּ���");
			$("#pwchk").text("��й�ȣ�� Ȯ�� �� �ּ���.");
		} else {
			$("#pwchk").text("");
			$("#pwchk").text("�ùٸ� ��й�ȣ�Դϴ�.");
		}
	}
	
	function formChk(){
		var id=$("input[name=id]").val();
		var pw=$("input[name=m_password]").val();
		var pwchk=$("input[name=m_password_chk]").val();
		var email1=$("input[name=eamil1]").val();
		var email2=$("input[name=email2]").val();
		var phone1=$("input[name=phone1]").val();
		var phone2=$("input[name=phone2]").val();
		var phone3=$("input[name=phone3]").val();
		var gender=$("input[name=m_gender]").val();

		var idchk=$("#idchk").text();
		var pwchk=$("#pwchk").text();
		var mailchk=$("#mailChk").text();
		
		if(id==""||pw==""||pwchk==""||email1==""||email2==""||phone1==""||phone2==""||phone3==""||gender==null){
			alert("��� ĭ�� ��Ȯ�� �Է� �� �ּ���.");
			return false;
		}else if(idchk.match("�̹�")||idchk==""){
			alert("���̵� Ȯ�� �� �ּ���.");
			return false;
		}else if(pwchk.match("Ȯ��")){
			alert("��й�ȣ�� Ȯ�� �� �ּ���.");
			return false;
		}else if(mailchk.match("����")){
			alert("������ȣ�� Ȯ�� �� �ּ���.");
			return false;
		}

	}
	
	var chkNum="";
	
	function sendMail(){
		var email1=$("input[name=email1]").val();
		var email2=$("input[name=email2]").val();
		var m_email=email1+"@"+email2;

		$.ajax({

			url : "mailChkAjax.do",
			data : "m_email=" + m_email,
			type : "post",
			datatype : "json",
			async: false,
			success : function(obj) {
				alert("������ȣ�� �߼��Ͽ����ϴ�. ������ȣ�� Ȯ�� �� �Է� �� �ּ���.");
				chkNum=obj["chkNum"];
			}
		});
	}
	
	function chkMail(){
 		var inputNum=$("input[name=chkEmail]").val();
 		if(inputNum==chkNum){
 			$("#mailChk").text("�ùٸ� ���� ��ȣ�Դϴ�.");
 		}else{
 			$("#mailChk").text("�ùٸ��� ���� ���� ��ȣ�Դϴ�.");
 		}
	}
	
	$(function(){
		
	$('.phoneNum').keyup(function () { 
	    this.value = this.value.replace(/[^0-9]/g,'');
	});
	
	});

</script>
<style type="text/css">

</style>
</head>
<body>
	<form action="regist2.do" onsubmit="return formChk()" method="post">
		<table border="1">
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id" />
				<p id="idchk"></p>
				</td>
				<td><input type="button" value="�ߺ�Ȯ��" onclick="idChk()"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td colspan="2"><input type="text" name="m_name" /></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td colspan="2"><input type="password" name="m_password" /></td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ��</td>
				<td colspan="2"><input type="password" name="m_password_chk"
					onchange="pwChk()" />
					<p id="pwchk"></p></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="text" name="email1" />@ <input type="text"
					name="email2" /> <select id="mailadd" onchange="mailadd()">
						<option value="self">���� �Է�</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
				</select></td>
				<td><input type="button" value="����" onclick="sendMail()"></td>
			</tr>
			<tr>
				<td>������ȣ �Է�</td>
				<td colspan="2"><input type="text" name="chkEmail" onchange="chkMail()"/><p id="mailChk"></p></td>
				
			</tr>
			<tr>
				<td>����ó</td>
				<td><input type="text" name="phone1" maxlength="3" class="phoneNum"/>-<input type="text"
					name="phone2" maxlength="4" class="phoneNum"/>-<input type="text" name="phone3" maxlength="4" class="phoneNum"/></td>
				<td></td>
			</tr>
			<tr>
				<td>�������</td>
				<td colspan="2">
				<select id="year" name="year">
						<c:forEach var="i" begin="1950" end="<%=year%>">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select>
				<select id="month" name="month" onchange="changeDate()">
						<c:forEach var="i" begin="1" end="12">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select>
				<select id="date" name="date">
							<c:forEach var="i" begin="1" end="31">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td colspan="2"><input type="radio" name="m_gender"
						value="MALE" />����
				<input type="radio" value="FEMALE" name="m_gender"/>����</td>
			</tr>
			<tr>
			<td><input type="submit" value="����"/></td>
			</tr>
		</table>
	</form>
</body>
</html>