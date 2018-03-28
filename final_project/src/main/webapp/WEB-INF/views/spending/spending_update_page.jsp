<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/assets/semantic.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="resources/assets/semantic.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.fund_update_page_wrap {
	width: 300px;
}
.cashable_form, .card_form {
	display: none;
}
#name, #detail, #card, #some, #radio {
	display: inline-block;
}
</style>
</head>
<body>
	<c:if test="${isc }">
		<script type="text/javascript">
			self.close();
		</script>
	</c:if>
	<script type="text/javascript">
		$(function() {
			var satStar = document.getElementsByName("p_sat")[0].value;
			var needStar = document.getElementsByName("p_need")[0].value;

			if (satStar != null) {
				var i;
				var image;
				var el;
				for (var i = 1; i <= satStar; i++) {
					image = 'satImage' + i;
					el = document.getElementById(image);
					el.src = "resources/icon/star_full.png";
				}

			}
			if (needStar != null) {
				var i;
				var image;
				var el;
				for (var i = 1; i <= needStar; i++) {
					image = 'needImage' + i;
					el = document.getElementById(image);
					el.src = "resources/icon/star_full.png";
				}
			}
			

		
		$("input[name=p_some]").click(function() {
			var chk = $(this).val();
			if (chk == '현금') {
				$(".cashable_form").css("display","table-row");
				$(".card_form").css("display","none");
			} else {
				$(".card_form").css("display","table-row");
				$(".cashable_form").css("display","none");
			}
		});

		var food = []

		$("select[name=p_name]")
				.click(
						function() {
							var val = $(this).val();

							if (val == '식사') {
								var food = [ '고정식사', '한식', '일식', '중식', '고기집',
										'뷔페', '패스트푸드', '일반식당', '배달', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= food.length; i++) {
									var option = $("<option>");
									option.val(food[i]);
									option.html(food[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '생활/마트') {
								var life = [ '마트', '편의점', '생필품', '가전제품', '가구',
										'육아', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= life.length; i++) {
									var option = $("<option>");
									option.val(life[i]);
									option.html(life[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '육아') {
								var child = [ '학원비', '학교', '교재', '보육비', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= child.length; i++) {
									var option = $("<option>");
									option.val(child[i]);
									option.html(child[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '주거/통신') {
								var house = [ '집세', '관리비', '통신', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= house.length; i++) {
									var option = $("<option>");
									option.val(house[i]);
									option.html(house[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '의료/건강') {
								var medical = [ '병원', '약국', '보조식품', '의료기기',
										'운동', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= medical.length; i++) {
									var option = $("<option>");
									option.val(medical[i]);
									option.html(medical[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '패션/미용') {
								var fashion = [ '헤어샵', '화장품', '피부/체형관리', '네일',
										'기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= fashion.length; i++) {
									var option = $("<option>");
									option.val(fashion[i]);
									option.html(fashion[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '술/유흥') {
								var alchol = [ '술', '유흥', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= alchol.length; i++) {
									var option = $("<option>");
									option.val(alchol[i]);
									option.html(alchol[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '차량/교통') {
								var car = [ '차량유지비', '차량보험비', '유류비', '주차/요금소',
										'대리비', '택시비', '대중교통', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= car.length; i++) {
									var option = $("<option>");
									option.val(car[i]);
									option.html(car[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '경조사/회비') {
								var pay = [ '경조사', '기부', '헌금', '회비', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= pay.length; i++) {
									var option = $("<option>");
									option.val(pay[i]);
									option.html(pay[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '담배/카페') {
								var smoke = [ '담배', '커피', '음료', '베이커리', '디저트',
										'기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= smoke.length; i++) {
									var option = $("<option>");
									option.val(smoke[i]);
									option.html(smoke[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '쇼핑') {
								var shopping = [ '백화점', '아울렛', '잡화', '패션',
										'홈쇼핑', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= shopping.length; i++) {
									var option = $("<option>");
									option.val(shopping[i]);
									option.html(shopping[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '자기개발') {
								var self = [ '학습교재', '학습시설', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= self.length; i++) {
									var option = $("<option>");
									option.val(self[i]);
									option.html(self[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val = '문화/예술') {
								var culture = [ '공연', '도서', '영화', '전시/관람', '기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= culture.length; i++) {
									var option = $("<option>");
									option.val(culture[i]);
									option.html(culture[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == 'sport') {
								var sport = [ '스포츠용품구매', '스포츠용품렌트비', '이용권구매',
										'기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= sport.length; i++) {
									var option = $("<option>");
									option.val(sport[i]);
									option.html(sport[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '여행/숙박') {
								var tour = [ '숙박비', '관광', '여행용품', '항공', '해외결제',
										'기타' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= tour.length; i++) {
									var option = $("<option>");
									option.val(tour[i]);
									option.html(tour[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '투자') {
								var acount = [ '적금', '주식', '펀드', '보험' ];
								$("optgroup[label='소분류']").children().remove();
								for (var i = 0; i <= acount.length; i++) {
									var option = $("<option>");
									option.val(acount[i]);
									option.html(acount[i]);
									$("optgroup[label='소분류']").append(option);
								}
							} else if (val == '기타지출') {
								$("optgroup[label='소분류']").children().remove();
								option.val("기타");
								option.html("기타");
								$("optgroup[label='소분류']").append(option);
							} else if (val == '출금') {
								$("optgroup[label='소분류']").children().remove();
								option.val("기타");
								option.html("기타");
								$("optgroup[label='소분류']").append(option);
							}

						});
		
		});
		
		function satChk(star) {
			if (satLocked) {
				satLocked = false;
				var point = $("input[name=p_sat]").val(0);
				alert("선택을 취소하셨습니다.");
			} else {
				satLock(star);
				alert(star + "점을 선택하셨습니다.");
				var point = $("input[name=p_sat]").val(star);
			}

		}

		function needChk(star) {
			if (needLocked) {
				needLocked = false;
				var point = $("input[name=p_sat]").val(0);
				alert("선택을 취소하셨습니다.");
			} else {
				needLock(star);
				alert(star + "점을 선택하셨습니다.");
				var point = $("input[name=p_need]").val(star);
			}
		}

		function satLock(star) {
			satShow(star);
			satLocked = true;
		}

		function needLock(star) {
			needShow(star);
			needLocked = true;
		}

		function satShow(star) {
			if (satLocked) {
				return;
			}
			var i;
			var image;
			var el;

			for (var i = 1; i <= star; i++) {
				image = 'satImage' + i;
				el = document.getElementById(image);
				el.src = "resources/icon/star_full.png";
			}

		}

		function satNoShow(star) {
			if (satLocked) {
				return;
			}

			var i;
			var image;
			var el;

			for (var i = 1; i <= star; i++) {
				image = 'satImage' + i;
				el = document.getElementById(image);
				el.src = "resources/icon/star_empty.png";
			}

		}

		function needShow(star) {
			if (needLocked) {
				return;
			}
			var i;
			var image;
			var el;

			for (var i = 1; i <= star; i++) {
				image = 'needImage' + i;
				el = document.getElementById(image);
				el.src = "resources/icon/star_full.png";
			}

		}

		function needNoShow(star) {
			if (needLocked) {
				return;
			}

			var i;
			var image;
			var el;

			for (var i = 1; i <= star; i++) {
				image = 'needImage' + i;
				el = document.getElementById(image);
				el.src = "resources/icon/star_empty.png";
			}

		}

		
	</script>
	<form action="spending_update.do" method="post">
		<div class="fund_update_page_wrap">
			<table class="fund_update_page_wrap ui orange table">
				<tr>
					<td>지출 대분류 <i class="ellipsis vertica icon"></i> <select
						class="ui fluid mini dropdown" id="name" name="p_name"
						style="width: 150px;">
							<option>------------------</option>
							<optgroup label="생활">
								<option value="식사">식사</option>
								<option value="생활/마트">생활/마트</option>
								<option value="육아">육아</option>
								<option value="주거/통신">주거/통신</option>
								<option value="담배/카페">담배/카페</option>
								<option value="패션/미용">패션/미용</option>
								<option value="쇼핑">쇼핑</option>
							</optgroup>
							<optgroup label="자기개발">
								<option value="자기개발">자기개발</option>
								<option value="문화/예술">문화/예술</option>
								<option value="의료/건강">의료/건강</option>
							</optgroup>
							<optgroup label="여행/레져">
								<option value="sport">스포츠/레져</option>
								<option value="여행/숙박">여행/숙박</option>
								<option value="차량/교통">차량/교통</option>
							</optgroup>
							<optgroup label="투자">
								<option value="투자">투자</option>
							</optgroup>
							<optgroup label="기타">
								<option value="술/유흥">술/유흥</option>
								<option value="기타지출">기타지출</option>
								<option value="출금">출금</option>
							</optgroup>
					</select>
					</td>
				</tr>
				<tr>
					<td>지출 소분류 <i class="ellipsis vertica icon"></i> <select
						class="ui fluid mini dropdown" id="detail" name="p_detail"
						style="width: 150px;">
							<optgroup label="소분류">
								<option>소분류</option>
							</optgroup>
					</select>
					</td>
				</tr>
				<tr>
					<td>지출장소 <i class="ellipsis vertica icon"></i>
						<div class="ui mini input">
							<input type="text" name="p_location" value="${sDto.p_location }">
						</div>
					</td>
				</tr>
				<tr>
					<td>지출금액 <i class="ellipsis vertica icon"></i>
						<div class="ui mini input">
							<input type="text" name="p_money" value="${sDto.p_money }">
						</div>
					</td>
				</tr>
				<tr>
				<td>
				지출수단
				<i class="ellipsis vertica icon"></i>
				<input type="radio" name="p_some" value="현금" ${sDto.p_some.equals('현금')?'checked':'' } ><label>현금</label>
					&nbsp; <input type="radio" name="p_some" value="카드" ${sDto.p_some.equals('카드')?'checked':'' } ><label>카드</label>
					</td>
				</tr>
				<c:if test="${sDto.p_some=='현금'?true:false }">
					<tr class="cashable_form">
						<td>현금영수증여부 <i class="ellipsis vertica icon"></i>
							<div class="ui mini input">
								<input type="text" name="p_cashable"
									value="${sDto.p_cashable=='Y'?'발급':'미발급' }">
							</div>
						</td>
					</tr>
				</c:if>
				<c:if test="${sDto.p_some=='카드'?true:false }">
				<tr class="card_form">
				<td>
					할부
					<i class="ellipsis vertica icon"></i>
					<select class="ui fluid mini dropdown" id="card" name="p_card" style="width: 150px;">
							<option value="1">일시불</option>
							<c:forEach var="i" begin="2" end="12" step="1">
								<option value="${i }">${i }개월</option>
							</c:forEach>

					</select>
				</td>
			</tr>
				</c:if>
				<tr>
					<td>지출날짜 <i class="ellipsis vertica icon"></i>
						<div class="ui mini input">
							<input type="date" name="p_regdate"
								value='<fmt:formatDate value="${sDto.p_regdate }" pattern="yyyy-MM-dd"/>'>
						</div>
					</td>
				</tr>
				<tr>
					<td>만족도 <i class="ellipsis vertica icon"></i>
						<div class="ui mini input">
							<input type="hidden" name="p_sat" value="${sDto.p_sat }">
						</div> <c:forEach var="i" begin="1" end="5" step="1">
							<img alt="star" src="resources/icon/star_empty.png"
								id="satImage${i}" onclick="satChk('${i}')" onmouseover="satShow('${i}')" onmouseout="satNoShow('${i}')">
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>필요성 <i class="ellipsis vertica icon"></i>
						<div class="ui mini input">
							<input type="hidden" name="p_need" value="${sDto.p_need }">
						</div> <c:forEach var="i" begin="1" end="5" step="1">
							<img alt="star" src="resources/icon/star_empty.png"
								id="needImage${i}" onclick="needChk('${i}')" onmouseover="needShow('${i}')" onmouseout="needNoShow('${i}')">
						</c:forEach>
					</td>
				</tr>

				<tr>
					<td>
						<button class="ui olive button">완료</button>
						<div class="ui orange button"
							onclick="location.href='spending_cancel.do?seq='+${sDto.p_seq }">취소</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>