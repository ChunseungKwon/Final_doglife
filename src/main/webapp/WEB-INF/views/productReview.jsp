<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
<link rel="stylesheet" href="resources/css/review.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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


<title>상품후기 작성</title>

</head>
<body>
	<header>
		<jsp:include page="shopHeader.jsp" />
	</header>




	<div class="container">
		<div class="be-comment-block">
			<h1 class="comments-title">상품후기</h1>
			<form action="./productReviewRegister" method="post"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group fl_icon">
							<input class="form-input" type="text" name="memberId" value="${memberId}"
								readonly> <input type="hidden" name="pnum"
								value="${pnum}">

						</div>
					</div>
					<div class="col-xs-12 col-sm-6 fl_icon">
						<div class="review_rating">
							<div class="warning_msg">별점을 선택해 주세요.</div>
							<div class="rating">
								<input id="hrate" type="hidden" name="rate" value="0">
								<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
								<input type="checkbox" name="rating" id="rating1" value="1"
									class="rate_radio" title="1점"> <label for="rating1"></label>
								<input type="checkbox" name="rating" id="rating2" value="2"
									class="rate_radio" title="2점"> <label for="rating2"></label>
								<input type="checkbox" name="rating" id="rating3" value="3"
									class="rate_radio" title="3점"> <label for="rating3"></label>
								<input type="checkbox" name="rating" id="rating4" value="4"
									class="rate_radio" title="4점"> <label for="rating4"></label>
								<input type="checkbox" name="rating" id="rating5" value="5"
									class="rate_radio" title="5점"> <label for="rating5"></label>
							</div>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group">
							<input class="form-input" name="srTitle" type="text"
								placeholder="제목을 입력하세요." required>
							<textarea class="form-input" name="srContent"
								placeholder="내용을 입력하세요." rows="25" required></textarea>
						</div>
					</div>
					<hr>
					<table class="con_table">
						<!-- 이미지 파일 미리보기 -->
						<c:if test="${!empty pList}">
							<tr>
								<th>PREVIEW</th>
							</tr>
							<tr>
								<td><c:forEach var="f" items="${pList}">
										<c:choose>
											<c:when test="${fn:contains(f.oriname,'.jpg')}">
												<img src="resources/upload/${f.sysname}" width="100">
											</c:when>
											<c:when test="${fn:contains(f.oriname,'.PNG')}">
												<img src="resources/upload/${f.sysname}" width="100">
											</c:when>
											<c:when test="${fn:contains(f.oriname,'.gif')}">
												<img src="resources/upload/${f.sysname}" width="100">
											</c:when>
											<c:otherwise>미리보기 없음</c:otherwise>
										</c:choose>
									</c:forEach></td>
							</tr>
						</c:if>
					</table>


					<label for="file">파일 추가</label> <input type="file" name="files"
						id="file">
					<!-- 업로드할 파일이 있으면 1, 없으면 0 -->
					<input type="hidden" id="filecheck" value="0" name="fileCheck">

					<div class="regbutton">
						<input type="submit" name="files"
							class="btn btn-primary pull-right" value="등록"></input> <input
							type="hidden" id="fileCheck" name="fileCheck" value="0">
					</div>
				</div>
			</form>
		</div>
	</div>


	<footer> </footer>


	<script type="text/javascript">
		//업로드할 파일을 선택하면, 'upload-name' 요소에
		//파일 이름을 출력하고, 'fileCheck' 요소의 value를 1로 변경
		$("#file").on("change", function() {
			//파일 입력창에서 선택한 파일 목록 가져오기
			var files = $("#file")[0].files;
			console.log($("#file"));
			console.log(files);

			var fileName = "";

			if (files.length > 1) {//하나 이상의 파일 선택 시
				fileName = files[0].name + " 외 " + (files.length - 1) + "개"
			} else if (files.length == 1) {
				fileName = files[0].name;
			}

			$(".upload-name").val(fileName);

			//fileCheck 부분 변경
			if (fileName == "") {//파일 취소 시
				$("#filecheck").val(0);
				$(".upload-name").val("File Choose");
			} else {//파일 선택 시
				$("#filecheck").val(1);
			}
			console.log($("#filecheck").val());
		});
		
		
	      const btn = document.querySelector("button");
	      const post = document.querySelector(".post");
	      const widget = document.querySelector(".star-widget");
	      const editBtn = document.querySelector(".edit");
	      btn.onclick = ()=>{
	        widget.style.display = "none";
	        post.style.display = "block";
	        editBtn.onclick = ()=>{
	          widget.style.display = "block";
	          post.style.display = "none";
	        }
	        return false;
	      }

		function backbtn() {
			var urlstr = "./list?";
			var col = "${list.colname}";
			var key = "${list.keyword}";

			if (col == null || col == "") {//검색을 안한 경우
				urlstr += "pageNum=${pageNum}";
			} else {//검색을 한 경우
				urlstr += "colname=${list.colname}&keyword=${list.keyword}"
						+ "&pageNum=${pageNum}";
			}
			console.log(urlstr);

			location.href = urlstr;
		}
		
		//별점 마킹 모듈 프로토타입으로 생성
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		    this.rate = newrate;
		    let items = document.querySelectorAll('.rate_radio');
		    items.forEach(function(item, idx){
		        if(idx < newrate){
		            item.checked = true;
		        }else{
		            item.checked = false;
		        }
		    });
		}
		let rating = new Rating();//별점 인스턴스 생성
		
		
		document.addEventListener('DOMContentLoaded', function(){
		    //별점선택 이벤트 리스너
		    document.querySelector('.rating').addEventListener('click',function(e){
		        let elem = e.target;
		        if(elem.classList.contains('rate_radio')){
		            rating.setRate(parseInt(elem.value));
		            console.log(elem.value);
		            document.querySelector("#hrate").value = elem.value;
		        }
		    })
		});
		
	    

	    //저장 전송전 필드 체크 이벤트 리스너
	    document.querySelector('#save').addEventListener('click', function(e){
	        //별점 선택 안했으면 메시지 표시
	        if(rating.rate == 0){
	            rating.showMessage('rate');
	            return false;
	        }
	        //폼 서밋
	    });
	    Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
		
		
		
		
		
	</script>
	<style type="text/css">
/* 레이아웃 외곽 너비 400px 제한*/
.wrap {
	max-width: 480px;
	margin: 0 auto; /* 화면 가운데로 */
	background-color: #fff;
	height: 100%;
	padding: 20px;
	box-sizing: border-box;
}

.reviewform textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

.rating .rate_radio {
	position: relative;
	display: inline-block;
	z-index: 20;
	opacity: 0.001;
	width: 60px;
	height: 60px;
	background-color: #fff;
	cursor: pointer;
	vertical-align: top;
	display: none;
}

.rating .rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: -4px;
	z-index: 10;
	width: 60px;
	height: 60px;
	background-image: url('./resources/images/starrate.png');
	background-repeat: no-repeat;
	background-size: 60px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rating .rate_radio:checked+label {
	background-color: #ff8;
}

.warning_msg {
	display: none;
	position: relative;
	text-align: center;
	background: #ffffff;
	line-height: 26px;
	width: 100%;
	color: red;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #e0e0e0;
}
</style>
</body>
</html>
