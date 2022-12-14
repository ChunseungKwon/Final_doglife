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
<title>?????? ??????</title>
</head>

<body>
	<header>
		<jsp:include page="centerheader.jsp" />
	</header>




	<div class="container">
		<div class="be-comment-block">
			<h1 class="comments-title">????????????</h1>
			<form action="./adoptionReviewUpdate" method="get"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-xs-12 col-sm-6">
						<div class="form-group fl_icon">
							<input type="hidden" name="memberId" value="${bDto.memberId}">
							<input name="anum" type="hidden" value="${bDto.anum}" readonly>
						</div>
					</div>


					<div class="col-xs-12">
						<div class="form-group">
							<div class="form-input" style="display:flex; justify-content:space-between;">
								<div>
									${bDto.anum}
								</div>
								<div>
									<fmt:formatDate value="${bDto.editdate}" pattern="yyyy-MM-dd"/>
								</div>
							</div>
							<input class="form-input" name="atitle" type="text"
								placeholder="????????? ???????????????." value="${bDto.atitle}" required
								readonly>
							<textarea class="form-input" name="acontent"
								placeholder="????????? ???????????????." rows="25" required readonly>${bDto.acontent}</textarea>
						</div>
					</div>
					<hr>
					<div class="regbutton" style="text-align: center;">
						<c:if test="${bDto.memberId eq memberId}">
							<input class="update1" type="submit" value="??????">
						</c:if>
					</div>
				</div>
			</form>
		</div>
		<div style="display: flex; justify-content: space-between;">
			${pPage} ${nPage}
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
		function del(sysname) {
			console.log(sysname);

			var con = confirm("????????? ??????????????????????");

			if (con == true) {
				var objdata = {
					"sysname" : sysname
				};
				objdata.anum = $
				{
					bDto.anum
				}
				;
				console.log(objdata);

				$
						.ajax({
							url : "./ReviewPicdelFile",
							type : "post",
							data : objdata,
							dataType : "json",
							success : function(result) {
								console.log(result);
								alert("?????? ??????");

								var flist = "";
								var rflist = result.AList;
								console.log(rflist);
								if (rflist.length == 0) {
									flist += '<label style="width: 100%">?????? ?????? ??????</label>';
								} else {
									for (var i = 0; i < rflist.length; i++) {
										flist += '<label style="width: 100%" onclick="del(\''
												+ rflist[i].sysname
												+ '\')">'
												+ rflist[i].oriname
												+ '</label>';
									}
								}

								$("#bfile").html(flist);
							},
							error : function(error) {
								console.log(error);
								alert("?????? ??????");
							}
						});
			}
		}
	</script>
</body>
</html>