<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css" />

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
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>

<link rel="stylesheet" href="resources/css/detail.css">
<link rel="stylesheet"
	href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css"
	integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv"
	crossorigin="anonymous">
</head>
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
<body onload="init();">
	<div class="wrap">
		<header>
			<jsp:include page="shopHeader.jsp" />
		</header>
		<section>

			<h2 class="login-header">${productInfo.pname}</h2>
			<div class="contain1">
				<div class="photo_wrap">

					<div class="contain1_photo">
						<img class="preview_big_exist" id="preview_big"
							src="./resources/upload/${pfList[0].sysname}" alt="">
					</div>
					<div class="contain1_photo_thumbnail">
						<c:forEach var="pf" items="${pfList}" varStatus="st">
							<div>
								<img class="thumbnail_img_exist" id="preview_thumb${st.count}"
									src="./resources/upload/${pf.sysname}" alt="">
							</div>
						</c:forEach>
						<c:if test="${pfList.size() < 4}">
							<c:forEach var="cnt" begin="0" end="${4-pfList.size()}" step="1">
								<div>
									<img class="thumbnail_img_nothing"
										id="preview_thumb${cnt+pfList.size()+1}"
										src="./resources/images/no_image.png" alt="">
								</div>
							</c:forEach>
						</c:if>
					</div>

				</div>
				<%-- end : photo_wrap --%>


				<div class="contain1_product_title">
					<form action="./addCartProduct" method="post" id="product">
						<div class="contain1_product_title">
							<div>
								<input type="hidden" name="pnum" id="pnum"
									value="${productInfo.pnum}">
							</div>

							<div>
								<span class="title">상품카테고리</span> : &nbsp; <input type="text"
									name="pcategory" id="pcategory"
									value="${productInfo.pcategory}" readonly>
							</div>
							<div>
								<span class="title" style="letter-spacing: 24px">상품명</span> :
								&nbsp; <input type="text" name="pname" id="pname"
									value="${productInfo.pname}" readonly>
							</div>
							<div>
								<span class="title" style="letter-spacing: 24px">판매가</span> :
								&nbsp; <input type=text name="pprice" id="pprice"
									value="${productInfo.pprice}" readonly>
							</div>
							<!-- onblur : 포커스를 잃었을때 이벤트 발생됨-->
							<div>
								<span class="title" style="letter-spacing: 24px">적립금</span> :
								&nbsp; <input type=text name="ppoint" id="ppoint"
									value="${productInfo.ppoint}" readonly>
							</div>
							<div>
								<span class="title" style="letter-spacing: 30px"></span> <input
									type="hidden" name="pquantity" id="pquantity" value="1">
							</div>
						</div>

						<hr>
						<!-- 옵션 입력 처리 영역 -->
						<div class="contain1_product_title_option1">
							<div>
								<c:forEach var="olist" items="${optionlist}">
									<span class="title">옵 션 : ${olist.poption}</span>&nbsp;
								<input type="hidden" value="${olist.poption}" name="optitle">
									<select name="poption" id="poption">
										<option value="${olist.choiceA}">${olist.choiceA}</option>
										<option value="${olist.choiceB}">${olist.choiceB}</option>
										<option value="${olist.choiceC}">${olist.choiceC}</option>
									</select>
									<input type="hidden" id="orderOption" name="orderOption">
									<hr>
								</c:forEach>
							</div>
						</div>

					</form>
					<div class="contain1_product_quantity">
						<form name="form" method="get">
							수 량 : <input type=hidden name="price"
								value="${productInfo.pprice}"> <input type="text"
								name="amount" value="1" size="3" onchange="change();"> <input
								type="button" value=" + " onclick="add();"> <input
								type="button" value=" - " onclick="del();"><br> 금 액
							: <input type="text" name="sum" size="11" readonly>원 <br>
							<input type=hidden name="point" value="${productInfo.ppoint}">
							적립 포인트 : <input type="text" name="totalpoint" size="11" readonly>포인트
						</form>
					</div>
					<hr>
					<button class="btn btn-round btn-danger" type="submit"
						form="product" style="margin-left: 60px; margin-top: 15px;">
						<i class="fa fa-shopping-cart"></i> Add to Cart
					</button>
				</div>
		</section>

		<section class="content-item" id="comments">
			<div>
				<section class="product_information">
					<div class="information_box">
						<p>${productInfo.pinfo}</p>
					</div>
				</section>
			</div>
		</section>
		<hr>




		<section class="content-item" id="sqquestion">
			<div class="container">
				<div class="col-md-12">
					<div class="offer-dedicated-body-left">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade active show" id="pills-reviews"
								role="tabpanel" aria-labelledby="pills-reviews-tab">

								<div
									class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
									<h5 class="mb-1">상품 Q&A</h5>
									<div class="">
										<br>

										<!-- 댓글 목록 보기 -->
										<div id="qtable" style="width: 100%">
											<!-- 목록 테이블 -->
											<c:forEach var="qna" items="${qnaList}">
												<ul class="media-list">
													<li class="media">
														<div class="media-body">
															<strong class="text-success">${qna.memberId}</strong>
															<p>Q: ${qna.sqquestion}</p>
															<p>A: ${qna.sqanswer}</p>
														</div>
													</li>
												</ul>
											</c:forEach>
										</div>
										<form id="questionForm">
											<div class="form-group">
												<label>상품문의</label>
												<textarea rows="3" class="form-control" name="sqquestion"
													id="question" placeholder="질문을 적어주세요~"></textarea>
											</div>
											<div class="form-group">
												<input type="button" value="질문 전송"
													class="btn btn-primary btn-sm"
													onclick="askQuestion(${productInfo.pnum})"
													style="width: 100%; margin-bottom: 30px;">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<hr>

		<section class="content-item">
			<div class="container">
				<div class="col-md-12">
					<div class="offer-dedicated-body-left">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade active show" id="pills-reviews"
								role="tabpanel" aria-labelledby="pills-reviews-tab">

								<div
									class="bg-white rounded shadow-sm p-4 mb-4 restaurant-detailed-ratings-and-reviews">
									<h5 class="mb-1">상품 후기 및 평점</h5>
									<c:forEach var="review" items="${productReview}">
										<div class="reviews-members pt-4 pb-4">
											<div class="media">
												<a href="#"><img alt="사진없음"
													src="./resources/review_img/${review.sysname}"
													class="mr-3 rounded-pill"></a>
												<div class="media-body">
													<div class="reviews-members-header">
														<span class="star-rating float-right"> <a href="#"><i
																class="icofont-ui-rating active"></i></a> <a href="#"><i
																class="icofont-ui-rating active"></i></a> <a href="#"><i
																class="icofont-ui-rating active"></i></a> <a href="#"><i
																class="icofont-ui-rating active"></i></a> <a href="#"><i
																class="icofont-ui-rating"></i></a>
														</span>
														<p>${review.srtitle}
															<span class="gig-rating text-body-2"> <svg
																	xmlns="http://www.w3.org/2000/svg"
																	viewBox="0 0 1792 1792" width="15" height="15">
                                    <path fill="currentColor"
																		d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                </svg> ${review.srRate}
															</span>
														</p>

														<p class="text-gray">${review.memberId}</p>
													</div>
													<div class="reviews-members-body">
														<p>${review.srcontent}</p>
													</div>
													<ul
														class="list-unstyled list-inline media-detail pull-left">
														<li><i class="fa fa-calendar"></i> ${review.regDate}</li>
													</ul>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<footer> </footer>
