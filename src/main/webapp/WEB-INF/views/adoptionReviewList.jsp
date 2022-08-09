<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doktok Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<!-- font awesome style -->
<link href="resources/css/font-awesome.min.css" rel="stylesheet" />

<link rel="stylesheet" href="resources/css/headercss.css">
<!-- Custom styles for this template -->

<!-- responsive style -->
<link href="resources/css/responsive.css" rel="stylesheet" />
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

<!-- jQery -->
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="resources/js/bootstrap.js"></script>
<!-- custom js -->
<script src="resources/js/custom.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.search-area {
	text-align: right;
	padding: 5px;
	height: 50px;
	line-height: 50px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section class="product_section layout_padding" style="width: 80%;margin:30px auto;">
		<div class="container">
			<div class="row">
				<div class="container">
					<div class="row clearfix">
						<c:if test="${empty rList}">nothing!!</c:if>
						<c:if test="${!empty rList}">
							<c:forEach var="dd" items="${rList}">
								<div class="col-sm-4 col-md-3 box-product-outer">
									<div class="box-product">
										<div class="img-wrapper">
											<a href="./adoptionReviewupdatelogoff?drNum=${dd.drNum}"> <img
												alt="Product" 
												src="./resources/upload/${dd.thumbnailsys}">
											</a>
										</div>

									</div>

									<div class="title">
										<div>
											제목 : ${dd.drTitle}
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
						
					</div>
				</div>
			</div>
				<div>${pageHtml}</div>
		</div>
	
	</section>

	<!-- end info_section -->







</body>


<script>
	function toFoodList() {
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			document.getElementById("demo").innerHTML = this.responseText;
		}
		xhttp.open("GET", "toFoodList");
		xhttp.send();
	}
</script>



<style>

.box-product-outer {
	margin-bottom: 5px;
	padding-top: 15px;
	padding-bottom: 15px;
	display: inline-block;
}

.box-product-outer:hover {
	outline: 1px solid #aaa;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
}

.tab-content .box-product-outer {
	margin-bottom: 0
}

.box-product-slider-outer {
	padding: 10px
}

.box-product .img-wrapper {
	position: relative;
	overflow: hidden;
	padding-top: 15px;
}

.box-product .img-wrapper>:first-child {
	position: relative;
	display: block
}

.box-product .img-wrapper>a>img {
	width: 100%
}

.box-product .img-wrapper .tags {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	overflow: visible;
	width: auto;
	height: auto;
	margin: 0;
	padding: 0;
	vertical-align: inherit;
	border-width: 0;
	background-color: transparent;
	direction: rtl
}

.box-product .img-wrapper .tags-left {
	left: 0;
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags {
	display: table;
	margin: 1px 0 0 0;
	text-align: left;
	opacity: .92;
	filter: alpha(opacity = 92);
	direction: ltr
}

.box-product .img-wrapper .tags>.label-tags:hover {
	opacity: 1;
	filter: alpha(opacity = 100)
}

.box-product .img-wrapper .tags>.label-tags a:hover {
	text-decoration: none
}

.box-product .img-wrapper>.option {
	position: absolute;
	top: auto;
	right: 0;
	bottom: -30px;
	left: 0;
	width: auto;
	height: 28px;
	-webkit-transition: all .2s ease;
	-o-transition: all .2s ease;
	transition: all .2s ease;
	text-align: center;
	vertical-align: middle;
	background-color: rgba(0, 0, 0, .55)
}

.box-product .img-wrapper .option>a {
	font-size: 18px;
	font-weight: normal;
	display: inline-block;
	padding: 0 4px;
	color: #fff
}

.box-product .img-wrapper:hover>.option {
	top: auto;
	bottom: 0
}

.box-product h6 a {
	line-height: 1.4
}

.price {
	margin-bottom: 5px;
	color: #f44336
}

.price .price-down {
	margin-left: 5px;
	padding: 2px 5px;
	color: #fff;
	background: #f44336
}

.price-old {
	position: relative;
	display: inline-block;
	margin-right: 7px;
	color: #666
}

.price-old:before {
	position: absolute;
	width: 100%;
	height: 60%;
	content: '';
	border-bottom: 1px solid #666
}

.rating i {
	color: #fc0
}

.product-sorting-bar {
	border: 1px solid #e5e5e5
}
</style>

<script type="text/javascript">
	
</script>
</html>