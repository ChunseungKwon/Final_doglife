<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!-- Button + Logo + Login/Logout-->
<div class="header1">
	<div class="buttons">
		<button type="button" class="button-74" onclick="location.href='./'">독특한세상</button>
		<button type="button" class="button-74" onclick="location.href='./toShopMain'">독특한 숍</button>
	</div>

	<div class="logo">
		<a href="./"> <img src="./resources/images/Logo.jpg" alt="#"/>
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
		<ul id="category">
			<li value="allList"><a id=category href="./toProductList">All</a></li>
			<li value="foodList"><a id=category
				href="./toProductList?category=food">사료</a></li>
			<li value="clothesList"><a id=category
				href="./toProductList?category=clothes">옷/목줄</a></li>
			<li value="cageList"><a id=category
				href="./toProductList?category=cage">케이지</a></li>
			<li value="toyList"><a id=category
				href="./toProductList?category=toy">장난감</a></li>
		</ul>
	</div>
</div>