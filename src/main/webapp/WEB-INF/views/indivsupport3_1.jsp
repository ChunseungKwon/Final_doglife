<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/headercss.css">
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/headercss.css">
<link rel="stylesheet" href="resources/css/common.css">
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
<title>공지사항</title>
</head>

<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<!-- Main -->
	<section style="margin-top: 80px;">
		<div class="container bootstrap snippets bootdey">
			<!-- upper section -->
			<div class="row">
				<jsp:include page="./adminSideBar.jsp" />
				<div class="col-md-9">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="main-box clearfix">
									<div class="table-responsive">
										<div class="div-1">
											<a><strong><i
													class="glyphicon glyphicon-dashboard"></i>관리자 1대1문의</strong></a>
											<hr>
										</div>
										<div class="div-2-1">
											<c:forEach var="v" items="${sList}" varStatus="status">
												<c:if test="${v.msType eq '1'}">
													<div class="div-2-1">
														<div class="categories">[입양]</div>
														<div class="date">
															<fmt:formatDate value="${v.qdate}" pattern="yyyy-MM-dd" />
														</div>
														<a href="./indivsupport5?msNum=${v.msNum}">${v.msTitle}</a>
														<div class="title">${v.msQuestion}</div>
														<td><p class="lab">${v.msStatus}</p></td>
													</div>
													<hr>
												</c:if>
											</c:forEach>

											<c:forEach var="v" items="${sList}" varStatus="status">
												<c:if test="${v.msType eq '2'}">
													<div class="div-2-1">
														<div class="categories">[장례]</div>
														<div class="date">
															<fmt:formatDate value="${v.qdate}" pattern="yyyy-MM-dd" />
														</div>
														<a href="./indivsupport5?msNum=${v.msNum}">${v.msTitle}</a>
														<div class="title">${v.msQuestion}</div>
														<td><p class="lab">${v.msStatus}</p></td>
													</div>
													<hr>
												</c:if>
											</c:forEach>

											<c:forEach var="v" items="${sList}" varStatus="status">
												<c:if test="${v.msType eq '3'}">
													<div class="div-2-1">
														<div class="categories">[SHOP]</div>
														<div class="date">
															<fmt:formatDate value="${v.qdate}" pattern="yyyy-MM-dd" />
														</div>
														<a href="./indivsupport5?msNum=${v.msNum}">${v.msTitle}</a>
														<div class="title">${v.msQuestion}</div>
														<td><p class="lab">${v.msStatus}</p></td>
													</div>
													<hr>
												</c:if>
											</c:forEach>
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
		</div>
	</section>
	<footer>
		<jsp:include page="./centerfooter.jsp" />
	</footer>
</body>
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

.table-stats .table-line-twitter . -social-icon {
	color: #5885b8;
}

.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
}

.regbutton1 {
	float: right;
}

.div-1>hr {
	margin-top: 20px;
}

.div-2 {
	display: inline-block;
	box-sizing: border-box;
	width: 100%;
}

.div-2-1 {
	background: white;
}

.btn-1-1 {
	margin-left: 15px;
	width: 10%;
	float: right;
}

.div-2-1>.date {
	float: right;
}

.lab {
	float: right;
	display: inline;
	padding: 0.2em 0.6em 0.3em;
	font-size: 100%;
	font-weight: 700;
	line-height: 1;
	color: black;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border-radius: 0.25em;
}
</style>

</html>