</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<!-- 수량 변경용 스크립트 -->
<script type="text/javascript">	
//업로드할 파일을 선택하면, 'upload-name' 요소에
//파일 이름을 출력하고, 'fileCheck' 요소의 value를 1로 변경
$("#file").on("change", function(){
	//파일 입력창에서 선택한 파일 목록 가져오기

	var files = $("#file")[0].files;
	//console.log($("#file"));
	//console.log(files);
	
	imgPreview($(this));
	
	var fileName = "";
	
	if(files.length > 1){//하나 이상의 파일 선택 시
		fileName = files[0].name + " 외 "
			+ (files.length - 1) + "개"
	}
	else if(files.length == 1){
		fileName = files[0].name;
	}
	
	$(".upload-name").val(fileName);
	
	//fileCheck 부분 변경
	if(fileName == ""){//파일 취소 시
		$("#filecheck").val(0);
		$(".upload-name").val("파일선택");
	}
	else {//파일 선택 시
		$("#filecheck").val(1);
	}
	console.log($("#filecheck").val());
});

$(".contain1_photo_thumbnail").find("img").on("click", function(){
	if($(this).attr("src")!="./resources/images/no_image.png"){
		$("#preview_big").attr("src", $(this).attr("src"));
	}
});

function imgPreview(file){
	var fileList = $(file)[0].files;
	console.log('fileList.count='+fileList.length); 
	
	if(fileList[0]!=null){
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);	
		reader.onload = function(){
			let imgResult = reader.result;
			$("#preview_big").attr("src", imgResult);
			$("#preview_big").removeClass("preview_big_nothing");
			$("#preview_big").addClass("preview_big_exist");
			
			
			$("#preview_thumb1").attr("src", imgResult);
			$("#preview_thumb1").removeClass("thumbnail_img_nothing");
			$("#preview_thumb1").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_big").attr("src", "./resources/images/no_image.png");
		$("#preview_big").removeClass("preview_big_exist");
		$("#preview_big").addClass("preview_big_nothing");
		
		$("#preview_thumb1").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb1").removeClass("thumbnail_img_exist");
		$("#preview_thumb1").addClass("thumbnail_img_nothing");
		
	}

	if(fileList[1]!=null){
		var reader1 = new FileReader();
		reader1.readAsDataURL(fileList[1]);	
		reader1.onload = function(){
			let imgResult = reader1.result;
			$("#preview_thumb2").attr("src", imgResult);
			$("#preview_thumb2").removeClass("thumbnail_img_nothing");
			$("#preview_thumb2").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb2").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb2").removeClass("thumbnail_img_exist");
		$("#preview_thumb2").addClass("thumbnail_img_nothing");
	}

	if(fileList[2]!=null){
		var reader2 = new FileReader();
		reader2.readAsDataURL(fileList[2]);	
		reader2.onload = function(){
			let imgResult = reader2.result;
			$("#preview_thumb3").attr("src", imgResult);
			$("#preview_thumb3").removeClass("thumbnail_img_nothing");
			$("#preview_thumb3").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb3").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb3").removeClass("thumbnail_img_exist");
		$("#preview_thumb3").addClass("thumbnail_img_nothing");
	}
	
	if(fileList[3]!=null){
		var reader3 = new FileReader();
		reader3.readAsDataURL(fileList[3]);	
		reader3.onload = function(){
			let imgResult = reader3.result;
			$("#preview_thumb4").attr("src", imgResult);
			$("#preview_thumb4").removeClass("thumbnail_img_nothing");
			$("#preview_thumb4").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb4").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb4").removeClass("thumbnail_img_exist");
		$("#preview_thumb4").addClass("thumbnail_img_nothing");
	}
}



	var price;
	var amount;
	var point;

	function init() {
		price = document.form.price.value;
		amount = document.form.amount.value;
		point = document.form.point.value;
		document.form.sum.value = price;
		document.form.totalpoint.value = point;
		change();
	}

	function add() {
		hm = document.form.amount;
		sum = document.form.sum;
		totalpoint = document.form.totalpoint;
		hm.value++;

		sum.value = parseInt(hm.value) * price;
		totalpoint.value = parseInt(hm.value) * point;
		$("#pquantity").val(hm.value);
	}

	function del() {
		hm = document.form.amount;
		sum = document.form.sum;
		totalpoint = document.form.totalpoint;
		if (hm.value > 1) {
			hm.value--;
			sum.value = parseInt(hm.value) * price;
			totalpoint.value = parseInt(hm.value) * point;
		}
		$("#pquantity").val(hm.value);
	}

	function change() {
		hm = document.form.amount;
		sum = document.form.sum;
		totalpoint = document.form.totalpoint;

		if (hm.value < 0) {
			hm.value = 0;
		}
		sum.value = parseInt(hm.value) * price;
		totalpoint.value = parseInt(hm.value) * point;
		$("#pquantity").val(hm.value);
	}

	
