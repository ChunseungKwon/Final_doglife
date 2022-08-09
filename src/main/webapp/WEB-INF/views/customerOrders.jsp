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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
</head>

<body>
	<!-- Header -->
	<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
		<div class="container bootstrap snippets bootdey">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-toggle"></span>
				</button>
				<a class="navbar-brand" href="#">Seller Page</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">

					<li class="dropdown"><a class="dropdown-toggle" role="button"
						data-toggle="dropdown" href="#"> <i
							class="glyphicon glyphicon-user"></i> Seller <span class="caret"></span></a>
						<ul id="g-account-menu" class="dropdown-menu" role="menu">
							<li><a href="#">My Profile</a></li>
							<li><a href="#"><i class="glyphicon glyphicon-lock"></i>
									Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /Header -->

	<!-- Main -->
	<div class="container bootstrap snippets bootdey">

		<!-- upper section -->
		<div class="row">
			<div class="col-md-3">
				<!-- left -->
				<a href="#"><strong><i
						class="glyphicon glyphicon-briefcase"></i> 판매자 관리 페이지</strong></a>
				<hr>

				<ul class="nav nav-pills nav-stacked">
					<li><a href="./sellerPage"><i
							class="glyphicon glyphicon-flash"></i> 판매물품관리 </a></li>
					<li><a href="./toSellerOrders"><i
							class="glyphicon glyphicon-link"></i> 주문내역관리</a></li>
					<li><a href="./toSellerQna"><i
							class="glyphicon glyphicon-list-alt"></i> Q&A 관리</a></li>
				</ul>

				<hr>

			</div>
			<!-- /span-3 -->
			<div class="col-md-9">
				<!-- column 2 -->
				<a href="#"><strong><i
						class="glyphicon glyphicon-dashboard"></i> 판매물품관리</strong></a>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="main-box clearfix">
								<div class="table-responsive">
									<table class="table user-list">
										<thead>
											<tr>
												<th><span>판매제품</span></th>
												<th><span>가격</span></th>
												<th><span>결제날짜</span></th>
												<th class="text-center"><span>상태</span></th>

												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty orderList}">nothing!!</c:if>
											<c:if test="${!empty orderList}">
												<c:forEach var="oList" items="${orderList}">
													<tr>
														<td><a href="./productInfo?pnum=${oList.pnum}"> 
															<img alt="Product" width="20px" src="./resources/upload/${oList.thumbsysname}"></a> 
															<a href="#" class="pname">${oList.productName}</a>
															<span class="user-subhead">${oList.earnedPoint}</span></td>
														<td>${oList.orderPrice}</td>
														<td><fmt:parseDate value="${oList.orderDate}" pattern="yyyy-MM-dd"/></td>
														<td class="text-center"><span
															class="label label-default">${oList.orderStatus}</span></td>
														<td style="width: 20%;"><a href="#"
															class="table-link"> <span class="fa-stack"> <i
																	class="fa fa-square fa-stack-2x"></i> <i
																	class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
															</span>
														</a> <a href="#" class="table-link"> <span
																class="fa-stack"> <i
																	class="fa fa-square fa-stack-2x"></i> <i
																	class="fa fa-pencil fa-stack-1x fa-inverse"></i>
															</span>
														</a> <a href="#" class="table-link danger"> <span
																class="fa-stack"> <i
																	class="fa fa-square fa-stack-2x"></i> <i
																	class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
															</span>
														</a></td>
													</tr>
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
	
	<!-- /Main -->
	<script type="text/javascript">
<%-- 전체 선택 기능 --%>
function allCheck(chkall){
	const checkboxes = document.getElementsByName("RowCheck");
	console.log("check all boxes" + checkboxes);
	checkboxes.forEach((checkbox) => {
		checkbox.checked = chkall.checked;
	})
};
<%-- 삭제 버튼 --%>
function pdeleteValue(){
	var url = "/admin/pdelete";
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	
	for(var i = 0; i<list.length; i++){
		if(list[i].checked){
			console.log(valueArr);
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("There's no item selected.")
	}
	else{
		var check = confirm=("Really? You wanna delete this? You cannot undo this!");
		
		$.ajax({
			url: url,
			type: 'post',
			traditional: true,
			data: {
				valueArr: valueArr
			},
			success: function(jadata){
				if(jdata = 1){
					alert("Deleted!");
					location.replace("productlist")
				}
				else{
					alert("failed to delete");
				}
			},
			error: function(error){
				alert(JSON.stringify(error));
			}
		});
	}
};






</script>





	<style type="text/css">
body {
	margin-top: 20px;
}
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