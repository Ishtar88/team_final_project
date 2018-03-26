<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>주소찾기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">

	function getAddr() {
		
		 if (window.event.keyCode == 13) {
			 alert("a");
			 $.ajax({
					url : "http://www.juso.go.kr/addrlink/addrLinkApi.do",
					type : "post",
					data : $("#form").serialize(),
					dataType : "json",
					crossDomain : true,
					success : function(jsonStr) {
						$("#list").html("");
						var errCode = jsonStr.results.common.errorCode;
						var errDesc = jsonStr.results.common.errorMessage;
						if (errCode != "0") {
							alert(errDesc);
						} else {
							if (jsonStr != null) {
								makeListJson(jsonStr);
							}
						}
					},
					error : function(xhr, status, error) {
						alert("에러발생");
					}
				});
		 }else{
			 $.ajax({
					url : "http://www.juso.go.kr/addrlink/addrLinkApi.do",
					type : "post",
					data : $("#form").serialize(),
					dataType : "json",
					crossDomain : true,
					success : function(jsonStr) {
						$("#list").html("");
						var errCode = jsonStr.results.common.errorCode;
						var errDesc = jsonStr.results.common.errorMessage;
						if (errCode != "0") {
							alert(errDesc);
						} else {
							if (jsonStr != null) {
								makeListJson(jsonStr);
							}
						}
					},
					error : function(xhr, status, error) {
						alert("에러발생");
					}
				});
		 }

		
	}

	var roadAddr = "";
	var jibunAddr = "";
	var zipNo = "";

	function makeListJson(jsonStr) {

		var htmlStr = "";
		htmlStr += "<table class='ui unstackable table'>";
		htmlStr += "<col width='50px;'><col width='200px;'><col width='150px;'><col width='100px;'>";
		htmlStr += "<tr class='form-inline'>";
		htmlStr += "<th class='form-group'>선택</th>";
		htmlStr += "<th class='form-group'>도로명주소</th>";
		htmlStr += "<th class='form-group'>지번주소</th>";
		htmlStr += "<th class='form-group'>우편번호</th>";
		htmlStr += "</tr>";

		$(jsonStr.results.juso).each(function() {
			htmlStr += "<tr>";
			htmlStr += "<td><input type='radio' name='radioChk'></td>";
			htmlStr += "<td name='roadAddr'>" + this.roadAddr + "</td>";
			htmlStr += "<td name='jibunAddr'>" + this.jibunAddr + "</td>";
			htmlStr += "<td name='zipNo'>" + this.zipNo + "</td>";
			htmlStr += "</tr>";
		});
		htmlStr += "</table>";
		$("#list").html(htmlStr);

		$("input[name=radioChk]").click(function() {
			roadAddr = $(this).parent().next().text();
			jibunAddr = $(this).parent().next().next().text();
			zipNo = $(this).parent().next().next().next().text();

		});

	}

	function enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			getAddr();
		}
	}

	function addrSelect() {

		opener.document.getElementById("zipNo").value = zipNo;
		opener.document.getElementById("addrRoad").value = roadAddr;
		self.close();

	}

	function addrSel(chk) {
		alert(chk);
	}
</script>

</head>
<body>
	<form name="form" id="form" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="resultType" value="json" /> <input
					type="hidden" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc=" />

					<div class="ui icon input">
						<input type="text" placeholder="Search..." name="keyword"
							onkeydown="enterSearch();"> <i class="search icon"></i>
					</div>
					<div class="ui button" onclick="getAddr()">검색</div>
			</tr>
		</table>
	</form>
	<div id="list"></div>
	<!-- 검색 결과 리스트 출력 영역 -->

	<div>
		<table>
			<tr>
				<td>
					<button class="ui olive button" onclick="addrSelect()">선택</button>
					<button class="ui green button" onclick="self.close();">닫기</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>