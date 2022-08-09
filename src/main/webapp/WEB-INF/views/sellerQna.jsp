<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/headercss.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/mysellerpage.css" />
	<link href="resources/css/headercss.css" rel="stylesheet" />
<script src="resources/js/jquery.serializeObject.js"></script>
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
</head>
<body>
	<header>
		<jsp:include page="shopHeader.jsp" />
	</header>
	<section>
		<div class="container bootstrap snippets bootdey">
			<!-- upper section -->
			<div class="row">
				<jsp:include page="./sellerSideBar.jsp"></jsp:include>
				<!-- /span-3 -->
				<div class="col-md-9">
					<!-- column 2 -->
					<a href="#"><strong><i
							class="glyphicon glyphicon-dashboard"></i> Q&A</strong></a>
					<hr>

					<div class="container">
						<div class="row bootstrap snippets bootdeys">
							<div class="col-md-8 col-sm-12">
								<div class="comment-wrapper">
									<div class="panel panel-info">
										<div class="panel-heading">Q&A</div>
										<div class="panel-body">
											<br>
											<ul class="media-list">
												<!-- 목록 테이블 -->
												<c:forEach var="qna" items="${qnaList}" varStatus="st">
													<ul class="media-list">
														<li class="media"><a href="#" class="pull-left">
														</a>
															<div class="media-body">
															
																<strong class="text-success"><a href ="./productInfo?pnum=${qna.pnum}">${qna.pnum}</a></strong>
																<p>Q: ${qna.sqquestion}</p>
																<p>${qna.qdate}</p>
																<p id="ans${qna.sqnum}">A: ${qna.sqanswer}</p>
																<p>${qna.adate}</p>
																<div id="atable" style="width: 100%">

																	<!-- 질문 작성 양식 -->
																	<form id="answerForm">
																		<input type="hidden" name="sqnum" value="${qna.sqnum}">
																		<textarea rows="2" class="write-input ta"
																			name="sqanswer" id="answer${qna.sqnum}"
																			placeholder="답글 달기~"></textarea>
																		<input type="button" value="답글 달기" class=""
																			id="qnabtn" style="width: 15%; margin-bottom: 30px;">
																	</form>
																</div>
															</div></li>
													</ul>
												</c:forEach>
											</ul>
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
	<footer></footer>

	
	<script type="text/javascript">
	<!-- Answer Q&A questions -->
		//function answerQuestion(sqnum){
		$(document).on("click", "#qnabtn", function() {
			//console.log(sqnum);
			var qnaFrm = $(this).parent();
			console.log(qnaFrm);
			var qnadata = qnaFrm.serializeObject();
			//qnaForm.sqnum = sqnum;
			qnadata.sellerID = "${qna.memberID}";
			console.log(qnadata);

			$.ajax({
				url : "./answerQuestion",
				type : "post",
				data : qnadata,
				dataType : "json",
				success : function(result) {
					console.log(result.answers);
					var resanswer = result.answers;
					var sqanswer = resanswer.sqanswer;
					var sqnum = resanswer.sqnum;
					console.log(sqnum);
					console.log(sqanswer);

					var sqinput = "#ans" + sqnum;

					$(sqinput).html("A: " + sqanswer);
					$("#answer" + sqnum).val("");
				},
				error : function(error) {
					console.log(error);
					alert("답변 입력 실패")
				}
			});
		});
	</script>


	<style type="text/css">

/* TABLES */
.table {
	border-collapse: separate;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #eee;
}

.table thead>tr>th {
	border-bottom: 1px solid #C2C2C2;
	padding-bottom: 0;
}

.table tbody>tr>td {
	font-size: 0.875em;
	background: #f5f5f5;
	border-top: 10px solid #fff;
	vertical-align: middle;
	padding: 12px 8px;
}

.table tbody>tr>td:first-child, .table thead>tr>th:first-child {
	padding-left: 20px;
}

.table thead>tr>th span {
	border-bottom: 2px solid #C2C2C2;
	display: inline-block;
	padding: 0 5px;
	padding-bottom: 5px;
	font-weight: normal;
}

.table thead>tr>th>a span {
	color: #344644;
}

.table thead>tr>th>a span:after {
	content: "\f0dc";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-left: 5px;
	font-size: 0.75em;
}

.table thead>tr>th>a.asc span:after {
	content: "\f0dd";
}

.table thead>tr>th>a.desc span:after {
	content: "\f0de";
}

.table thead>tr>th>a:hover span {
	text-decoration: none;
	color: #2bb6a3;
	border-color: #2bb6a3;
}

.table.table-hover tbody>tr>td {
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
}

.table tbody tr td .call-type {
	display: block;
	font-size: 0.75em;
	text-align: center;
}

.table tbody tr td .first-line {
	line-height: 1.5;
	font-weight: 400;
	font-size: 1.125em;
}

.table tbody tr td .first-line span {
	font-size: 0.875em;
	color: #969696;
	font-weight: 300;
}

.table tbody tr td .second-line {
	font-size: 0.875em;
	line-height: 1.2;
}

.table a.table-link {
	margin: 0 5px;
	font-size: 1.125em;
}

.table a.table-link:hover {
	text-decoration: none;
	color: #2aa493;
}

.table a.table-link.danger {
	color: #fe635f;
}

.table a.table-link.danger:hover {
	color: #dd504c;
}

.table-products tbody>tr>td {
	background: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
	position: relative;
}

.table-products tbody>tr:hover>td {
	text-decoration: none;
	background-color: #f6f6f6;
}

.table-products .name {
	display: block;
	font-weight: 600;
	padding-bottom: 7px;
}

.table-products .price {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}

.table-products .price>i {
	color: #8dc859;
}

.table-products .warranty {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}

.table-products .warranty>i {
	color: #f1c40f;
}

.table tbody>tr.table-line-fb>td {
	background-color: #9daccb;
	color: #262525;
}

.table tbody>tr.table-line-twitter>td {
	background-color: #9fccff;
	color: #262525;
}

.table tbody>tr.table-line-plus>td {
	background-color: #eea59c;
	color: #262525;
}

.table-stats .status-social-icon {
	font-size: 1.9em;
	vertical-align: bottom;
}

.table-stats .table-line-fb .status-social-icon {
	color: #556484;
}

.table-stats .table-line-twitter .status-social-icon {
	color: #5885b8;
}

.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
}
</style>

	<script type="text/javascript">
		
	</script>
</body>
</html>