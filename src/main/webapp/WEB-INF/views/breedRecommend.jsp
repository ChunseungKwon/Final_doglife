<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doktok Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="resources/css/headercss.css">
<link rel="stylesheet" href="resources/css/breedrecommend.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
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
	
	$(window).on('load', function() {
	    var $container = $('.portfolioContainer');
	    var $filter = $('#filter');
	    $container.isotope({
	        filter: '*',
	        layoutMode: 'masonry',
	        animationOptions: {
	            duration: 750,
	            easing: 'linear'
	        }
	    });
	    $filter.find('a').click(function() {
	        var selector = $(this).attr('data-filter');
	        $filter.find('a').removeClass('active');
	        $(this).addClass('active');
	        $container.isotope({
	            filter: selector,
	            animationOptions: {
	                animationDuration: 750,
	                easing: 'linear',
	                queue: false,
	            }
	        });
	        return false;
	    });
	});

</script>
<style type="text/css">
.button {
	width: 50px;
	height: auto;
	border-radius: 5px;
	padding: 3px;
}

.search-area {
	text-align: right;
	padding: 5px;
	height: 50px;
	line-height: 50px;
}

.data-class {
	margin-right: 10px;
}

.button:active, .button.is-checked {
	background-color: #28F;
}
</style>
</head>

<body style="margin-top: 0;">
	<header>
		<jsp:include page="centerheader.jsp" />
	</header>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js"
		integrity="sha512-Zq2BOxyhvnRFXu0+WE6ojpZLOU2jdnqbrM1hmVdGzyeCa1DgM3X5Q4A/Is9xA1IkbUeDd7755dNNI/PzSf2Pew=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="text-center">
						<ul class="col container-filter portfolioFilte list-unstyled mb-0"
							id="filter">
							<li><a class="categories is-checked" data-filter="*"
								style="width: auto; height: auto; padding: 5px 3px;">Show
									All</a></li>
							<br>
							<li><div class="categories active">털</div></li>
							<li><a class="categories" data-filter=".fur1">1</a></li>
							<li><a class="categories" data-filter=".fur2">2</a></li>
							<li><a class="categories" data-filter=".fur3">3</a></li>
							<li><a class="categories" data-filter=".fur4">4</a></li>
							<li><a class="categories" data-filter=".fur5">5</a></li>
							<br>
							<li><div class="categories active">크기</div></li>
							<li><a class="categories" data-filter=".size1">1</a></li>
							<li><a class="categories" data-filter=".size2">2</a></li>
							<li><a class="categories" data-filter=".size3">3</a></li>
							<li><a class="categories" data-filter=".size4">4</a></li>
							<li><a class="categories" data-filter=".size5">5</a></li>
							<br>
							<li><div class="categories active">활동성</div></li>
							<li><a class="categories" data-filter=".action1">1</a></li>
							<li><a class="categories" data-filter=".action2">2</a></li>
							<li><a class="categories" data-filter=".action3">3</a></li>
							<li><a class="categories" data-filter=".action4">4</a></li>
							<li><a class="categories" data-filter=".action5">5</a></li>
						</ul>
					</div>
					<div class="port portfolio-masonry mt-4">
						<div class="portfolioContainer row photo">
							<c:forEach var="br" items="${breedList}">
								<div
									class="col-lg-4 p-4 fur${br.fur} size${br.size} action${br.action}">
									<div
										class="content-container fur${br.fur} size${br.size} action${br.action}">
										<div class="item-box">
											<a class="mfp-image"
												href="https://via.placeholder.com/800x540/D3D3D3/000000"
												title="Project Name"> <img
												class="item-container img-fluid"
												src="resources/images/${br.oriname}"
												alt="${br.oriname}">
												<div class="item-mask">
													<div class="item-caption">
														<p class="text-dark mb-0">
															<strong>견종</strong> : ${br.breed}
														</p>
														<p class="text-dark mb-0">
															<strong>털 유무 : </strong>
															<progress value="${br.fur}" max="5"></progress>
														</p>
														<p class="text-dark mb-0">
															<strong>크기 : </strong>
															<progress value="${br.size}" max="5"></progress>
														</p>
														<p class="text-dark mb-0">
															<strong>활동성 : </strong>
															<progress value="${br.action}" max="5"></progress>
														</p>
													</div>
												</div>

											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>




	<footer> </footer>


	<script>
const btns = document.querySelectorAll('.categories');
const contents = document.querySelectorAll('.content-container');
const photo = document.querySelectorAll('.col-lg-4');
console.log(photo);
// const search = document.getElementById(search);

$(function(){
    $(".filtering").on("click", "span", function () {
        var a = $(".photo").isotope({});
        var e = $(this).attr("data-filter");
        a.isotope({ filter: e });
    });
    $(".filtering").on("click", "span", function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
}) 
</script>
</body>

</html>