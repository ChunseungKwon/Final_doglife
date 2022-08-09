<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css" />
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<!-- range slider -->

<!-- font awesome style -->
<link href="resources/css/font-awesome.min.css" rel="stylesheet" />

<link href="resources/css/headercss.css" rel="stylesheet" />
<!-- responsive style -->
<link href="resources/css/responsive.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- jQery -->
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="resources/js/bootstrap.js"></script>
<!-- custom js -->
<script src="resources/js/custom.js"></script>
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
						<c:if test="${empty dList}">nothing!!</c:if>
						<c:if test="${!empty dList}">
							<c:forEach var="dd" items="${dList}">
								<div class="col-sm-4 col-md-3 box-product-outer">
									<div class="box-product">
										<div class="img-wrapper">
											<a href="./adoptionInfo?dogNum=${dd.dogNum}">
												<img src="./resources/upload/${dd.thumbnailsys}">
											</a>
										</div>
									</div>
									<div class="title">
										<div>NAME : ${dd.dogName}</div>
										<div>GENDER : ${dd.dogGender}</div>
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

</body>

<style type="text/css">
/* -------------------------------------------------------------- Box Product -------------------------------------------------------------- */
.box-product-outer {
	margin-bottom: 5px;
	padding-top: 15px;
}

.box-product-outer:hover {
	outline: 1px solid #aaa;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
}

.box-product-slider-outer {
	padding: 10px
}

.box-product .img-wrapper {
	position: relative;
	overflow: hidden
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

.product_section{
	width:80%;
	margin: 30px auto;
}

/* -------------------------------------------------------------- End of Box Product -------------------------------------------------------------- */
</style>

<script type="text/javascript">
	
</script>
</html>