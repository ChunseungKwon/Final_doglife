<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/headercss.css">
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
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.inputform {
	margin: auto;
	border-style: solid;
	border-radius: 10px;
	min-height: 200px;
	max-height: 1000px;
	padding: 20px;
}

.title {
	width: 50%;
	margin-top: 10px;
}

.content {
	width: 90%;
	height: 80%;
	margin-top: 30px;
	margin: auto;
}

.content1 {
	width: 100%;
	height: 100%;
	min-height: 150px;
	margin-top: 10px;
}

.info {
	float: right;
}

.mb-3 {
	width: 80%;
	margin: auto;
}

.regbutton {
	margin: auto;
	width: 20%;
	display: flex;
	flex-direction: row-reverse;
}

.regbutton1 {
	margin: auto;
	width: 100%;
	border-radius: 10%;
	margin-left: 10px;
}

.regbutton2 {
	margin: auto;
	width: 100%;
	border-radius: 10%;
	margin-right: 10px;
	float: right;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section style="margin-top: 80px;">
		<div class="container bootstrap snippets bootdey">
				<!-- /span-3 -->
				<div class="col-md-9">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="main-box clearfix">
									<div class="table-responsive">
										<a><strong><i
												class="glyphicon glyphicon-dashboard"></i> 공지사항</strong></a>
										<hr>
										<div>
											<div>
												<form action="./adminAnnouncementInsert" method="post">
													<div class="inputform">

														<input type="hidden" name="memberId" value="${memberId}"> 
														<div class="content">
															<select id="categories" name="atype" required>
																<option value="입양">입양</option>
																<option value="장례">장례</option>
															</select>
															<div>
																<input class="title" name="atitle" type="text"
																	placeholder="제목을 입력하세요." required>
															</div>
															<textarea class="content1" name="acontent"
																placeholder="내용을 입력하세요." rows="15" required></textarea>
														</div>
													</div>
													<hr>
													<div class="regbutton">
														<input type="submit" name="files" class="regbutton1"
															value="등록"> <input type="reset" name="files"
															class="regbutton2" value="취소"> <input
															type="hidden" id="fileCheck" name="fileCheck" value="0">
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./centerfooter.jsp" />
	</footer>
</body>
</html>