<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<jsp:include page="acount_header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		$('.saveInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="save_form" action="save_insert.do" method="post">'+
											'<input type="text" name="id" value="${lDto.id}">'+
													'<table class="save_body" border="1">'+
													'<tr><th>구분</th><td><input type="radio" name="s_detail" value="예금">예금'+
													'<input type="radio" name="s_detail" value="적금">적금'+
													'<input type="radio" name="s_detail" value="보험">보험</td><tr>'+
													'<tr><th>저축명</th><td><input type="text" name="s_name">'+
													'<tr><th>저축금액</th><td><input type="text" name="s_money">'+
													'<tr><th>세율</th><td><input type="text" name="s_tax">'+
													'<tr><th>시작날짜</th><td><input type="date" name="s_startdate">'+
													'<tr><th>만기날짜</th><td><input type="date" name="s_enddate">'+
													'<tr><th>메모</th><td><input type="text" name="s_memo"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록">'+
													'<input type="button" value="취소"></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('.stockInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="stock_form" action="stock_insert.do" method="post">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="stock_body" border="1">'+
													'<tr><th>주식명</th><td><input type="text" name="st_name">'+
													'<tr><th>구매수량</th><td><input type="text" name="st_count">'+
													'<tr><th>매수금액</th><td><input type="text" name="st_money">'+
													'<tr><th>평가금액</th><td><input type="text" name="st_add">'+
													'<tr><th>매수날짜</th><td><input type="date" name="st_buydate">'+
													'<tr><th>메모</th><td><input type="text" name="st_memo"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록">'+
													'<input type="button" value="취소"></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('.fundInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="fund_form" action="fund_insert.do" method="post">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="fund_body" border="1">'+
													'<tr><th>펀드명</th><td><input type="text" name="f_name">'+
													'<tr><th>투자원금</th><td><input type="text" name="f_money">'+
													'<tr><th>평가금액</th><td><input type="text" name="f_add">'+
													'<tr><th>매수날짜</th><td><input type="date" name="f_buydate">'+
													'<tr><th>만기날짜</th><td><input type="date" name="f_enddate">'+
													'<tr><th>메모</th><td><input type="text" name="f_memo"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록">'+
													'<input type="button" value="취소"></td></tr>'+
													'</table>'
		 	 );

		});
		
		$('.loanInsertForm').click(function(){
			$('.input_body_wrap').children().remove();
			//form 및 테이블 생성
			$('.input_body_wrap').append('<form class="loan_form" action="loan_insert.do" method="post">'+
											'<input type="hidden" name="id" value="${lDto.id}">'+
													'<table class="loan_body" border="1">'+
													'<tr><th>대출명</th><td><input type="text" name="l_name">'+
													'<tr><th>대출원금</th><td><input type="text" name="l_money">'+
													'<tr><th>대출상환금</th><td><input type="text" name="l_remane">'+
													'<tr><th>시작날짜</th><td><input type="date" name="l_startdate">'+
													'<tr><th>만기날짜</th><td><input type="date" name="l_enddate">'+
													'<tr><th>메모</th><td><input type="text" name="l_memo"></td><tr>'+
													
													'<tr><td colspan="2"><input type="submit" value="등록">'+
													'<input type="button" value="취소"></td></tr>'+
													'</table>'
		 	 );

		});
		
	});

</script>
</head>
<body>
<div class="input_header_wrap">
	<div class="input_header">
		<button class="saveInsertForm">저축등록</button>
		<button class="stockInsertForm">주식등록</button>
		<button class="fundInsertForm">펀드등록</button>
		<button class="loanInsertForm">대출등록</button>
	</div>
</div>
<div class="input_body_wrap">
	
</div>
</body>
</html>