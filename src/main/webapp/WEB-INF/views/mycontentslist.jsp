<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/mysellerpage.css">
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
</head>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section>
		<!-- Main -->
		<div class="container bootstrap snippets bootdey">

			<!-- upper section -->
			<jsp:include page="./sideBar.jsp"></jsp:include>
				
				<!-- /span-3 -->
				<div class="col-md-9">
					<!-- column 2 -->
					<a href="#"><strong><i
							class="glyphicon glyphicon-dashboard"></i> 나의 게시물</strong></a>
					<hr>
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="main-box clearfix">
									<div class="table-responsive">
										<table class="table user-list">
											<thead>
												<tr>
													<th><span>강아지 사진</span></th>
													<th><span>글 제목</span></th>
													<th><span>글 내용</span></th>
													<th><span>날 짜</span></th>
													<th>&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty rList}">nothing!!</c:if>
												<c:if test="${!empty rList}">
													<c:forEach var="adoptreview" items="${rList}">
														<tr>
															<td><img alt="Product" width="100px"
																src="./resources/upload/${adoptreview.thumbnailsys}">
															<td><a
																href="./adoptionReviewUpdate?drNum=${adoptreview.drNum}">${adoptreview.drTitle}</a></td>
															<td><p>${adoptreview.drContent}</p></td>
															<td><fmt:formatDate value="${adoptreview.regDate}"
																	pattern="yyyy-MM-dd" /></td>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
										<hr>
										<table class="table user-list">
											<thead>
												<tr>
													<th><span>상품 사진</span></th>
													<th><span>글 제목</span></th>
													<th><span>글 내용</span></th>
													<th><span>날 짜</span></th>
													<th>&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty pList}">nothing!!</c:if>
												<c:if test="${!empty pList}">
													<c:forEach var="shopreview" items="${pList}">
														<tr>
															<td><img width="100px"
																src="./resources/review_img/${shopreview.sysname}">
															<td>
															<a
																href="./productReviewUpdate?srnum=${shopreview.srnum}">${shopreview.srtitle}</a></td>
															<td><p>${shopreview.srcontent}</p></td>
															<td><fmt:formatDate value="${shopreview.regDate}"
																	pattern="yyyy-MM-dd" /></td>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>