function askQuestion(pnum){
	console.log(pnum);
		
	var qnaForm = $("#questionForm").serializeObject();
	qnaForm.pnum = pnum;
	qnaForm.memberId = "${qna.memberId}";
	console.log(qnaForm);
	
	$.ajax({
		url: "./askQuestion",
		type: "post",
		data: qnaForm,
		dataType: "json",
		success: function(result){
			var listStr = "";
			var qnaList = result.qnaList;
			console.log(result);
			console.log(qnaList);
			
			for(var i = 0; i < qnaList.length; i++){
				if(qnaList[i].sqanswer==null || qnaList[i].sqanswer==""){
					listStr += "<strong class='text-success'>"
							+ qnaList[i].memberId + "</strong>"
							+ "<p> Q: "	+ qnaList[i].sqquestion + "</p>";
				}
				else{
					listStr += "<strong class='text-success'>"
							+ qnaList[i].memberId + "</strong>"
							+ "<p> Q: "	+ qnaList[i].sqquestion + "</p>"
							+ "<p> A: " + qnaList[i].sqanswer + "</p>";
				}
			}
			
			$("#qtable").html(listStr);
			$("#question").val("");
		},
			error: function(error){
				console.log(error);
				alert("사용자 로그인 후 입력해주세요.")
			}
		});
	}

