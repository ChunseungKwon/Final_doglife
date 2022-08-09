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
	<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
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
<title>후기 작성</title>
</head>

<body>
<header>
		<jsp:include page="centerheader.jsp" />
	</header>




	<div class="container">
		<div class="be-comment-block">
			<h1 class="comments-title">입양후기</h1>
			<form action="./adoptionReviewRegister" method="post"
			enctype="multipart/form-data">
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group fl_icon">
							<input class="form-input" type="text" name="memberId" value="${memberId}"
								readonly> <input type="hidden" name="dogNum"
								value="${drDto.dogNum}">
							
						</div>
					</div>
					
						
					<div class="col-xs-12">
						<div class="form-group">
							<input class="form-input" name="drTitle" type="text"
								placeholder="제목을 입력하세요." required>
							<textarea class="form-input" name="drContent"
								placeholder="내용을 입력하세요." rows="25" required></textarea>
						</div>
					</div>
					<hr>
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
		function del(sysname){
			console.log(sysname);
			
			var con = confirm("파일을 삭제하겠습니까?");
			
			if(con == true){
				var objdata = {"sysname":sysname};
				objdata.drNum = ${drDto.drNum};
				console.log(objdata);
				
				$.ajax({
					url: "./ReviewPicdelFile",
					type: "post",
					data: objdata,
					dataType: "json",
					success: function(result){
						console.log(result);
						alert("삭제 성공");
						
						var flist = "";
						var rflist = result.AList;
						console.log(rflist);
						if(rflist.length == 0){
							flist += '<label style="width: 100%">첨부 파일 없음</label>';
						}
						else {
							for(var i = 0; i < rflist.length; i++){
								flist += '<label style="width: 100%" onclick="del(\''
										+ rflist[i].sysname + '\')">'
										+ rflist[i].oriname + '</label>';
							}
						}
						
						$("#bfile").html(flist);
					},
					error: function(error){
						console.log(error);
						alert("삭제 실패");
					}
				});
			}
		}
	
	</script>
</body>
</html>