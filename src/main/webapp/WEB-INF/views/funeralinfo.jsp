<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
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
		}
		else if (id != "" && type == 2) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "inline-block");
			$(".admin").css("display", "none");
		}
		else if (id != "" && type == 3) {
			$(".suc").css("display", "none");
			$(".bef").css("display", "inline-block");
			$(".mypage").css("display", "none");
			$(".seller").css("display", "none");
			$(".admin").css("display", "inline-block");
		};

		//메시지 출력 부분
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

	});
</script>
<title>장례 소개</title>
<style type="text/css">
* {
	box-sizing: border-box;
	text-decoration-line: none;
}

.f_container_title {
	text-align: center;
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 42px;
}

.f_container_inner_wrap {
	width: 1240px;
	margin: 0 auto;
	padding: 20px 20px;
}

img {
	border-radius: 10px;
}

.f_agenda {
	width: 1240px;
	margin: 0 auto;
	padding-top: 20px;
}

.f_agenda_photo {
	width: 480px;
	margin: 0 auto;
	display: inline-block;
}

.f_container_inner_wrap {
	
}

.f_agenda_middle {
	width: 1240px;
	height: 500px;
	display: inline-block;
	position: relative;
}

.f_agenda_middle_photo {
	width: 400px;
	display: inline-block;
	position: absolute;
}

.f_agenda_middle_text {
	width: 700px;
	display: inline-block;
	position: absolute;
	left: 430px;
}

.f_agenda_middle_photo span {
	position: absolute;
}

.f_agenda_middle_photo span:nth-child(1) {
	left: 162px;
	box-shadow: inset 0px 39px 0px -24px #e67a73;
	background-color: #e4685d;
	border: 1px solid #ffffff;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
	text-shadow: 0px 1px 0px #b23e35;
}

.f_agenda_middle_photo span:nth-child(2) {
	top: 99px;
	left: 295px;
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color: #7892c2;
	border: 1px solid #4e6096;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.f_agenda_middle_photo span:nth-child(3) {
	top: 248px;
	left: 236px;
	box-shadow: inset 0px 1px 3px 0px #91b8b3;
	background: linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	background-color: #768d87;
	border: 1px solid #566963;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
	text-shadow: 0px -1px 0px #2b665e;
}

