<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/css/footercss.css">
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

<style>
.container-1 {
	display: flex;
	margin-top: 20px;
}

.image1 {
	flex: 1fr;
	margin-right: 10px;
}

.description1 {
	flex: 3fr;
	padding: 170px 50px;
	position: relative;
}

.description-text1 {
	
}

.button1 {
	
}
/*-------------------------------------------------------------------------------------------*/
.container-2 {
	display: flex;
	margin-top: 20px;
}

.image2 {
	flex: 1fr;
	margin-right: 10px;
}

.description2 {
	padding: 170px 50px;
	position: relative;
}

.button2 {
	
}

/*-------------------------------------------------------------------------------------------*/
.container-3 {
	display: flex;
	margin-top: 20px;
}

.image3 {
	flex: 1fr;
	margin-right: 10px;
}

.description3 {
	padding: 170px 50px;
	position: relative;
}

.button3 {
	
}
</style>
<title>사이트 소개</title>
</head>

<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>

	<section style="margin-top: 30px;">
		<div class="container" style="width: 80%">
			<!-- Slider main container -->
			<div class="swiper">
				<!-- Additional required wrapper -->

				<div class="swiper-wrapper"
					style="max-height: 300px; min-width: 1125px; align-items: center;">
					<!-- Slides -->
					<div class="swiper-slide" style="">
						<a href="toAdoptionList?pageNum=1"><img class="images"
							style="object-fit: cover; overflow: hidden;"
							src="resources/images/Slider1.png" alt="Image not Found" /></a>
					</div>
					<div class="swiper-slide">
						<a href="funeralinfo"><img class="images"
							style="object-fit: cover; overflow: hidden;"
							src="resources/images/hh.png" alt="Image not Found" /></a>
					</div>
					<div class="swiper-slide">
						<a href="toShopMain"><img class="images"
							style="object-fit: cover; overflow: hidden;"
							src="resources/images/slider3.png" alt="Image not Found" /></a>
					</div>
				</div>
				<!-- If we need pagination -->
				<div class="swiper-pagination"></div>

				<!-- If we need navigation buttons -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
	</section>

	<section style="width: 70%; margin: auto;">
		<div class="container-1">
			<div class="image1">
				<img src="resources/images/aa.png" alt="">
			</div>

			<div class="description1">
				<div class="description-text1">
				<h2>Dog 특(별)한 사이트</h2>
				</div>
				<div class="button1">
					<p align="right">
						<a href="toAboutUs">사이트 소개<i class="bi bi-chevron-right"> </i></a>
					</p>
				</div>
			</div>
		</div>
		<div class="container-2">
			<div class="description2">
				<div class="description-text2">
					<h3>강아지들의 동반자가 되어 주세요!</h3>
				</div>
				<div class="button2">
					<p align="right">
						<a href="toAdoptionList?pageNum=1">입양신청<i class="bi bi-chevron-right"> </i></a>
					</p>
				</div>
			</div>
			<div class="image2">
				<img src="resources/images/bb.png" alt="">
			</div>
		</div>
		<div class="container-3">
			<div class="image3">
				<img src="resources/images/forest.png" alt="">
			</div>

			<div class="description3">
				<div class="description-text3">
					<h3>반려견이 무지개 다리를 건너면 홈페이지를 통해 장례를
						예약합니다.</h3>
				</div>
				<div class="button3">
					<p align="right">
						<a href="funeralinfo">장례예약<i class="bi bi-chevron-right"> </i></a>
					</p>
				</div>
			</div>
		</div>
		<div class="container-2">
			<div class="description2">
				<div class="description-text2">
					<h3>1:1 고객 문의로 문의해주세요.</h3>
				</div>
				<div class="button2">
					<p align="right">
						<a href="indivsupport2">1:1문의<i class="bi bi-chevron-right"> </i></a>
					</p>
				</div>
			</div>
			<div class="image2">
				<img src="resources/images/ff.png" alt="">
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./centerfooter.jsp" />
	</footer>

	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script>
		const swiper = new Swiper(".swiper", {
			// Optional parameters
			loop : true,

			// If we need pagination
			pagination : {
				el : ".swiper-pagination",
			},

			// Navigation arrows
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev",
			},
		});
	</script>
</body>
</html>