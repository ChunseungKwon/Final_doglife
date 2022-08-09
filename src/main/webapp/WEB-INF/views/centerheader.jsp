<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!-- Button + Logo + Login/Logout-->
<div class="header1">
	<div class="buttons">
		<button type="button" class="button-74" onclick="location.href='./'">독특한세상</button>
		<button type="button" class="button-74" onclick="location.href='./toShopMain'">독특한 숍</button>
	</div>

	<div class="logo">
		<a href="./"> <img src="./resources/images/Logo.png" alt="#"/>
		</a>
	</div>

	<div class="login-logout">
		<ul>
			<li id="login-logout-navbar" class="suc"><a class = "login-logout-navbar-link" href="./toLogin">로그인</a></li>
			<li id="login-logout-navbar" class="suc"><a class = "login-logout-navbar-link" href="./toMemberRegister">회원가입</a></li>
			<li id="login-logout-navbar" class="bef"><a class = "login-logout-navbar-link" href="./tologout">로그아웃</a></li>
			<li id="login-logout-navbar" class="mypage"><a class = "login-logout-navbar-link" href="./mypage_update2">마이페이지</a></li>
			<li id="login-logout-navbar" class="seller"><a class = "login-logout-navbar-link" href="./sellerPage">판매자페이지</a></li>
			<li id="login-logout-navbar" class="admin"><a class = "login-logout-navbar-link" href="./adminNotice">관리자페이지</a></li>
			<li id="login-logout-navbar"><a class="login-logout-navbar-link" href="./toCart?memberId=${mb.memberId}">장바구니</a></li>
		</ul>
	</div>
</div>
<!-- Navigation Bar-->
<div class="navigation-bar">
	<div class="navigation-bar-bar" style="z-index: 10; width:610px; margin: 0px auto;">
		<ul>
			<li><a href="">About Us</a>
				<ul style = "z-index: 30;">
					<li><a href="./toAboutUs">사이트 소개</a></li>
					<li><a href="./toNotice">공지사항</a></li>
					<li><a href="./WaytoCome">오시는 길</a></li>
				</ul></li>
			<li><a href="">입양</a>
				<ul style = "z-index: 30;">
					<li><a href="./breedRecommend">견종 추천</a></li>
					<li><a href="./toAdoptionList?pageNum=1">입양 신청</a></li>
					<li><a href="./adoptionReview?pageNum=1">입양 후기</a></li>
				</ul></li>
			<li><a href="">장례식</a>
				<ul style = "z-index: 30;">
					<li><a href="./funeralinfo">장례식 절차 소개</a></li>
					<li><a href="./toReservationFuneral1">장례식 예약</a></li>
				</ul></li>
			<li><a href="">고객센터</a>
				<ul style = "z-index: 30;">
					<li><a href="./indivsupport2">1:1 문의</a></li>
					<li><a href="./faq">FAQ</a></li>
				</ul></li>
		</ul>
	</div>
</div>