<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<jsp:include page="../header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function addAcount(ele) {
		//예산 합산 
		var beforeVal = $("input[name=totalMoney]").val();
		beforeVal = parseInt(beforeVal);
		var val = $(ele).parent().parent().next().next().children().eq(0).val();
		val = parseInt(val);
		beforeVal = beforeVal + val;
		$("input[name=totalMoney]").val(beforeVal);

		//입력한 태그 잠구기
		$(ele).attr("onclick", "").children().eq(0).attr("src","resources/icon/minus.png");

		$(ele).parent().parent().parent().find("input").attr("readonly", true);

		//input태그 생성
		var inputForm = $("#inputWrap");

		var div = "";
		div = "<div class='inputField'><div class='plus icon field'><div class='four wide column'>"
				+ "<a href='#' onclick='addAcount(this)'>"
				+ "<img src='resources/icon/plus.png' alt='plus icon' style='width: 30px; height: 30px;'></a></div></div>";

		div += "<select name='g_name' style='width: 100px;'><optgroup label='생활'><option value='식사'>식사</option><option value='생활/마트'>생활/마트</option>"
				+ "<option value='육아'>육아</option><option value='주거/통신'>주거/통신</option><option value='담배/카페'>담배/카페</option></optgroup>";
		div += "<optgroup label='자기개발'><option value='자기개발'>자기개발</option><option value='문화/예술'>문화/예술</option><option value='의료/건강'>의료/건강</option>"
				+ "<option value='투자'>투자</option></optgroup>";

		div += "<optgroup label='여행/레져'><option value='스포츠/레져'>스포츠/레져</option><option value='여행/숙박'>여행/숙박</option><option value='차량/교통'>차량/교통</option>"
				+ "</optgroup><optgroup label='기타'>";

		div += "<option value='패션/미용'>패션/미용</option><option value='쇼핑'>쇼핑</option><option value='술/유흥'>술/유흥</option></optgroup></select>";

		div += "<div class='ui input' id='insertAcount'><input type='text' name='g_money' placeholder='금액입력' style='width: 200px;'>"
				+ "<div>&nbsp;</div><input type='text' name='g_memo' placeholder='내용을 입력해주세요.'></div>";

		inputForm.append(div);

	}
</script>
</head>
<body>
	<div class="ui middle aligned center aligned grid">
		<div class="ui eight wide column form">
			<h2>목표설정</h2>
			<div class="ui message">
				<div class="middle aligned center aligned inline fields ">
					<div class="field">
						<div class="ui middle aligned input">
							<div>총예산</div>
						</div>
					</div>
					<div class="field">
						<div class="ui middle aligned input">
							<input type="text" name="totalMoney" value="0"
								readonly="readonly">
							<div>원</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ui dividing header"></div>
			<form id="goal_form" action="goal_insert.do" method="post">
				<div class="ui center aligned" id="inputWrap">
					<div class="inputField">
						<div class="plus icon field">
							<div class="four wide column">
								<a href="#" onclick="addAcount(this)"> <img
									src="resources/icon/plus.png" alt="plus icon"
									style="width: 30px; height: 30px;">
								</a>
							</div>
						</div>
						<select name="g_name" style="width: 100px;">
							<optgroup label="생활">
								<option value="식사">식사</option>
								<option value="생활/마트">생활/마트</option>
								<option value="육아">육아</option>
								<option value="주거/통신">주거/통신</option>
								<option value="담배/카페">담배/카페</option>
							</optgroup>
							<optgroup label="자기개발">
								<option value="자기개발">자기개발</option>
								<option value="문화/예술">문화/예술</option>
								<option value="의료/건강">의료/건강</option>
								<option value="투자">투자</option>
							</optgroup>
							<optgroup label="여행/레져">
								<option value="스포츠/레져">스포츠/레져</option>
								<option value="여행/숙박">여행/숙박</option>
								<option value="차량/교통">차량/교통</option>
							</optgroup>
							<optgroup label="기타">
								<option value="패션/미용">패션/미용</option>
								<option value="쇼핑">쇼핑</option>
								<option value="술/유흥">술/유흥</option>
							</optgroup>
						</select>
						<div class="ui input" id="insertAcount">
							<input type="text" name="g_money" placeholder="금액입력" style="width: 200px;">
							<div>&nbsp;</div>
							<input type="text" name="g_memo" placeholder="내용을 입력해주세요.">
						</div>
					</div>
				</div>
				<div class="ui dividing header"></div>
				<input type="submit" id="goal_submit"
					class="ui right aligned olive button" value="설정완료"> <input
					type="button" class="ui right aligned button"
					onclick="location.href='goal_cancel.do'">
			</form>
		</div>
	</div>
</body>
</html>