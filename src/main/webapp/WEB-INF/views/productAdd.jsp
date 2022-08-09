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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="resources/css/shopstyle.css" rel="stylesheet" />
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

.preview_big_exist{
	width: 420px;
    height: 350px;
    margin: 13px;
    opacity: 1;
}

.preview_big_nothing{
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

.contain1_photo_thumbnail > div {
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

.contain1_product_title_option1{
	position: relative;

}

.contain1_product_title_option1 title{
	position: absolute;
	text-align: center;
	display: inline-block;
}


.contain1_product_title_option1 .list{
	padding-left: 94px;
}
.contain1_product_title_option2 {
	position: relative;
}	
.contain1_product_title_option2 title{
	position: absolute;
	text-align: center;
	display: inline-block;
}	

.contain1_product_title_option2 .list{
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
	width: 100px;
}
</style>
</head>

<body>

	<header>
		<jsp:include page="shopHeader.jsp" />
	</header>
	
	<section>
	
		<h2 class="login-header">${productInfo.pname}</h2>
		
	
			<form action="./addNewProduct" method="post" enctype="multipart/form-data">
				<div class="contain1">
					<div class="photo_wrap">
					
						<div class="contain1_photo">
							<img class="preview_big_nothing" id="preview_big" src="./resources/images/no_image.png" alt="">											
						</div>											
						<div  class="contain1_photo_thumbnail">
							<div><img class="thumbnail_img_nothing" id="preview_thumb1" src="./resources/images/no_image.png" alt="" ></div> 
							<div><img class="thumbnail_img_nothing" id="preview_thumb2" src="./resources/images/no_image.png" alt="" ></div>
							<div><img class="thumbnail_img_nothing" id="preview_thumb3" src="./resources/images/no_image.png" alt="" ></div>
							<div><img class="thumbnail_img_nothing" id="preview_thumb4" src="./resources/images/no_image.png" alt="" ></div>
											
						</div>		
								
					</div> <%-- end : photo_wrap --%>

					
					<div class="contain1_product_title" >
						<div> <input type="hidden" name="sellerID" value="${sellerID}"></div>
						
						<div ><span class="title">상품카테고리</span> : &nbsp; 
						<select name="pcategory" id="pcategory">
							<option value="food"> 사료 </option>
							<option value="clothes"> 옷/목줄 </option>
							<option value="cage"> 케이지 </option>
							<option value="toy"> 장난감 </option>
						</select>
				
						</div>
						<div ><span class="title" style="letter-spacing: 24px">상품명</span> : &nbsp;<input type="text" name="pname" id="pname"></div>
						<div ><span class="title" style="letter-spacing: 24px">판매가</span> : &nbsp;<input type=text name="pprice" id="pprice" onblur="ppointSelect()"></div> <!-- onblur : 포커스를 잃었을때 이벤트 발생됨-->
						<div ><span class="title" style="letter-spacing: 24px">적립금</span> : &nbsp;<input type=text name="ppoint" id="ppoint" readonly></div>
						<div ><span class="title" style="letter-spacing: 30px">수 량</span> : &nbsp;<input type="text" name="pquantity" id="pquantity"></div>						
					
						
						<hr>
						
						
								<!-- 옵션 입력 처리 영역 -->
						<div class="contain1_product_title_option1">
							<div ><span class="title" style="letter-spacing: 24px">옵션1</span> : &nbsp; <input type="text" name="poption" id="poption" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">A</span> : &nbsp; <input type=text name="choiceA" id="choiceA" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">B</span> : &nbsp; <input type=text name="choiceB" id="choiceB" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">C</span> : &nbsp; <input type=text name="choiceC" id="choiceC" ></div>
							
						</div>	
						<div class="contain1_product_title_option2">
							<div ><span class="title" style="letter-spacing: 24px">옵션2</span> : &nbsp; <input type="text" name="poption" id="poption" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">A</span> : &nbsp; <input type=text name="choiceA" id="choiceA" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">B</span> : &nbsp; <input type=text name="choiceB" id="choiceB" ></div>
							<div><span class="title, list" style="letter-spacing: 24px">C</span> : &nbsp; <input type=text name="choiceC" id="choiceC" ></div>
						</div>			
						
					
					</div>			
							<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
							<input type="hidden" id="filecheck"
								value="0" name="fileCheck">
						
			</div> <%--end :class contain1 --%>
							
					<hr>
					
					<div class="contain2">
						<div ><textarea rows="15" cols="90" name="pinfo" id="pinfo" placeholder="상품설명 "></textarea></div>
					
					</div>
					<hr>
					
						<div class="filebox">
								<!-- 파일 입력 처리 영역 -->
									<label for="file">업로드</label>
									<input type="file" name="files" id="file"
										multiple>
									<input type="text" class="upload-name"
										value="파일선택" readonly>
									<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
									<input type="hidden" id="filecheck"
										value="0" name="fileCheck">
						</div>
					<br>
					<br>
						<div class="buttonwrap">
						<input style="height: 30px" type="button" value="취소" onclick="location.href='./sellerPage'"> 
						<input type="submit" value="등록"style="height: 30px"></input>
						</div>
		
			</form>
			
					
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

function backbtn(){
	var urlstr = "./sellerPage?";
	var category = "${list.category}";
	
	if(category == null || category == ""){ //검색을 안한 경우
		urlstr += "pageNum=${pageNum}";
	}
	else{ //검색을 한 경우
		urlstr += "category=${list.category}&pageNum=${pageNum}";  
	}
	console.log(urlstr);
	
	location.href=urlstr;
}

$(function(){
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
});

function ppointSelect(){
	if( !isNaN( $('#pprice').val() ) ){	// 입력된 가격이 숫자형인지 체크
		var frprice = Number($('#pprice').val());
		var ppoint = Number(frprice *0.01);
		ppoint = Math.floor(ppoint)	// 포인트에서 소수점 버림(정수로 변환)
		$('#ppoint').val(ppoint);
	}
}



</script>
</html>




