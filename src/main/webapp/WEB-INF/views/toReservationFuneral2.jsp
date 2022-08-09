<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>예약정보작성</title>
<link rel="stylesheet" href="resources/css/headercss.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$(".checkbox_group").on("click", "#check_all", function () {
		  var checked = $(this).is(":checked");

		  if(checked){
		  	$(this).parents(".checkbox_group").find('input').prop("checked", true);
		  } else {
		  	$(this).parents(".checkbox_group").find('input').prop("checked", false);
		  }
		});
	
	
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	  var checked = $(this).is(":checked");

	  if (!checked) {
	  	$("#check_all").prop("checked", false);
	  }
	});
	
	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
	    var is_checked = true;

	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });

	    $("#check_all").prop("checked", is_checked);
	});
	
	var f_date = "${fdto.frDate}";
	var f_time = "${fdto.frTime}";
	var f_people = "${fdto.frPeople}";
	var f_weight = "${fdto.frWeight}";
	var f_price = "${fdto.frPrice}";
	var f_service_name = "${fdto.frServiceName}";
	var f_customerid = "${memberId}";

	var f_newDate = new Date(f_date);
	var day1 = f_newDate.getDay();
	var weekday = "";
	switch(day1){
		case 0:
			weekday = "(일요일)";
			break;
		case 1:
			weekday = "(월요일)";
			break;
			
		case 2:
			weekday = "(화요일)";
			break;
		case 3:
			weekday = "(수요일)";
			break;
		
		case 4:
			weekday = "(목요일)";
			break;
		
		case 5:
			weekday = "(금요일)";
			break;
			
		case 6:
			weekday = "(토요일)";
			break;
		
	}
	console.log(day1);
	
	$('#f_input_rDateTime').val(f_date + " "+ weekday +" " + f_time);

	$('#f_input_rDate').val(f_date);
	$('#f_input_rTime').val(f_time);
	$('#f_input_rPeople').val(f_people);	
	$('#f_input_rPrice').val(f_price);
	$('#f_input_rServicename').val(f_service_name);
	$('#f_input_rCustomerID').val(f_customerid);
	
	$("#f_r_check").on("click", function () {
	  	var f_r_checked = $("#check_all").is(":checked");
	  
	  	if(!f_r_checked){
			alert("전체 동의 클릭해 주셔야 장례예약이 됩니다.");
			return false;
	  	}else if($("#frDogName").val()==""){
			alert("강아지 이름을 입력해주세요.");
			$("#frDogName").focus();
			return false;
	  	}else if($("#frWeight").val()==""){
			alert("강아지 체중을 입력해주세요.");
			$("#frWeight").focus();
			return false;
	  	}
	  
	});
	
	$("#guidian_order_check").on("click", function () {
	  	var f_r_checked = $(this).is(":checked");
	  
	  	if(f_r_checked){
	  		$("#frGuardian").val("${cdto.memberName}");
	  		var pnum = "${cdto.memberPnum}";
	  		pnum = "0"+pnum.substring(0,2)+"-"+pnum.substring(2,6)+"-"+pnum.substring(6,10)
	  		$("#frPnum").val(pnum);
	  		$("#frAddr").val("${cdto.memberAddr}");
	  	}else{
	  		$("#frGuardian").val("");
	  		$("#frPnum").val("");
	  		$("#frAddr").val("");
	  	}
	  
	});
	
});


</script>
<style type="text/css">

.f_reservation2_photo {
	position: relative;
	width: 100%;
    height: 100px;
    margin: 0 auto;
}

.f_reservation2_photo > img{
	width: 1904px;
}

.f_reservation2_photo > span{
	position: absolute;
	font-weight: bold;
    display: inline-block;
}

.f_reservation2_photo > span:nth-child(2){
	left: 801px;
    top: 138px;
    font-size: 49px;
    color: #fff;
    text-shadow: 8px 6px 3px #1f743d;
}

.f_reservation2_photo > span:nth-child(3){
	left: 720px;
    top: 222px;
    font-size: 21px;
    color: #000;
    width: 900px;
}

.f_reservation2_photo > span:nth-child(4){
	left: 762px;
    top: 254px;
    font-size: 21px;
    color: #000;
    width: 440px;
}

.f_reservation2_circleinfo {
	width: 600px;
	height: 100px;
	margin: 233px auto 0;
	display: flex;
	justify-content: space-between;
}

.f_reservation2_circle {
	width: 160px;
    height: 70px;
    border: 1px solid black;
    border-radius: 40px;
    display: inline-block;
    text-align: center;
    padding-top: 20px;
    background: #fff;
}
.f_reservation2_circle:nth-child(2) {
	background: #adff99;
    border: 1px solid #32ff00;
}

.f_reservation2_info {
	width: 1240px;
	margin: 0 auto;
	padding: 20px auto;
}

.f_reservation2_info_title {
	font-size: 20px;
	font-weight: bold;
}


input.f_reservation2_info_list1 {
	width: 600px;
	height: 40px;
	paddingt: 0 10px;
	border: 1px solid #000;
	border-radius: 5px;
	text-align: right;
}

#f_r_check{
	border-radius: 50px;
    background: #42b0ff;
    color: #fff;
    border: 1px solid #39adff;
    width: 228px;
    height: 78px;
    margin: 50px 208px;
    font-size: 20px;
    font-weight: bold;
}

