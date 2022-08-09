<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%
int xx = (int) (Math.random() * 100);
%>
<meta charset="UTF-8">
<title>장례 예약</title>
<link href="resources/css/calendar.css?v=<%=xx%>" rel="stylesheet" />
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/calendar.js?v=<%=xx%>"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
<style>
.f_reservation1_photo {
	position: relative;
	width: 100%;
	height: 100px;
	margin: 0 auto;
}

.f_reservation1_photo>img {
	width: 1904px;
}

.f_reservation1_photo>span {
	position: absolute;
	font-weight: bold;
	display: inline-block;
}

.f_reservation1_photo>span:nth-child(2) {
	left: 801px;
	top: 138px;
	font-size: 49px;
	color: #fff;
	text-shadow: 8px 6px 3px #1f743d;
}

.f_reservation1_photo>span:nth-child(3) {
	left: 720px;
	top: 222px;
	font-size: 21px;
	color: #000;
	width: 900px;
}

.f_reservation1_photo>span:nth-child(4) {
	left: 762px;
	top: 254px;
	font-size: 21px;
	color: #000;
	width: 440px;
}

.f_main_container {
	width: 1240px;
	margin: 230px auto;
}

.f_reservation1_circleinfo {
	width: 600px;
	height: 120px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.f_reservation1_circle {
	width: 160px;
	height: 70px;
	border: 1px solid black;
	border-radius: 40px;
	display: inline-block;
	text-align: center;
	padding-top: 20px;
	background: #fff;
}

.f_reservation1_circle:nth-child(1) {
	background: #adff99;
	border: 1px solid #32ff00;
}

.f_reservation_dayselect {
	width: 1240px;
	height: 20px;
	margin: 0 auto;
	text-align: center;
	font-size: 20px;
}

input.f_reservation1_sel_date {
	width: 400px;
	height: 40px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
	padding-right: 10px;
}

input.f_reservation1_sel_timepicker {
	width: 400px;
	height: 40px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
	padding-right: 10px;
}

.f_reservation1_sel_visit {
	width: 400px;
	height: 40px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
	font-size: 20px;
}

.f_reservation1_sel_visit::after {
	content: "명"
}

.f_reservation1_sel_selectlist {
	width: 402px;
	height: 130px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: left;
	padding-top: 9px;
	padding-left: 19px;
	line-height: 27px;
}

.button1 {
	background-color: yellow;
	cursor: pointer;
	width: 200px;
	height: 60px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 30px;
}

.f_reservation1_sel_price {
	width: 220px;
	height: 40px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
}

.f_reservation1_sel_selectprice {
	width: 175px;
	height: 36px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
	padding-right: 10px;
}

.process_btn_wrap>input {
	border-radius: 50px;
	background: #42b0ff;
	color: #fff;
	border: 1px solid #39adff;
	width: 228px;
	height: 88px;
	margin-left: 81px;
	margin-top: 50px;
	font-size: 20px;
	font-weight: bold;
}
</style>
<style>
.timeselect {
	width: 400px;
	height: 162px;
	overflow: auto;
	border: 1px solid #e0e0e0;
}

.timeselect>div {
	height: 32px;
	border: 1px solid #e0e0e0;
	text-align: center;
	padding-top: 4px;
	cursor: pointer;
	background: #fff;
	color: #000;
}

.timeselect>div.seltime {
	background: #a0a0a0;
	color: #fff;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						calendarMaker($("#calendarForm"), new Date());

						$("#frTime")
								.on(
										"click",
										function() {
											//console.log($('.timeselect'));
											if (!$('.timeselect')
													.is(':visible')) {
												$
														.ajax({
															url : "frTimeSelect",
															method : "POST",
															data : {
																"date" : $(
																		"#frDate")
																		.val()
															},
															success : function(
																	result) {
																//console.log(result.length);

																$(".timeselect")
																		.remove();

																let timeCode = "<div class='timeselect'>";
																for (let i = 9; i < 18; i++) {
																	let isexist = false;
																	$
																			.each(
																					result,
																					function(
																							index,
																							existtime) { // 10:00 AM
																						let hour = Number(existtime
																								.substring(
																										0,
																										existtime
																												.indexOf(":")));
																						if (existtime
																								.indexOf("PM") > 0) {
																							if (hour < 12)
																								hour += 12;
																						}
																						//console.log('hour='+hour);
																						if (hour == i)
																							isexist = true;
																					});
																	if (!isexist) {
																		let frmTime = "";
																		if (i < 12) {
																			frmTime = i
																					+ ":00 AM";
																		} else if (i == 12) {
																			//frmTime = "12:00 PM";
																		} else {
																			frmTime = (i - 12)
																					+ ":00 PM";
																		}
																		timeCode += "	<div "
																				+ (frmTime == $(
																						"#frTime")
																						.val() ? "class='seltime'"
																						: "")
																				+ " value='"
																				+ frmTime
																				+ "'>"
																				+ frmTime
																				+ "</div>";
																	}
																}
																timeCode += "</div>";

																$('#frTime')
																		.parent()
																		.append(
																				timeCode);

																if ($(
																		".seltime")
																		.index() != null) {
																	$(
																			".timeselect")
																			.scrollTop(
																					$(
																							".seltime")
																							.index() * 32);
																	console
																			.log('$(".timeselect").scrollTop='
																					+ $(
																							".timeselect")
																							.scrollTop());
																}

																$(".timeselect")
																		.children(
																				"div")
																		.hover(
																				function() {
																					if ($(
																							this)
																							.attr(
																									'class') != 'seltime')
																						$(
																								this)
																								.css(
																										"background",
																										"#e0e0e0");
																				},
																				function() {
																					if ($(
																							this)
																							.attr(
																									'class') != 'seltime')
																						$(
																								this)
																								.css(
																										"background",
																										"#fff");
																				});

																$(".timeselect")
																		.children(
																				"div")
																		.click(
																				function() {
																					let seltime = $(
																							this)
																							.text();
																					$(
																							"#frTime")
																							.val(
																									seltime);
																					$(
																							".timeselect")
																							.remove();
																				});

															}
														});
											} else {
												$('.timeselect').remove();
											}
										});

					});