.f_agenda_middle_photo span:nth-child(4) {
	top: 248px;
	left: 90px;
	box-shadow: inset 0px 1px 0px 0px #a6827e;
	background: linear-gradient(to bottom, #7d5d3b 5%, #634b30 100%);
	background-color: #7d5d3b;
	border: 1px solid #54381e;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
	text-shadow: 0px 1px 0px #4d3534;
}

.f_agenda_middle_photo span:nth-child(5) {
	top: 99px;
	left: 30px;
	box-shadow: 0px 1px 0px 0px #f0f7fa;
	background: linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
	background-color: #33bdef;
	border: 1px solid #057fd0;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	text-decoration: none;
	text-shadow: 0px -1px 0px #5b6178;
}

.f_agenda_text {
	width: 680px;
	margin: 0 auto;
	padding-left: 40px;
	vertical-align: top;
	display: inline-block;
}

.f_agenda_info {
	width: 1240px;
	margin: 66px auto;
	border: 1px solid black;
	border-radius: 10px;
	padding: 20px;
}

.textvalue_container {
	display: inline-block;
}

.withvalue_container {
	position: absolute;
	top: 100px;
}

.withvalue {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	border-radius: 50%;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	padding-top: 34px;
	font-size: 20px;
	font-weight: bold;
}

.clearfix {
	display: inline-block;
	width: 720px;
}

.num {
	width: 40px;
	height: 80px;
	font-size: 30px;
	display: inline-block;
}

.text {
	width: 650px;
	display: inline-block;
}

.price_list {
}

.f_cost_title {
	font-size: 30px;
	font-weight: bold;
	text-align: left;
}

.f_cost_title_eng {
	text-align: left;
	font-size: 19px;
	margin-top: 10px;
	margin-left: 32px;
}

.expense_container {
	width: 93%;
	margin: 0 auto;
}

.vat {
	text-align: right;
	height:50px;
}

.expense_mode1 {
	border-top: 3px solid #000;
	border-bottom: 1px solid #bdbdbd;
}

.expense_mode1>div {
	display: inline-block;
	padding: 36px 65px;
	vertical-align: middle;
}

.expense_mode2 {
	border-bottom: 3px solid #000;
}

.expense_mode2>div {
	display: inline-block;
	padding: 28px 65px;
	line-height: 30px;
	text-align: center;
	vertical-align: middle;
}

.f_agenda_description_wrap {
	margin: 0 auto;
	font-size: 25px;
	width: 1240px;
	position: relative;
}

.f_agenda_description_wrap > div:nth-child(3) {
	position: relative;
    height: 30px;
    background: #cfebd7;
    display: inline-block;
    top: -65px;
    z-index: 0;
    left: 77px;
    width: 1000px;
}

.f_agenda_description_wrap > div {
    font-size: 30px;
    font-weight: bold;
    text-align: left;
    display: flex;
    justify-content: space-between;
    width: 1140px;
    padding-left: 6px;
    position: relative;
    z-index:1;
}

.f_agenda_description_circle {
	width: 80px;
    height: 80px;
    border-radius: 40px;
    font-size: 12px;
    display: inline-block;
    margin: 10px;
    padding-top: 30px;
    text-align: center;    
    color: #fff;
    font-weight: bold;
    box-shadow: 0px 0px 0px 2px #9ff2b0;
    background: linear-gradient(to bottom, #78c281 5%, #479e4d 100%);
    background-color: #78c283;
    border: 1px solid #62964e;
}

.process_btn_wrap {
	width: 200px;
	margin: 60px auto;
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

.process_btn_wrap > button {
    border-radius: 50px;
    background: #42b0ff;
    color: #000;
    border: 1px solid #39adff;
}

</style>
<script>
	$(function() {
		$(".direct_reserv").css("top", $("header").height() + "px");
		$(".direct_reserv").css("left",
				$(".f_container_inner_wrap").width() + "px");
	});

	function goReserv() {
		document.location.href = "./toReservationFuneral1";
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>

	<div class="f_container_inner_wrap">
		<div class="f_container_title" style="">장례절차</div>


		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_01_01.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>01 장례예약</h3>
				<p>반려동물이 무지개 다리를 건너면 예약 상담전화(1577-0996) 또는 홈페이지를 통해&nbsp;장례를
					예약합니다.</p>
				<span>특별한 외상이 없는 경우 48~72시간 정도는 자택에서 함께 시간을 보낸 뒤 장례를 진행하셔도
					괜찮습니다.&nbsp;3일 이상 장례가 지연될 경우&nbsp;냉장&nbsp;안치서비스를 이용하실 수 있습니다.</span>

			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_02_02.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>02 장례식장 방문</h3>
				<p>반려동물이 손상되지 않도록 주의하여 예약된 일정에 맞춰 장례식장으로 방문합니다.</p>
				<span>차량이 없거나 심리적으로 운전이 힘드신 경우 또는 장례식장에 직접 방문하기 어려우신 경우,
					운구서비스를 이용하실 수 있습니다. (운구서비스는 편도로만 운영됩니다.)</span>
			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_03_03.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>03 담당 장례지도사 상담</h3>
				<p>장례시작부터 마지막 과정까지 보호자님께서 원하시는 장례서비스를 제공해 드릴 수 있도록 담당 장례지도사가
					세심하게 상담해 드립니다.</p>
				<span>상담 시 장례용품 추가를 원하실 경우 직접 보고 선택하실 수 있습니다.</span>

			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_04_04.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>04 염습</h3>
				<p>반려동물의 생전과 가장 비슷한 모습으로 인사를 나누실 수 있도록 반려동물의 몸을 깨끗하고 단정하게 정리합니다.</p>
				<span>최소한의 손길로 아이가 2차 부상을 당하지 않도록 조심스럽게 진행하며 장례용품을 추가로 선택하신
					경우, 입복 및 입관을 진행합니다.</span>
			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_05_05.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>05 추모 예식</h3>
				<p>추모실에서 아이와 마지막 인사를 나눕니다.</p>
				<span>· 단독 추모실에서 추모시간 제한없이 인사를 나누실 수 있습니다.<br> · 반려동물
					사진을 미리 전달해주시면 슬라이드 영상으로 상영해드립니다.<br> · 종교 예식을 진행하실 경우 간단한 종교
					물품을 준비해드립니다.
				</span>
			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_06_06.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>06 화장</h3>
				<p>개별화장을 원칙으로 진행되며 보호자의 참관이 가능합니다</p>
				<span> · 국내 최초로 일본에서 도입된 화장시설로 유골 손실 문제를 보완하였습니다.<br> ·
					소동물(특수동물)장례 시 전용 화장기를 사용하여 안전하게 진행합니다. 
			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_07_07.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>07 수·분골</h3>
				<p>화장이 끝난 유골은 수습 후 장례지도사가 수작업으로 분골을 진행합니다.</p>
				<span> 절구와 공이를 이용하여 수작업으로 정성스럽게 작업하며 보호자 참관이 가능합니다. </span>
			</div>
		</div>

		<div class="f_agenda">
			<div class="f_agenda_photo">
				<img alt="" src="resources/images/funeral/f_08_08.jpg">
			</div>
			<div class="f_agenda_text">
				<h3>08 봉안 및 인도</h3>
				<p>유골분이 유실되지 않도록 밀봉한 후, 유골함에 담아 보호자님께 인도합니다.</p>
				<span>농림축산식품부의 허가를 받은 합법 반려동물 장례식장에서 장례를 진행하였음을 증명하는
					장례(화장)증명서가 발급됩니다.</span>
			</div>
		</div>
	</div>

	<div class="f_agenda_info" style="height:600px">
		<div class="f_agenda_middle">
			<div class="f_agenda_middle_photo">
				<div class="textvalue_container">
					<div
						style="font-size: 15px; font-weight: bold; margin-bottom: 10px">독특한
						서비스의</div>
					<div style="font-size: 30px; font-weight: bold; margin-left: 7px">함께의
						가치</div>
				</div>
				<div class="withvalue_container">
					<span class="withvalue">공감</span> <span class="withvalue">최고</span>
					<span class="withvalue">정직</span> <span class="withvalue">신뢰</span>
					<span class="withvalue">존중</span>

				</div>
			</div>

			<div class="f_agenda_middle_text">
				<ul>
					<li class="clearfix">
						<hr>
						<div class="num">01</div>
						<div class="text">반려동물과 반려인이 함께 더불어 살아가는 ‘가족’이라는 사실을 소중한 가치로
							여깁니다.</div>
					</li>
					<li class="clearfix">
						<hr>
						<div class="num">02</div>
						<div class="text">반려동물과 반려인에 대한 깊은 이해와 높은 전문성으로 최고의 서비스를
							제공합니다.</div>
					</li>
					<li class="clearfix">
						<hr>
						<div class="num">03</div>
						<div class="text">정직과 신뢰를 바탕으로 보호자에게 진정성 있는 공감과 위로를 건넵니다.</div>
					</li>
					<li class="clearfix">
						<hr>
						<div class="num">04</div>
						<div class="text">늘 보호자의 시선에서 바라보며 그 옆을 지키고 보호자의 치유와 회복을
							최우선으로 합니다.</div>
					</li>
					<li class="clearfix">
						<hr>
						<div class="num">05</div>
						<div class="text">생명존중, 보호자 존중, 인재존중의 가치를 중심으로 우리 조직의 미래가
							임직원들의 소명의식과 역량에 존중의 기업문화를 창출합니다.</div>
					</li>
				</ul>

			</div>
		</div>
	</div>
	
	<div class="f_agenda_info" style="height:424px">
		<div class="price_list sub_list_wrap">
			<div>
				<div class="f_cost_title">장례서비스 비용</div>
				<div class="f_cost_title_eng">Funeral Expenses</div>
			</div>
			<div class="expense_container">
				<table >
					<thead>
						<tr>
							<td style="width:260px">
							<td style="width:670px">
							<td style="width:180px">
						</tr>
					</thead>
					<tr>
						<td colspan="3" class="vat">[VAT별도]</td>
					</tr>
					<tr style="border-top:3px solid #6b88b8">
						<td style="text-align:center; height:100px;" valign="middle">기본 장례</td>
						<td style="text-align:center">염습 + 단독추모실 + 종교용품 + 국화 헌화 + 개별화장 + 기본(청자) 유골함</td>
						<td style="text-align:right; padding-right:10px">300,000</td>
					</tr>
					<tr style="border-top:1px solid #6b88b8; border-bottom:3px solid #6b88b8">
						<td style="text-align:center; height:100px;" valign="middle">프리미엄 장례</td>
						<td style="text-align:center">
							염습 + 단독추모실 + 종교용품 + 국화 헌화 + 개별화장 + 최고급 수의 + <br>최고급 오동나무관 +
							황토유골함 + 포레스트 하우징 + 원목액자
						</td>
						<td style="text-align:right; padding-right:10px">1,200,000</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div class="f_agenda_info" style="height:220px">
		<div class="f_agenda_description_wrap">
			<div style="margin-bottom: 16px;">절차설명</div>
			<div>
				<div class="f_agenda_description_circle" style="margin-left: 48px;">장례예약</div>
				<div class="f_agenda_description_circle">장례식장방문</div>
				<div class="f_agenda_description_circle">상담</div>
				<div class="f_agenda_description_circle">염습</div>
				<div class="f_agenda_description_circle">화장</div>
				<div class="f_agenda_description_circle">수분골</div>
				<div class="f_agenda_description_circle">봉안및인도</div>
			</div>
			<div></div>
		</div>
	</div>

	<div class="process_btn_wrap">
		<button class="button1" type=button onclick="goReserv()">온라인 간편예약</button>
	</div>


</body>

<script type="text/javascript">
$(function(){
	//메시지 출력 부분
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	
});
</script>


</html>