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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<!-- range slider -->

<!-- font awesome style -->
<link href="resources/css/font-awesome.min.css" rel="stylesheet" />

<link href="resources/css/headercss.css" rel="stylesheet" />
<!-- Custom styles for this template -->

<link href="resources/css/shopstyle.css" rel="stylesheet" />
<!-- responsive style -->
<link href="resources/css/responsive.css" rel="stylesheet" />
<link href="resources/css/shoplist.css" rel="stylesheet" />
<!-- jQery -->
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="resources/js/bootstrap.js"></script>
<!-- custom js -->
<script src="resources/js/custom.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		<jsp:include page="shopHeader.jsp" />
	</header>
	<!-- product section -->

	<section class="product_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>New Arrivals!</h2>
			</div>
			<div class="row">
				<div class="container">
					<div class="row clearfix">
						<c:if test="${empty newList}">nothing!!</c:if>
						<c:if test="${!empty newList}">
							<c:forEach var="newproduct" items="${newList}">
								<div class="col-sm-4 col-md-3 box-product-outer">
									<div class="box-product">
										<div class="img-wrapper">
											<a href="./productInfo?pnum=${newproduct.pnum}"> <img
												alt="Product" width="20px"
												src="./resources/upload/${newproduct.thumbsysname}">
											</a>
											<div class="tags">
												<span class="label-tags"><span
													class="label label-danger">Sale</span></span>
											</div>
											<div class="option">
												<a href="./productInfo?pnum=${newproduct.pnum}"
													data-toggle="tooltip" data-placement="bottom" title=""
													data-original-title="Add to Cart"><i
													class="ace-icon fa fa-shopping-cart"></i></a>
											</div>
										</div>
										<h4>
											<a href="./productInfo?pnum=${newproduct.pnum}">${newproduct.pname}</a>
										</h4>
										<div class="price">
											<div>${newproduct.pprice}원<span class="price-down">평점<fmt:formatNumber
														value="${newproduct.pavg}" pattern=".0" /></span>
											</div>
										</div>
										<div class="rating">
											<i class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star-half-o"></i> <a href="#">${newproduct.reviewCnt}</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
	</section>
	<section class="product_section layout_padding">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Best Products</h2>
			</div>
			<div class="row">
				<div class="container">
					<div class="row clearfix">
						<c:if test="${empty bestList}">nothing!!</c:if>
						<c:if test="${!empty bestList}">
							<c:forEach var="bestproduct" items="${bestList}">
								<div class="col-sm-4 col-md-3 box-product-outer">
									<div class="box-product">
										<div class="img-wrapper">
											<a href="./productInfo?pnum=${bestproduct.pnum}"> <img
												alt="Product"
												src="./resources/upload/${bestproduct.thumbsysname}">
											</a>
											<div class="tags">
												<span class="label-tags"><span
													class="label label-danger">Sale</span></span>
											</div>
											<div class="option">
												<a href="./productInfo?pnum=${bestproduct.pnum}"
													data-toggle="tooltip" data-placement="bottom" title=""
													data-original-title="Add to Cart"><i
													class="ace-icon fa fa-shopping-cart"></i></a>
											</div>
										</div>
										<h4>
											<a href="./productInfo?pnum=${bestproduct.pnum}">${bestproduct.pname}</a>
										</h4>
										<div class="price">
											<div>${bestproduct.pprice}원<span class="price-down">평점<fmt:formatNumber
														value="${bestproduct.pavg}" pattern=".0" /></span>
											</div>
										</div>
										<div class="rating">
											<i class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star"></i> <i
												class="ace-icon fa fa-star-half-o"></i> <a href="#">${bestproduct.reviewCnt}</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- end info_section -->






	<footer> </footer>
</body>


<script type="text/javascript">
	
</script>
</html>