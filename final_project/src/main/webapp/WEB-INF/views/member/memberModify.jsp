<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	
<script type="text/javascript">
	function searchAdd() {
		window.open("searchAdd.do", "�ּ�ã��");
	}
</script>
</head>
<body>
<table border="1">
		<tr>
			<th>�̹���</th>
			<td><img alt="������" src="${mdto.m_profile_img}" name="profile"></td>
		</tr>
		<tr>
			<th>���̵�</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td><input type="text" value="${mdto.m_name}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>�̸���</th>
			<td><input type="text" value="${${mdto.m_email}}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>����ó</th>
			<td><input type="text"><input type="text"><input type="text"></td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_age}</td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="radio" name="m_gender"
						value="MALE" />����
				<input type="radio" value="FEMALE" name="m_gender"/>����</td>
		</tr>
		<tr>
			<th>�����ȣ</th>
			<td><input type="hidden" id="confmKey" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc="> <input
					type="text" name="zipNo" id="zipNo" value="">
					<input type="button" value="�ּҰ˻�" onclick="searchAdd();"></td>
			</tr>
			<tr>
				<th><label>���θ��ּ�</label></th>
				<td><input type="text" id="addrRoad" name="addrRoad" value=""></td>
			</tr>
			<tr>
				<th>���ּ�</th>
				<td><input type="text" name="addrDetail" value=""></td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_address}</td>
		</tr>
		<tr>
			<th>����</th>
			<td><input type="text" value="${mdto.id}" readonly="readonly"/></td>
			<td>${mdto.m_job}</td>
		</tr>
		<tr>
			<th>��ȥ</th>
			<td><input type="radio" name="m_mariable" value="Y" />��ȥ <input
					type="radio" name="m_mariable" value="N" />��ȥ</td>
		</tr>
		<tr>
				<td>���ɺо�</td>
				<td><input type="checkbox" name="m_favorite" value="�м�/��Ƽ">�м�/��Ƽ
					<input type="checkbox" name="m_favorite" value="����/�丮">����/�丮
					<input type="checkbox" name="m_favorite" value="����/����">����/����
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="m_favorite"
					value="����/����">����/���� <input type="checkbox"
					name="m_favorite" value="������/����">������/���� <input
					type="checkbox" name="m_favorite" value="��ȭ/����">��ȭ/���� <input
					type="checkbox" name="m_favorite" value="����/�н�">����/�н�</td>
			</tr>
		<tr>
			<th>������</th>
			<td><input type="text" value="${mdto.m_regDate}" readonly="readonly"/></td>
		</tr>
	</table>
</body>
</html>