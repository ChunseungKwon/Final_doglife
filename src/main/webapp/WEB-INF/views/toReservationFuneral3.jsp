<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>예약정보작성</title>

<script src="resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
.f_reservation3_photo {
	position: relative;
	width: 100%;
    height: 100px;
    margin: 0 auto;
}

.f_reservation3_photo > img{
	width: 1904px;
}

.f_reservation3_photo > span{
	position: absolute;
	font-weight: bold;
    display: inline-block;
}

.f_reservation3_photo > span:nth-child(2){
	left: 801px;
    top: 138px;
    font-size: 49px;
    color: #fff;
    text-shadow: 8px 6px 3px #1f743d;
}

.f_reservation3_photo > span:nth-child(3){
	left: 720px;
    top: 222px;
    font-size: 21px;
    color: #000;
    width: 900px;
}

.f_reservation3_photo > span:nth-child(4){
	left: 762px;
    top: 254px;
    font-size: 21px;
    color: #000;
    width: 440px;
}

.f_reservation3_circleinfo{
	width: 600px;
    height: 100px;
    margin: 233px auto 0;
    display: flex;
    justify-content: space-between;
}

.f_reservation3_circle {
	width: 160px;
    height: 70px;
    border: 1px solid black;
    border-radius: 40px;
    display: inline-block;
    text-align: center;
    padding-top: 20px;
    background: #fff;
}
.f_reservation3_circle:nth-child(3) {
	background: #adff99;
    border: 1px solid #32ff00;
}

.f_reservation3_info{
	padding: 0px 8px;
    margin: 0px auto 22px;
    position: relative;
    border-bottom: 3px solid #8dc792;
}

.f_reservation3_info_list{
	width: 1240px;
    height: 40px;
    margin: 5px auto;
    line-height: 40px;
}



input.f_reservation3_info_list1 {
    width: 300px;
    height: 40px;
    border: 1px solid #000;
    border-radius: 5px;
    text-align: right;
    padding: 10px;
    margin: 0 auto;
    display: inline-block;
    position: absolute;
    left: 500px;
}
    }

#f_reservation3_info_list_textlist {
	width: 200px;
    height: 40px;
    border: 1px solid black;
    border-radius: 5px;
    text-align: right;
    margin: 0 auto;
    display: inline-block;
}

.inputbox1 {
	width: 200px;
    height: 40px;
    padding-left: 20px;
    border: 1px solid #000;
    border-radius: 5px;
    text-align: left;
    margin: 0 auto;
    display: inline-block;
}

.inputbox2 {
	width: 500px;
    height: 40px;
    padding-left: 20px;
    border: 1px solid #000;
    border-radius: 5px;
    text-align: left;
    margin: 0 auto;
    display: inline-block;
}

.f_reservation2_info_title{
	font-size: 20px;
	
}
.f_r_buttom{
	width: 300px;
    height: 100px;
    margin: 0 auto;
    position: relative;
    display: flex;
    justify-content: space-between;
}

.f_reservation3_buttom1 {
	width: 150px;
	border-radius: 25px;
    background: #42b0ff;
    color: #fff;
    border: 1px solid #39adff;   
    height: 70px;  
    font-size: 20px;
    font-weight: bold;
	

}


