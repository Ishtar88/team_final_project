<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/assets/semantic.min.js"></script>
<script type="text/javascript">
	onload=function(){
		history.replaceState({},null ,location.pathname);
	}
	function loginChk() {
		var id = $("input[name=id]").val();
		var pw = $("input[name=m_password]").val();
		if (id == "" || pw == "") {
			alert("아이디,비밀번호를 입력 해 주세요.");
			return false;
		}
	}
</script>
<style type="text/css">
body {
	background-color: #DADADA;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;
}
</style>
<body>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui teal image header">
				<img src="assets/images/logo.png" class="image">
				<div class="content">Log-in to your account</div>
			</h2>
			<form class="ui large form" action="login.do"
				onsubmit="return loginChk()">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input type="text" name="id"
								placeholder="ID">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="lock icon"></i> <input type="password"
								name="m_password" placeholder="Password">
						</div>
					</div>
					<div>
						<input type="submit" value="Login"
							class="ui fluid large teal submit button">
					</div>
				</div>
				<div class="ui error message"></div>

			</form>

			<div id="kakaoLogin" style="padding-bottom: 10px;">
				<a id="kakao-login-btn"></a>
			</div>

			<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
			<script type="text/javascript">
				Kakao.init('5c49400a7e81a5ffd63bb4072dedf203');
				Kakao.Auth.createLoginButton({
					container : '#kakao-login-btn',
					success : function(authObj) {
						Kakao.API.request({
							url : "/v1/user/me",
							success : function(result) {
								alert(result.properties.nickname+"님 안녕하세요.");
								var id=JSON.stringify(result.id);
								var email=result["kaccount_email"];
								var name=JSON.stringify(result.properties.nickname);
								location.href="kakaoLogin.do?name="+name+"&m_email="+email+"&kakaoId="+id;
								history.replaceState({},null ,location.pathname);
							}
						});
						alert(JSON.stringify(authObj));
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
			</script>
			<div class="ui message">
				<a href="regist1.do">회원가입</a>
			</div>

		</div>
	</div>
</body>
</html>