function productQuantity(){
	if( !isNaN( $('#amount').val() ) ){	// 
		var pquantity = Number($('#amount').val());
		pquantity = Math.floor(pquantity)	// 
		$('#pquantity').val(pquantity);
	}
}


//업로드할 파일을 선택하면, 'upload-name' 요소에
//파일 이름을 출력하고, 'fileCheck' 요소의 value를 1로 변경
$("#file").on("change", function(){
	//파일 입력창에서 선택한 파일 목록 가져오기

	var files = $("#file")[0].files;
	//console.log($("#file"));
	//console.log(files);
	
	imgPreview($(this));
	
	var fileName = "";
	
	if(files.length > 1){//하나 이상의 파일 선택 시
		fileName = files[0].name + " 외 "
			+ (files.length - 1) + "개"
	}
	else if(files.length == 1){
		fileName = files[0].name;
	}
	
	$(".upload-name").val(fileName);
	
	//fileCheck 부분 변경
	if(fileName == ""){//파일 취소 시
		$("#filecheck").val(0);
		$(".upload-name").val("파일선택");
	}
	else {//파일 선택 시
		$("#filecheck").val(1);
	}
	console.log($("#filecheck").val());
});

$(".contain1_photo_thumbnail").find("img").on("click", function(){
	if($(this).attr("src")!="./resources/images/no_image.png"){
		$("#preview_big").attr("src", $(this).attr("src"));
	}
});

function imgPreview(file){
	var fileList = $(file)[0].files;
	console.log('fileList.count='+fileList.length); 
	
	if(fileList[0]!=null){
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);	
		reader.onload = function(){
			let imgResult = reader.result;
			$("#preview_big").attr("src", imgResult);
			$("#preview_big").removeClass("preview_big_nothing");
			$("#preview_big").addClass("preview_big_exist");
			
			
			$("#preview_thumb1").attr("src", imgResult);
			$("#preview_thumb1").removeClass("thumbnail_img_nothing");
			$("#preview_thumb1").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_big").attr("src", "./resources/images/no_image.png");
		$("#preview_big").removeClass("preview_big_exist");
		$("#preview_big").addClass("preview_big_nothing");
		
		$("#preview_thumb1").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb1").removeClass("thumbnail_img_exist");
		$("#preview_thumb1").addClass("thumbnail_img_nothing");
		
	}

	if(fileList[1]!=null){
		var reader1 = new FileReader();
		reader1.readAsDataURL(fileList[1]);	
		reader1.onload = function(){
			let imgResult = reader1.result;
			$("#preview_thumb2").attr("src", imgResult);
			$("#preview_thumb2").removeClass("thumbnail_img_nothing");
			$("#preview_thumb2").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb2").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb2").removeClass("thumbnail_img_exist");
		$("#preview_thumb2").addClass("thumbnail_img_nothing");
	}

	if(fileList[2]!=null){
		var reader2 = new FileReader();
		reader2.readAsDataURL(fileList[2]);	
		reader2.onload = function(){
			let imgResult = reader2.result;
			$("#preview_thumb3").attr("src", imgResult);
			$("#preview_thumb3").removeClass("thumbnail_img_nothing");
			$("#preview_thumb3").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb3").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb3").removeClass("thumbnail_img_exist");
		$("#preview_thumb3").addClass("thumbnail_img_nothing");
	}
	
	if(fileList[3]!=null){
		var reader3 = new FileReader();
		reader3.readAsDataURL(fileList[3]);	
		reader3.onload = function(){
			let imgResult = reader3.result;
			$("#preview_thumb4").attr("src", imgResult);
			$("#preview_thumb4").removeClass("thumbnail_img_nothing");
			$("#preview_thumb4").addClass("thumbnail_img_exist");
		};
	}else{
		$("#preview_thumb4").attr("src", "./resources/images/no_image.png");
		$("#preview_thumb4").removeClass("thumbnail_img_exist");
		$("#preview_thumb4").addClass("thumbnail_img_nothing");
	}
}

$(function(){
    $(".chat").niceScroll();
}) 
</script>



</html>




