<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#purple {background-color:#343DEA;}
	#pattern_menu{
	
	background-color: purple;
	height:50px; 
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="ui attached stackable menu">
  <div class="ui container">
    <a class="item" href="analysis_main.do">
       홈 
    </a>
    <a class="item">
      수익패턴
    </a>
    <a class="item" href="an_consumption_main.do">
       지출패턴
    </a>
    <a class="item">
       투자패턴
    </a>
    </div>
    <div class="right item">
      <div class="ui input"><input type="text" placeholder="Search..."></div>
    </div>
  </div>
<div>
	<div class="analy_search">
		<span><a href="#">1개월</a></span>
		<span><a href="#">3개월</a></span>
		<span><a href="#">6개월</a></span>
	</div>
</div>
</body>

</html>