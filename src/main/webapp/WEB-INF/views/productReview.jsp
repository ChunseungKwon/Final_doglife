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

		//????????? ?????? ??????
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}

	});
</script>


<title>???????????? ??????</title>

</head>
<body>
	<header>
		<jsp:include page="shopHeader.jsp" />
	</header>




	<div class="container">
		<div class="be-comment-block">
			<h1 class="comments-title">????????????</h1>
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
							<div class="warning_msg">????????? ????????? ?????????.</div>
							<div class="rating">
								<input id="hrate" type="hidden" name="rate" value="0">
								<!-- ?????? ????????? ???????????? ?????? ?????? ??? ????????? ?????? ?????? ??????????????? checked ?????? -->
								<input type="checkbox" name="rating" id="rating1" value="1"
									class="rate_radio" title="1???"> <label for="rating1"></label>
								<input type="checkbox" name="rating" id="rating2" value="2"
									class="rate_radio" title="2???"> <label for="rating2"></label>
								<input type="checkbox" name="rating" id="rating3" value="3"
									class="rate_radio" title="3???"> <label for="rating3"></label>
								<input type="checkbox" name="rating" id="rating4" value="4"
									class="rate_radio" title="4???"> <label for="rating4"></label>
								<input type="checkbox" name="rating" id="rating5" value="5"
									class="rate_radio" title="5???"> <label for="rating5"></label>
							</div>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group">
							<input class="form-input" name="srTitle" type="text"
								placeholder="????????? ???????????????." required>
							<textarea class="form-input" name="srContent"
								placeholder="????????? ???????????????." rows="25" required></textarea>
						</div>
					</div>
					<hr>
					<table class="con_table">
						<!-- ????????? ?????? ???????????? -->
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
											<c:otherwise>???????????? ??????</c:otherwise>
										</c:choose>
									</c:forEach></td>
							</tr>
						</c:if>
					</table>


					<label for="file">?????? ??????</label> <input type="file" name="files"
						id="file">
					<!-- ???????????? ????????? ????????? 1, ????????? 0 -->
					<input type="hidden" id="filecheck" value="0" name="fileCheck">

					<div class="regbutton">
						<input type="submit" name="files"
							class="btn btn-primary pull-right" value="??????"></input> <input
							type="hidden" id="fileCheck" name="fileCheck" value="0">
					</div>
				</div>
			</form>
		</div>
	</div>


	<footer> </footer>


	<script type="text/javascript">
		//???????????? ????????? ????????????, 'upload-name' ?????????
		//?????? ????????? ????????????, 'fileCheck' ????????? value??? 1??? ??????
		$("#file").on("change", function() {
			//?????? ??????????????? ????????? ?????? ?????? ????????????
			var files = $("#file")[0].files;
			console.log($("#file"));
			console.log(files);

			var fileName = "";

			if (files.length > 1) {//?????? ????????? ?????? ?????? ???
				fileName = files[0].name + " ??? " + (files.length - 1) + "???"
			} else if (files.length == 1) {
				fileName = files[0].name;
			}

			$(".upload-name").val(fileName);

			//fileCheck ?????? ??????
			if (fileName == "") {//?????? ?????? ???
				$("#filecheck").val(0);
				$(".upload-name").val("File Choose");
			} else {//?????? ?????? ???
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

			if (col == null || col == "") {//????????? ?????? ??????
				urlstr += "pageNum=${pageNum}";
			} else {//????????? ??? ??????
				urlstr += "colname=${list.colname}&keyword=${list.keyword}"
						+ "&pageNum=${pageNum}";
			}
			console.log(urlstr);

			location.href = urlstr;
		}
		
		//?????? ?????? ?????? ????????????????????? ??????
		function Rating(){};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate){
		    //?????? ?????? - ????????? ??? ?????? ?????? ??? ?????? ??????
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
		let rating = new Rating();//?????? ???????????? ??????
		
		
		document.addEventListener('DOMContentLoaded', function(){
		    //???????????? ????????? ?????????
		    document.querySelector('.rating').addEventListener('click',function(e){
		        let elem = e.target;
		        if(elem.classList.contains('rate_radio')){
		            rating.setRate(parseInt(elem.value));
		            console.log(elem.value);
		            document.querySelector("#hrate").value = elem.value;
		        }
		    })
		});
		
	    

	    //?????? ????????? ?????? ?????? ????????? ?????????
	    document.querySelector('#save').addEventListener('click', function(e){
	        //?????? ?????? ???????????? ????????? ??????
	        if(rating.rate == 0){
	            rating.showMessage('rate');
	            return false;
	        }
	        //??? ??????
	    });
	    Rating.prototype.showMessage = function(type){//??????????????? ??????
    switch(type){
        case 'rate':
            //??????????????? ??????
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //????????? ?????? ??? ?????? ????????? ??????
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //??????????????? ??????
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //????????? ?????? ??? ?????? ????????? ??????
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
		
		
		
		
		
	</script>
	<style type="text/css">
/* ???????????? ?????? ?????? 400px ??????*/
.wrap {
	max-width: 480px;
	margin: 0 auto; /* ?????? ???????????? */
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
