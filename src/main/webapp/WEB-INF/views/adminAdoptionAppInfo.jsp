<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="resources/css/headercss.css">
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

<style type="text/css">
section {
	width: 1240px;
	margin: 0 auto;
}

.contain1 {
	width: 1240px;
	margin: 0 auto;
	position: relative;
}

.photo_wrap {
	width: 500px;
	height: 500px;
	display: inline-block;
	vertical-align: top;
}

.contain1_photo {
	width: 450px;
	height: 380px;
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	text-align: center;
}

.preview_big_exist {
	width: 420px;
	height: 350px;
	margin: 13px;
	opacity: 1;
}

.preview_big_nothing {
	width: 120px;
	height: 120px;
	margin: 25% 0;
	opacity: 0.4;
}

.contain1_photo_thumbnail {
	display: flex;
	justify-content: space-between;
	width: 450px;
	height: 100px;
	margin: 10px auto;
}

.contain1_photo_thumbnail>div {
	border: 1px solid #e0e0e0;
	width: 100px;
	height: 100px;
	text-align: center;
}

.thumbnail_img_exist {
	width: 80px;
	height: 80px;
	margin-top: 8px;
	opacity: 1;
}

.thumbnail_img_nothing {
	width: 60px;
	height: 60px;
	margin-top: 17px;
	opacity: 0.4;
}

.contain1_product_title {
	width: 670px;
	height: 500px;
	display: inline-block;
	margin-left: 60px;
}

.contain1_product_title .title {
	width: 130px;
	display: inline-block;
}

.contain1_product_title>div>input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
}

.contain1_product_title>div>select {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
}

.contain2 {
	width: 1240px;
	margin: 0 auto;
}

.filebox {
	width: 1240px;
	margin: 0 auto;
	position: relative;
}

.contain1_product_title_option1 {
	position: relative;
}

.contain1_product_title_option1 title {
	position: absolute;
	text-align: center;
	display: inline-block;
}

.contain1_product_title_option1 .list {
	padding-left: 94px;
}

.contain1_product_title_option2 {
	position: relative;
}

.contain1_product_title_option2 title {
	position: absolute;
	text-align: center;
	display: inline-block;
}

.contain1_product_title_option2 .list {
	padding-left: 94px;
}

.contain1_product_title_option1 input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
	display: inline-block;
}

.contain1_product_title_option2 input {
	width: 400px;
	height: 34px;
	text-align: center;
	margin-bottom: 10px;
	border-radius: 15px;
	background: #f9f4f0;
	border: none;
	display: inline-block;
}

.buttonwrap {
	margin: 0 auto;
	width: 150px;
}

.adoptionInfo {
	position: relative;
}

.body-2 {
	border: 1px solid;
	border-radius: 10px;
	min-height: 150px;
	margin-top: 20px;
}

.body-2-1-1 {
	margin: 15px 15px;
}
</style>

</head>

<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	
	<section>
		<h2 class="login-header"></h2>
		<form action="./adminApplicationOk?aaKey=${appList.aaKey}&dogNum=${adopList.dogNum}"
			method="post" enctype="multipart/form-data">
			<div class="contain1">
				<div class="photo_wrap">
					<div class="contain1_photo">
						<img class="preview_big_exist" id="preview_big"
							src="./resources/upload/${dfList[0].sysname}" alt="">
					</div>
					<div class="contain1_photo_thumbnail">
						<c:forEach var="df" items="${dfList}" varStatus="st">
							<div>
								<img class="thumbnail_img_exist" id="preview_thumb${st.count}"
									src="./resources/upload/${df.sysname}" alt="">
							</div>
						</c:forEach>
						<c:if test="${dfList.size() < 4}">
							<c:forEach var="cnt" begin="1" end="${4-dfList.size()}" step="1">
								<div>
									<img class="thumbnail_img_nothing"
										id="preview_thumb${cnt+dfList.size()+1}"
										src="./resources/images/no_image.png" alt="">
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<%-- end : photo_wrap --%>


				<div class="contain1_product_title">
					<div>
						<span class="title" style="letter-spacing: 24px">이름</span> :
						&nbsp; <input type="text" name="dogName" id="poption"
							value="${adopList.dogName}" readonly>
					</div>
					<hr>
					<div class="contain1_product_title_option1">

						<div>
							<span class="title" style="letter-spacing: 24px">나이</span> :
							&nbsp; <input type="text" name="dogAge" id="poption"
								value="${adopList.dogAge}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">성별</span> :
							&nbsp; <input type=text name="dogGender" id="choiceA"
								value="${adopList.dogGender}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">품종</span> :
							&nbsp; <input type=text name="dogBreed" id="choiceB"
								value="${adopList.dogBreed}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 5px">예방정접여부</span> :
							&nbsp; <input type=text name="dogVaccine" id="choiceC"
								value="${adopList.dogVaccine}" readonly>
						</div>
						<div>
							<span class="title" style="letter-spacing: 24px">가격</span> :
							&nbsp; <input type=text name="dogPrice" id="choiceC"
								value="${adopList.dogPrice}" readonly>
						</div>
						
					</div>
				</div>
				<hr class="hr">

				<div class="adoptionInfo">
					<span>입양 신청자 정보</span>
					<div class="body-2">
						<div class="contain1_product_title_option1">
							<!-- 입양신청정보 리스트 -->
							<div class="body-2-1-1">
								<input type="hidden" name="memberId" value="${appList.memberId}">
							</div>
							<div>
								<span class="title" style="letter-spacing: 24px">이름</span> :
								&nbsp; <input type="text" name="aaName" id="poption"
									value="${appList.aaName}" readonly>
							</div>
							<!-- 이름 -->
							<div>
								<span class="title" style="letter-spacing: 24px">주소</span> :
								&nbsp; <input type="text" name="aaAddress" id="poption"
									value="${appList.aaAddress}" readonly>
							</div>
							<!-- 주소 -->
							<div>
								<span class="title" style="letter-spacing: 24px">연락처</span> :
								&nbsp; <input type="text" name="aaPnum" id="poption"
									value="${appList.aaPnum}" readonly>
							</div>
							<!-- 연락처 -->
						</div>
					</div>
				</div>
			</div>

			<hr>
			<div class="buttonwrap">
				<c:choose>
					<c:when test="${adopList.aaStatus eq '승인대기'}">
						<input style="height: 30px" type="submit" value="승인하기">
						<input style="height: 30px" type="button"
							onclick="decline(${adopList.dogNum})" value="거절하기">
					</c:when>
				</c:choose>

			</div>
		</form>
	</section>
	<footer> </footer>
</body>
<script type="text/javascript">
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

function decline(dogNum){
	var conf = confirm("거절하시겠습니까?");
	
	if(conf == true){
		location.href = "./delAdoptionInfo?aaKey=${adopList.aaKey}&rType=2";
	}
}
</script>
</html>




