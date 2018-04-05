<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$('#saveInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="acount_form" action="save_insert.do" method="post" onsubmit="acount_insert()">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="save_body ui definition table" border="1">'+
													'<tr><th>구분</th><td><input type="radio" name="s_detail" value="예금" required="required">예금'+
													'<input type="radio" name="s_detail" value="적금" required="required">적금'+
													'<input type="radio" name="s_detail" value="보험" required="required">보험</td><tr>'+
													'<tr><th>저축명</th><td><input type="text" name="s_name" required="required">'+
													'<tr><th>저축금액</th><td><input type="number" name="s_money" required="required">'+
													'<tr><th>세율</th><td><input type="text" name="s_tax" required="required">'+
													'<tr><th>시작날짜</th><td><input type="date" name="st_date" required="required">'+
													'<tr><th>만기날짜</th><td><input type="date" name="en_date" required="required">'+
													'<tr><th>메모</th><td><input type="text" name="s_memo" required="required"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록" class="ui olive button">'+
													'<div class="ui orange button">취소</div></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('#stockInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="acount_form" action="stock_insert.do" method="post" onsubmit="acount_insert()">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="stock_body ui definition table" border="1">'+
													'<tr><th>주식명</th><td><input type="text" name="st_name" required="required">'+
													'<tr><th>구매수량</th><td><input type="number" name="st_count" required="required">'+
													'<tr><th>매수금액</th><td><input type="number" name="st_money" required="required">'+
													'<tr><th>평가금액</th><td><input type="number" name="st_add" required="required">'+
													'<tr><th>매수날짜</th><td><input type="date" name="buydate" required="required">'+
													'<tr><th>메모</th><td><input type="text" name="st_memo" required="required"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록" class="ui olive button">'+
													'<div class="ui orange button">취소</div></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('#fundInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="acount_form" action="fund_insert.do" method="post" onsubmit="acount_insert()">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="fund_body ui definition table" border="1">'+
													'<tr><th>펀드명</th><td><input type="text" name="f_name" required="required">'+
													'<tr><th>투자원금</th><td><input type="number" name="f_money" required="required">'+
													'<tr><th>평가금액</th><td><input type="number" name="f_add" required="required">'+
													'<tr><th>매수날짜</th><td><input type="date" name="buydate" required="required">'+
													'<tr><th>만기날짜</th><td><input type="date" name="enddate" required="required">'+
													'<tr><th>메모</th><td><input type="text" name="f_memo" required="required"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록" class="ui olive button">'+
													'<div class="ui orange button">취소</div></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('#loanInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="acount_form" action="loan_insert.do" method="post" onsubmit="acount_insert()">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="loan_body ui definition table" border="1">'+
													'<tr><th>대출명</th><td><input type="text" name="l_name" required="required">'+
													'<tr><th>대출원금</th><td><input type="number" name="l_money" required="required">'+
													'<tr><th>대출상환금</th><td><input type="number" name="l_remane" required="required">'+
													'<tr><th>시작날짜</th><td><input type="date" name="st_date" required="required">'+
													'<tr><th>만기날짜</th><td><input type="date" name="en_date" required="required">'+
													'<tr><th>메모</th><td><input type="text" name="l_memo" required="required"></td><tr>'+
													'<tr><td colspan="2"><input type="submit" value="등록" class="ui olive button">'+
													'<div class="ui orange button">취소</div></td></tr>'+
													'</table>'
		 	 );

		});
		
	});
	
	function acount_insert(){
		var name=$(".acount_form").children().eq(1).children().children()
	}

</script>
</head>
<body>
<div class="ui secondary pointing menu">
  <a class="active item" id="saveInsertForm">
    저축등록
  </a>
  <a class="item" id="stockInsertForm">
    주식등록
  </a>
  <a class="item" id="fundInsertForm">
    펀드등록
  </a>
  <a class="item" id="loanInsertForm">
    대출등록
  </a>
</div>

<div class="input_body_wrap">
</div>
</body>
</html>