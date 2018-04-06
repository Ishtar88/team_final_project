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
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/jquery.fullpage.css" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/jquery.fullpage.js"></script>
<script src="resources/assets/semantic.min.js"></script>
<script type="text/javascript">
		$(window).ready(function() {
			$("#fullpage").fullpage();
		});
	onload = function() {
		history.replaceState({}, null, location.pathname);
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
	#myvid{ 
		z-index: -200; 
		}

.section{
/* 	background-image: no-repeat center; */
/* 	background-size: cover; */
	width:100%;
	height:100%;
}

span {
	position: absolute;
	font-size: 2em;
	color: white;
	font-weight: bold;
	text-shadow:1px 1px 2px black;
}

h1 {
	color:white;
	font-size:1.8em;
	font-family:"Nanum Gothic", "맑은 고딕", 돋움;			
	text-shadow:1px 1px 2px black;
}

#page1{

}

#page2{
	background: url('resources/background-image/drink.jpg' ) no-repeat center;
	background-size: cover;
}

#page3{
	background: url('resources/background-image/saving_modify.jpg' ) no-repeat center;
	background-size: cover;
}

#page4{
	background:url('resources/background-image/business2.jpg') no-repeat center;
	background-size: cover;
	
}

#text1{
	top: 20%;
	left: 33%;
}
#text2{
	top: 20%;
	left: 55%;
}
#text3{
	top: 25%;
	left: 5%;
}
#text4{
	position:absolute;
	top: 20%;
	left: 65%;
	margin-right:50px;
  padding:30px 50px;
  background:rgba(35,35,35,0.1);
  
  }
  input{
  
  	width:150px; 
  	height:30px;
  
  }
  
 #kakaoLogin{
 	width: 100px;
 	height:30px;
 }
 
	a{
	text-decoration: none;
 }
  
}
</style>
</head>
<body>

<!--  풀 페이지  -->
<div id="fullpage">
	
<!-- 	첫화면  -->
		<div class="section " id="page1">
		<video id="myvid" loop muted controls="false"  data-autoplay>
				<source src="resources/background-image/video_high.mp4"
					type="video/mp4">
			</video>
			<span id="text1">바쁜 현대인의 삶. 당신은 오늘 어떤 하루를 보냈나요?</span> 
		</div>
		
<!-- 		두번째 화면  -->
		<div class="section" id="page2">
			<span id="text2">혹시,  마음먹은 대로 되지 않는 재정상태에 <br>좌절하진 않았나요? </span>
		</div>
		
<!-- 		세번째 화면 -->
		<div class="section" id="page3">
			<span id="text3">이제 캐시 매니저가 당신의 자산관리를 도와드립니다.</span>
			
		</div>
		
		
<!-- 		네번째 화면 -->
<div class="section" id="page4">
	<div id="text4">
		<div class="column" style="width:400px;">

				<h1>계획적인 삶을 향한 발걸음. <br>시작해볼까요?</h1>
					<form class="ui large form" action="login.do" onsubmit="return loginChk()">
					<div class="field">
							<input type="text" name="id" placeholder="ID">
							<input type="password" name="m_password" placeholder="Password">
					</div>
						<input type="submit" value="Login"
							class="ui fluid large submit button" style="width:315px;">
				
				<div class="ui error message"></div>

			<div id="kakaoLogin" style="padding-top: 10px;">
				<a id="kakao-login-btn"></a>
			</div>
			</form>
			</div>
			<br>
				<div class="regist_detail">
				<a href="regist1.do">회원가입 </a>
				<a href="findIdPw.do">아이디/비밀번호 찾기</a>
				</div>
		</div>
</div>
			
			
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
								alert(result.properties.nickname + "님 안녕하세요.");
								var id = JSON.stringify(result.id);
								var email = result["kaccount_email"];
								var name = JSON
										.stringify(result.properties.nickname);
								location.href = "kakaoLogin.do?name=" + name
										+ "&m_email=" + email + "&kakaoId="
										+ id;
								history.replaceState({}, null,
										location.pathname);
							}
						});
						alert(JSON.stringify(authObj));
					},
					fail : function(err) {
						alert(JSON.stringify(err));
					}
				});
			</script>
</body>
</html>
