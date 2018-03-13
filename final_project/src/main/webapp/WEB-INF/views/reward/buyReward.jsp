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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function end() {
		window.close();
	}
	function a(){
		location.href="makeQR.do";
	}
</script>
<style type="text/css">
img {
	height: 100px;
	width: 100px;
}
</style>
</head>
<body>
	<form>
		<table>
			<tr>
				<td>
					<div>
						<div>
							<img alt="상품 이미지" src="resources/upload/${rdto.r_file}"
								onclick="buyReward()">
						</div>
						<div>
							<input type="text" value="${rdto.r_name}" readonly="readonly" />
						</div>
						<div>
							<input type="text" value="${rdto.r_point}" readonly="readonly" />
						</div>
						<div>
							<input type="text" value="${rdto.b_name.b_name}"
								readonly="readonly" />
						</div>
						<div>
							구매 하시겠습니까?<input type="submit" value="네"/><input type="button"
								value="아니오" onclick="end()"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<input type="button" value="QR" onclick="location.href='makeQR.do'">
</body>
</html>