</script>

<script>
	function priceselect(obj) {

		$("#frServiceName").val(
				$(".f_reservation1_sel_price option:selected").text());

		var tempPrice = obj.value;
		tempPrice = Number(tempPrice).toLocaleString('ko-KR');
		$(".f_reservation1_sel_selectprice").val(tempPrice);
		$("#frPrice").val(obj.value);
		selectinfo();
	}

	function selectinfo() {
		var selectValue = "날짜 : " + $(".f_reservation1_sel_date").val()
				+ "<br>";
		selectValue += "시간 : " + $(".f_reservation1_sel_timepicker").val()
				+ "<br>";
		selectValue += "인원 : " + $(".f_reservation1_sel_visit").val()
				+ " 명<br>";
		selectValue += "금액 : " + $(".f_reservation1_sel_selectprice").val()
				+ " 원";
		$(".f_reservation1_sel_selectlist").html(selectValue);
	}

	function checkValue() {
		if ($("#frDate").val() == "") {
			alert("날짜를 선택해주세요");
			return false;
		} else if ($("#frTime").val() == "") {
			alert("시간을 선택해주세요");
			return false;
		} else if ($("#frPeople").val() == "" | $("#frPeople").val() == "0") {
			alert("방문인원은 0명보다 커야 합니다.");
			return false;
		} else if ($("#frPrice").val() == "0") {
			alert("장례 종류를 선택해주세요");
			return false;
		}
	}
</script>
<script type="text/javascript">
	var id = "${memberId}";
	var type = "${memberType}";
	$(function() {
		console.log(id);
		if (id == "") {
			$(".suc").css("display", "inline-block");
			$(".bef").css("display", "none");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "none");
			$(".admin").css("display", "none");
		} else if (id != "" && type == 1) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "inline-block");
			$(".seller").css("display", "none");
			$(".admin").css("display", "none");
		} else if (id != "" && type == 2) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "inline-block");
			$(".admin").css("display", "none");
		} else if (id != "" && type == 3) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "none");
			$(".admin").css("display", "inline-block");
		}
		;

		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

	});
</script>
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section>

		<div class="f_reservation1_photo">
			<img alt="사진" src="resources/images/funeral/dog.png"> <span
				style="">RESERVATION</span> <span style="">당신의 소중한 가족이자 따뜻한
				친구와의 마지막 이별을 독특한 서비스와 함께 하세요.</span> <span style="">아름다운 이별은 추억을 더욱
				빛나게 합니다.</span>
		</div>
		<div class="f_main_container">

			<div class="f_reservation1_circleinfo">
				<div class="f_reservation1_circle">일시 선택</div>
				<div class="f_reservation1_circle">정보 작성</div>
				<div class="f_reservation1_circle">예약 완료</div>
			</div>
			<div class="f_reservation_dayselect">예약 일시 선택</div>
			<br>
			<form action="./toReservationFuneral2" method="post"
				onsubmit="return checkValue()">
				<!-- 예약 카렌더 -->
				<div class="calendar_box">
					<div id="calendarForm"></div>
				</div>

				<div style="width: 500px; height: 420px; margin: 39px auto;">
					<div style="position: relative">
						<input class="f_reservation1_sel_date" name="frDate" id="frDate"
							type="text" readonly placeholder="YYYY-MM-DD"
							onchange="selectinfo()">
						<div style="position: absolute; top: 24%; left: 20px;">날짜</div>
					</div>
					<br>
					<div style="position: relative">
						<input class="f_reservation1_sel_timepicker" name="frTime"
							readonly id="frTime" type="text" placeholder="h:mm AM/PM"
							onchange="selectinfo()">
						<div style="position: absolute; top: 8px; left: 20px;">시간</div>
					</div>

					<br>
					<div style="position: relative">
						<input class="f_reservation1_sel_visit" name="frPeople"
							id="frPeople" type="number" placeholder="명" min="0"
							onchange="selectinfo()">
						<div style="position: absolute; top: 24%; left: 20px;">방문인원</div>
					</div>

					<br>

					<div style="position: relative">
						<select class="f_reservation1_sel_price"
							onchange="priceselect(this)">
							<option value="0">장례 종류를 선택하세요.</option>
							<option value="330000">기본 장례</option>
							<option value="1320000">프리미엄 장례</option>
						</select> <input class="f_reservation1_sel_selectprice" type="text"
							value="0" onchange="selectinfo()"> <input name="frPrice"
							id="frPrice" type="hidden" value="0"> <input
							type="hidden" name="frServiceName" id="frServiceName" value="">


						<div style="position: absolute; top: 24%; left: 12px;"></div>
					</div>

					<br>
					<div style="position: relative">
						<div class="f_reservation1_sel_selectlist"></div>
						<div style="position: absolute; top: 24%; left: 12px;"></div>


					</div>

					<br>
					<c:if test="${!empty memberId}">
						<div class="process_btn_wrap">
							<input type="submit" value="다음으로">
						</div>
					</c:if>
					<div class="process_btn_wrap">
						<input type="hidden" value="다음으로">
					</div>
				</div>
			</form>
		</div>
	</section>
	<footer></footer>

</body>
</html>