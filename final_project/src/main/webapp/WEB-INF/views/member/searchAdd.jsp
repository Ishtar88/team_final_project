<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function getAddr() {
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
					alert(errCode + "=" + errDesc);
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

	var roadAddr = "";
	var jibunAddr = "";
	var zipNo = "";

	function makeListJson(jsonStr) {

		var htmlStr = "";
		htmlStr += "<table class='table table-bordered'>";
		htmlStr += "<caption>주소검색 결과</caption>";
		htmlStr += "<col width='50px;'><col width='200px;'><col width='150px;'><col width='100px;'>";
		htmlStr += "<tr class='form-inline'>";
		htmlStr += "<th class='form-group'>선택</th>";
		htmlStr += "<th class='form-group'>도로명주소</th>";
		htmlStr += "<th class='form-group'>지번주소</th>";
		htmlStr += "<th class='form-group'>우편번호</th>";
		htmlStr += "</tr>";

		$(jsonStr.results.juso)
				.each(
						function() {
							htmlStr += "<tr>";
							htmlStr += "<td><input type='radio' name='radioChk'></td>";
							htmlStr += "<td name='roadAddr'>"
									+ this.roadAddr + "</td>";
							htmlStr += "<td name='jibunAddr'>"
									+ this.jibunAddr + "</td>";
							htmlStr += "<td name='zipNo'>"
									+ this.zipNo + "</td>";
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

		opener.document.getElementById("zipNo").value=zipNo;
		opener.document.getElementById("addrRoad").value=roadAddr;
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
				<td>
				<input type="hidden" name="resultType" value="json" />
				<input type="hidden" name="confmKey"
					value="U01TX0FVVEgyMDE4MDEyNTE2MjU1MjEwNzYzMDc=" />
				<input type="text" name="keyword" onkeydown="enterSearch();" />
				<input type="button" onclick="getAddr()" value="주소검색하기"/></td>
			</tr>
		</table>
	</form>
		<div id="list"></div>
		<!-- 검색 결과 리스트 출력 영역 -->

<div>
	<table>
		<tr>
			<td>
				<input type="button" value="선택" onclick="addrSelect()">
				<input type="button" value="닫기" onclick="self.close();">
			</td>
		</tr>
	</table>
</div>
</body>
</html>