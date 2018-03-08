<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/JavaScript" src="/js/jquery-1.8.3.min.js" ></script>
<script language="javascript">

function getAddr(){
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //���ͳݸ�
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"json"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("�����߻�");
	    }
	});
}
function makeListJson(jsonStr){
	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<td>"+this.roadAddrPart1+"</td>";
		htmlStr += "<td>"+this.roadAddrPart2+"</td>";
		htmlStr += "<td>"+this.jibunAddr+"</td>";
		htmlStr += "<td>"+this.engAddr+"</td>";
		htmlStr += "<td>"+this.zipNo+"</td>";
		htmlStr += "<td>"+this.admCd+"</td>";
		htmlStr += "<td>"+this.rnMgtSn+"</td>";
		htmlStr += "<td>"+this.bdMgtSn+"</td>";
		htmlStr += "<td>"+this.detBdNmList+"</td>";
		/** API ���� �����׸� Ȯ�� (2017.02) **/
		htmlStr += "<td>"+this.bdNm+"</td>";
		htmlStr += "<td>"+this.bdKdcd+"</td>";
		htmlStr += "<td>"+this.siNm+"</td>";
		htmlStr += "<td>"+this.sggNm+"</td>";
		htmlStr += "<td>"+this.emdNm+"</td>";
		htmlStr += "<td>"+this.liNm+"</td>";
		htmlStr += "<td>"+this.rn+"</td>";
		htmlStr += "<td>"+this.udrtYn+"</td>";
		htmlStr += "<td>"+this.buldMnnm+"</td>";
		htmlStr += "<td>"+this.buldSlno+"</td>";
		htmlStr += "<td>"+this.mtYn+"</td>";
		htmlStr += "<td>"+this.lnbrMnnm+"</td>";
		htmlStr += "<td>"+this.lnbrSlno+"</td>";
		htmlStr += "<td>"+this.emdNo+"</td>";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {    
		event.keyCode = 0;  
		getAddr(); //jsonp���� enter�˻� 
	} 
}

</script>
</head>
<body>
<form name="form" id="form" method="post">
	<input type="text" name="currentPage" value="1"/> <-- ��û ���� ���� (���� ������. currentPage : n > 0) -->
	<input type="text" name="countPerPage" value="10"/><!-- ��û ���� ���� (�������� ��� ����. countPerPage ���� : 0 < n <= 100) -->
	<input type="text" name="resultType" value="json"/> <-- ��û ���� ���� (�˻�������� ����, json) --> 
	<input type="text" name="confmKey" value="U01TX0FVVEgyMDE4MDMwNzE4MTEzMzEwNzcxMjU="/><!-- ��û ���� ���� (����Ű) -->
	<input type="text" name="keyword" value="" onkeydown="enterSearch();"/><!-- ��û ���� ���� (Ű����) -->
	<input type="button" onclick="getAddr()" value="�ּҰ˻��ϱ�"/>
	<div id="list" ></div><!-- �˻� ��� ����Ʈ ��� ���� -->
</form>

<form action="regist3.do" method="post">
	<table border="1">
		<tr>
		<tr>
					<th>�����ȣ</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="�ּҰ˻�" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>���θ��ּ�</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>���ּ�</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
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