input {
    padding-right: 10px;
}

input#frAddr {
    padding-left: 62px;
}
</style>
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
</head>
<body>

	<header>
		<jsp:include page="centerheader.jsp" />
	</header>
	<div class="f_reservation2_photo"><img alt="사진" src="resources/images/funeral/dog.png">
		<span style="">RESERVATION</span>
		<span style="">당신의 소중한 가족이자 따뜻한 친구와의 마지막 이별을 독특한 서비스와 함께 하세요.</span>
		<span style="">아름다운 이별은 추억을 더욱 빛나게 합니다.</span>
	</div>
	<div class="f_reservation2_circleinfo">	
		<div class="f_reservation2_circle">일시 선택</div>
		<div class="f_reservation2_circle">정보 작성</div>
		<div class="f_reservation2_circle">예약 완료</div>
	</div>
	<br>
	<div class="f_reservation2_info">
		<form action="./toReservationFuneral3" method="post" name="frm_to_rf" id="frm_to_rf">
		<div style="width: 630px; margin: 0 auto;">

			<span class="f_reservation2_info_title">예약정보</span>


			<div style="position: relative">
				<input class="f_reservation2_info_list1" id="f_input_rDateTime" type="text" placeholder="YYYY-MM-DD hh:mm" readonly>
				<div style="position: absolute; top: 24%; left: 12px;">선택된 예약 일시</div>
				<input class="f_reservation2_info_list1" id="f_input_rDate" name="frDate" type="hidden" type="text"> 
				<input class="f_reservation2_info_list1" id="f_input_rTime" name="frTime" type="hidden" type="text"> 
				<input class="f_reservation2_info_list1" id="f_input_rPeople" name="frPeople" type="hidden"> 
				<input class="f_reservation2_info_list1" id="f_input_rPrice" name="frPrice" type="hidden">
				<input class="f_reservation2_info_list1" id="f_input_rServicename" name="frServiceName" type="hidden" >
				<input class="f_reservation2_info_list1" id="f_input_rCustomerID" name="memberId" type="hidden">
			</div>
			<br>
			<hr>
			<span class="f_reservation2_info_title">※주의사항</span>
			<p>- 모든 장례는 예약제로 진행됩니다.</p>
			<p>- 장례 절차는 전과정 참관 가능합니다.</p>
			<br>
			<hr>

			<span class="f_reservation2_info_title">필수정보입력</span>
			<br>

			<div class="f_reserv_guidian_info">
				<div class="guidian_title">보호자 정보</div>
				<div>
					<label for="guidian_order_check">예약자와 보호자가 동일합니다.</label>
					<input type="checkbox" id="guidian_order_check" name="guidian_order_check">
				</div>
				<div style="position: relative">
					<input class="f_reservation2_info_list1" type="text" name="frGuardian" id="frGuardian"
						placeholder="보호자 이름을 입력해 주세요." required>
					<div style="position: absolute; top: 24%; left: 12px;">보호자 이름</div>
				</div>
				<div style="position: relative">
					<input class="f_reservation2_info_list1" type="text" name="frPnum" id="frPnum"
						placeholder="연락처를 입력해 주세요." required>
					<div style="position: absolute; top: 24%; left: 12px;">연락처</div>
				</div>
	
				<div style="position: relative">
				
					<button type="button" class="btn btn-primary" onClick="goPopup();">주소검색</button>
					<input class="f_reservation2_info_list1" type="text" name="frAddr" id="frAddr"
						placeholder="주소검색 버튼을 눌러 주세요." required readonly>
					<input type="hidden" id="roadFullAddr" name="roadFullAddr" value="">
					<div style="position: absolute; top: 48px; left: 12px;">주 소</div>
				</div>
			</div><br>
			<div class="f_reserv_dog_info">
				<div class="dog_title">강아지 정보</div>
				<div style="position: relative">
					<input class="f_reservation2_info_list1" type="text" name="frDogName" id="frDogName"
						placeholder="강아지 이름을 입력해 주세요." required>
					<div style="position: absolute; top: 24%; left: 12px;">강아지 이름</div>
				</div>
	
				<div style="position: relative">
					<input class="f_reservation2_info_list1" type="number" name="frWeight" id="frWeight" min="0"
						placeholder="강아지 체중을 입력해 주세요." required>
					<div style="position: absolute; top: 24%; left: 12px;">강아지
						체중(KG)</div>
				</div>
				
				
					
				
			</div>

			
			<br>
			<hr>



			<div class="checkbox_group">
				<span class="f_reservation2_info_title">동의여부 질문들</span><br> <label
					for="check_1">1. 개인정보 처리방침 동의</label> <input type="checkbox"
					id="check_1" class="normal"><br> <label for="check_2">2.
					서비스 이용약관 동의</label> <input type="checkbox" id="check_2" class="normal"><br>

				<label for="check_3">3. 마케팅 정보활용 동의</label> <input type="checkbox"
					id="check_3" class="normal"><br> <label
					for="check_all">전체 동의</label> <input type="checkbox" id="check_all"><br><br>
			</div>
			
			<div style="width:100%">
				<button id="f_r_check"  >장례예약 </button>
			</div>

		</div>

		</form>
	</div>
<script >
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/db/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.frm_to_rf.frAddr.value = roadFullAddr;
		
		//$("#frAddr").val(roadFullAddr);
		
}

</script>

</body>
</html>