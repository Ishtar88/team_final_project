<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="regist3.do">
	<table border="1">
		<tr>
			<td>�ּ�</td>
			<td><input type="text" name="address1"/><input type="button" value="�����ȣ�˻�"></td>
		</tr>
		<tr>
			<td>���ּ�</td>
			<td><input type="text" name="address2"/></td>
		</tr>
		<tr>
		<td>����</td>
		<td>
		<input type="text" name="m_job"/>
		</td>
		</tr>
		<tr>
			<td>��ȥ����</td>
			<td><input type="radio" name="m_mariable" value="Y" />��ȥ
				<input type="radio" name="m_mariable" value="N" />��ȥ</td>
		</tr>
		<tr>
			<td>���ɺо�</td>
			<td><input type="checkbox" name="m_favorite" value="�м�/��Ƽ">�м�/��Ƽ
			<input type="checkbox" name="m_favorite" value="����/�丮">����/�丮
			<input type="checkbox" name="m_favorite" value="����/����">����/����
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<input type="checkbox" name="m_favorite" value="����/����">����/����
			<input type="checkbox" name="m_favorite" value="������/����">������/����
			<input type="checkbox" name="m_favorite" value="��ȭ/����">��ȭ/����
			<input type="checkbox" name="m_favorite" value="����/�н�">����/�н�
		</td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="ȸ������"/></td>
		</tr>
	</table>
</form>
</body>
</html>