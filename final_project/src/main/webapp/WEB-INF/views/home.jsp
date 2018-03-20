<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/assets/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<head>
	<title>Home</title>
</head>
  <style type="text/css">
  
	#purple {background-color:#343DEA;}
	
    .hidden.menu {
      display: none;
    }
    .masthead.segment {
      min-height: 700px;
      padding: 1em 0em;
    }
    .masthead .logo.item img {
      margin-right: 1em;
    }
    .masthead .ui.menu .ui.button {
      margin-left: 0.5em;
    }
    .masthead h1.ui.header {
      margin-top: 3em;
      margin-bottom: 0em;
      font-size: 4em;
      font-weight: normal;
    }
    .masthead h2 {
      font-size: 1.7em;
      font-weight: normal;
    }

    .ui.vertical.stripe {
      padding: 8em 0em;
    }
    .ui.vertical.stripe h3 {
      font-size: 2em;
    }
    .ui.vertical.stripe .button + h3,
    .ui.vertical.stripe p + h3 {
      margin-top: 3em;
    }
    .ui.vertical.stripe .floated.image {
      clear: both;
    }
    .ui.vertical.stripe p {
      font-size: 1.33em;
    }
    .ui.vertical.stripe .horizontal.divider {
      margin: 3em 0em;
    }

    .quote.stripe.segment {
      padding: 0em;
    }
    .quote.stripe.segment .grid .column {
      padding-top: 5em;
      padding-bottom: 5em;
    }

    .footer.segment {
      padding: 5em 0em;
    }

    .secondary.pointing.menu .toc.item {
      display: none;
    }

    @media only screen and (max-width: 700px) {
      .ui.fixed.menu {
        display: none !important;
      }
      .secondary.pointing.menu .item,
      .secondary.pointing.menu .menu {
        display: none;
      }
      .secondary.pointing.menu .toc.item {
        display: block;
      }
      .masthead.segment {
        min-height: 350px;
      }
      .masthead h1.ui.header {
        font-size: 2em;
        margin-top: 1.5em;
      }
      .masthead h2 {
        margin-top: 0.5em;
        font-size: 1.5em;
      }
    }


  </style>
  <!------------------------
  		follow
   ------------------------->
  <script>
  $(document)
    .ready(function() {

      // fix menu when passed
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        })
      ;

      // create sidebar and attach to menu open
      $('.ui.sidebar')
        .sidebar('attach events', '.toc.item')
      ;

    })
  ;
  </script>
<body>

<!-- Following Menu -->
<div class="ui large top fixed hidden menu">
  <div class="ui container">
    <a class="active item" href="home.do">홈</a>
    <a class="item" href="acount.do">자산관리</a>
    <a class="item" href="analysis_main.do">패턴분석</a>
    <a class="item" href="rewardMain.do">포인트몰</a>
    <a class="item" href="customer.do">고객센터</a>
    <div class="right menu">
      <div class="item">
        <a class="ui button"></a>
      </div>
      <div class="item">
        <a class="ui primary button">회원가입</a>
      </div>
    </div>
  </div>
</div>

<!-- Sidebar Menu -->
<div class="ui vertical inverted sidebar menu">
      <a class="active item" href="home.do">홈</a>
    <a class="item" href="acount.do">자산관리</a>
    <a class="item" href="analysis_main.do">패턴분석</a>
    <a class="item" href="rewardMain.do">포인트몰</a>
    <a class="item" href="customer.do">고객센터</a>
  <a class="item">로그인</a>
  <a class="item">회원가입</a>
</div>


<!-- Page Contents -->
<div class="pusher">
  <div class="ui inverted vertical masthead center aligned segment" id="purple">

    <div class="ui container">
      <div class="ui large secondary inverted pointing menu">
        <a class="toc item">
          <i class="sidebar icon"></i>
        </a>
    <a class="active item" href="home.do">홈</a>
    <a class="item" href="acount.do">자산관리</a>
     <a class="item" href="analysis_main.do">패턴분석</a>
    <a class="item" href="rewardMain.do">포인트몰</a>
    <a class="item"  href="customer.do">고객센터</a>
        <div class="right item">
          <a class="ui inverted button" href="getUser.do">${loginDto.m_name}님</a>
          <a class="ui inverted button" href="logout.do">로그아웃</a>
        </div>
      </div>
    </div>

<!-- Page Contents -->
    <div class="ui text container">
      <h1 class="ui inverted header">
        오직 당신을 위한 가계부 
      </h1>
      <h2>simple cash로 예산설정, 패턴분석까지 한번에!</h2>
      <div class="ui huge primary button"> 지금 시작하기 <i class="right arrow icon"></i></div>
    </div>

  </div>

  <div class="ui vertical stripe segment">
    <div class="ui middle aligned stackable grid container">
      <div class="row">
        <div class="eight wide column">
          <h3 class="ui header">나는 한달에 얼마나 쓰고 있을까?</h3>
          <p>매일 하루 소비내역을 입력해서 자산을 체계적으로 관리하세요.</p>
          <h3 class="ui header">월급을 될대로 되라 방치하는 당신은 스튜핏!</h3>
          <p>심플캐시가 여러분의 예산설정과 목표관리를 도와드려요.</p>
        </div>
        <div class="six wide right floated column">
          <img src="assets/images/wireframe/white-image.png" class="ui large bordered rounded image">
        </div>
      </div>
      <div class="row">
        <div class="center aligned column">
          <a class="ui huge button">확인해보기</a>
        </div>
      </div>
    </div>
  </div>


  <div class="ui vertical stripe quote segment">
    <div class="ui equal width stackable internally celled grid">
      <div class="center aligned row">
        <div class="column">
          <h3>"최고의 팀워크"</h3>
          <p>공동개발구역 JSR의 기념비적인 첫 프로젝트</p>
        </div>
        <div class="column">
          <h3>"따라올 자가 없다"</h3>
          <p>
            강사님도 인정한 팀장님의 꿀피부
          </p>
        </div>
      </div>
    </div>
  </div>

  <div class="ui vertical stripe segment">
    <div class="ui text container">
      <h3 class="ui header">소비패턴을 분석해 당신에 대해 알아보아요</h3>
      <p>당신의 예산설정, 목표달성률, 소비 패턴을 분석해서 어떤 유형인지 알려주는 스마트한 가계부</p>
      <a class="ui large button">더 알아보기</a>
      <h4 class="ui horizontal header divider">
        <a href="#">숨겨왔던 멋진 사실</a>
      </h4>
      <h3 class="ui header">회식 일주일에 세번 하는 팀</h3>
      <p>우리 팀이 지금까지 어떤 메뉴를 먹었는지 알아볼까요?</p>
      <a class="ui large button">관심있어요!</a>
    </div>
  </div>


</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