.f_reservation3_buttom2 {
	width:150px;
	border-radius: 25px;
    background: #42b0ff;
    color: #fff;
    border: 1px solid #39adff;   
    height: 70px;
    margin-left: 20px;   
    font-size: 20px;
    font-weight: bold;

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
	<div class="f_reservation3_photo"><img alt="사진" src="resources/images/funeral/dog.png">
		<span style="">RESERVATION</span>
		<span style="">당신의 소중한 가족이자 따뜻한 친구와의 마지막 이별을 독특한 서비스와 함께 하세요.</span>
		<span style="">아름다운 이별은 추억을 더욱 빛나게 합니다.</span>
	</div>
	<div class="f_reservation3_circleinfo">	
		<div class="f_reservation3_circle">일시 선택</div>
		<div class="f_reservation3_circle">정보 작성</div>
		<div class="f_reservation3_circle">예약 완료</div>
	</div>
	<br>
	
	<div style="width: 710px; margin: 0 auto;">
		<div class="f_reservation3_info">
			<span class="f_reservation2_info_title"><b>예약정보 확인</b></span>
				<br>
			
		</div>
		<div class="f_reservation3_info_list" >
				<div class="inputbox1"  >예약번호</div>
				<div class="inputbox2" >${fdto.frNum}</div>
				
				
			<%-- 	<input class="f_reservation3_info_list1" type="text" value="${fdto.frNum}" readonly="readonly">
				--%>
		</div>
		
		<div class="f_reservation3_info_list" >
				<div class="inputbox1"  >예약일시</div>
				<div class="inputbox2" >${fdto.frDate} ${fdto.frTime}</div>
				
				
				
				
			<%--	<input class="f_reservation3_info_list1" type="text" value="${fdto.frDate} ${fdto.frTime}" readonly>
				--%>
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >방문 인원</div>
				<div class="inputbox2" >${fdto.frPeople} 명</div>
				
		<%--- 		<input class="f_reservation3_info_list1" type="text" value="${fdto.frPeople}">--%>
				
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >장례 비용</div>
				<div class="inputbox2" ><fmt:formatNumber value="${fdto.frPrice }" pattern="#,###" /> 원</div> 
		<%--- 		<input class="f_reservation3_info_list1" type="text" value="${fdto.frPrice}">--%>
				
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >강아지 이름</div>
				<div class="inputbox2" >${fdto.frDogName}</div>
		<%--- 		<input class="f_reservation3_info_list1" type="text" value="${fdto.frDogName}" >--%>
				
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >강아지 체중</div>
				<div class="inputbox2" >${fdto.frWeight} kg</div>
			<%---	<input class="f_reservation3_info_list1" type="text" value="${fdto.frDogWeight}" >
				--%>
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >보호자 이름</div>
				<div class="inputbox2" >${fdto.frGuardian}</div>
				<%---<input class="f_reservation3_info_list1" type="text" value="${fdto.frGuardian}">--%>
				
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >보호자 연락처</div>
				<div class="inputbox2" >${fdto.frPnum}</div>
			<%---	<input class="f_reservation3_info_list1" type="text" value="${fdto.frPnum}" >--%>
				
		</div>
		
		<div class="f_reservation3_info_list" >
				
				<div class="inputbox1"  >주 소</div>
				<div class="inputbox2" >${fdto.frAddr}</div>
			<%---	<input class="f_reservation3_info_list1" type="text" value="${fdto.frAddr}" >--%>
				
		</div>
		
		<br>
		<br>
		
		<div class= f_r_buttom>
		<%-- <button class="f_reservation3_buttom1" onclick="location.href='./funeralinfo?frNum=${fdto.frNum}'">예약취소</button> --%>
		<button class="f_reservation3_buttom1" onclick="location.href='./delReserverInfo?frNum=${fdto.frNum}'">예약취소</button>
		<input class="f_reservation3_buttom2" type="submit" onclick="requestPay()" value="결제하기">
		
		
		</div>
	</div>

</body>
<script>
    function requestPay() {

    	let mc_uid = 'DOG_RESERV_FUNER_' + new Date().getTime();
	    var IMP = window.IMP; 
	    IMP.init('imp63603097'); 
	    IMP.request_pay({
	    	pg : "kakaopay", 
	        pay_method : 'kakaopay',
	        merchant_uid : mc_uid,
	        name : '${fdto.frServiceName}',
	        amount : ${fdto.frPrice },
	        buyer_email : '${fdto.memberId}',
	        buyer_name : '${fdto.frGuardian}',
	        buyer_tel : '${fdto.frPnum}',
	        buyer_addr : '${fdto.frAddr}',
	        buyer_postcode : '인천',
	        m_redirect_url : 'redirect url'
	    }, 
	    
	    
	    function(rsp) {
	        if ( rsp.success ) {
	        	console.log(rsp);
	            var msg = '결제가 완료되었습니다.';
	            alert(msg);
	            location.href="./frPayInsert?frNum=${fdto.frNum}&mcuid="+mc_uid;
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            rsp.error_msg;
	            
	        }
	    });

	 }
  </script>

</html>