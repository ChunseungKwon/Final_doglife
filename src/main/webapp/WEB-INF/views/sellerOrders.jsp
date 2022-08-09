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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/headercss.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="resources/css/mysellerpage.css" />
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
		<jsp:include page="shopHeader.jsp" />
	</header>
	<section>
		<div class="container bootstrap snippets bootdey">
			<div class="row profile">
				<jsp:include page="./sellerSideBar.jsp"></jsp:include>


				<!-- column 2 -->
				<a href="#"><strong><i
						class="glyphicon glyphicon-dashboard"></i> 주문목록관리</strong></a>
				<hr>
				<div>
					<div class="col-md-9" id="contentCol">
						<div class="profile-content">
							<div class="col-lg-12">
								<div class="main-box clearfix">
									<div class="table-responsive">
										<ul class="nav nav-pills nav-stacked">
											<li><i class="glyphicon glyphicon-list-alt"></i> 결제완료 </a></li>
										</ul>
										<section>
											<table class="table user-list">
												<thead>
													<tr>
														<th><span  style="width:55px;">번호</span></th>
														<th>&nbsp;</th>
														<th><span>판매상품 (선택옵션)</span></th>
														<th><span  style="width:55px;">수량</span></th>
														<th><span style="width:55px;">가격</span></th>
														<th><span  style="width:80px;">결제날짜</span></th>
														<th class="text-center"><span style="width:55px;">상태</span></th>
													</tr>
												</thead>
												<tbody>

													<c:if test="${empty oList}">결제된 상품이 없습니다.</c:if>
													<c:if test="${!empty oList}">
														<c:forEach var="oList" items="${oList}">
															<input type="hidden" name="orderNum"
																value="${oList.orderNum}">
															<tr>
																<td class="text-center"><span
																	id="num${status.index}">${oList.orderNum}</span></td>
																<td><img alt="Product" width="75px"
																	src="./resources/upload/${oList.thumbsysname}"></td>
																<td><a href="./productInfo?pnum=${oList.pnum}"
																	class="pname">${oList.productName}</a> <span
																	class="user-subhead">${oList.orderOption}</span></td>
																<td class="text-center"><span class="">${oList.orderQuantity}</span></td>
																<td><fmt:formatNumber value="${oList.orderPrice}"
																		type="number" /></td>
																<td><fmt:formatDate value="${oList.orderDate}"
																		pattern="yyyy-MM-dd" /></td>
																<td class="text-center">
																	<div class="deliveryChange">
																		<a href="./deliverOrder?orderNum=${oList.orderNum}"><button
																				type="button" class="delivery1_btn">배송</button></a> <a
																			href="./refundOrder?orderNum=${oList.orderNum}"><button
																				type="button" class="delivery2_btn">환불</button></a>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:if>


												</tbody>
											</table>
										</section>
										<section>
											<ul class="nav nav-pills nav-stacked">
												<li><i class="glyphicon glyphicon-list-alt"></i>배송완료</a></li>
											</ul>
											<table class="table user-list">
												<thead>
													<tr>
														<th><span  style="width:55px;">번호</span></th>
														<th>&nbsp;</th>
														<th><span>판매상품 (선택옵션)</span></th>
														<th><span  style="width:55px;">수량</span></th>
														<th><span style="width:55px;">가격</span></th>
														<th><span  style="width:80px;">결제날짜</span></th>
														<th class="text-center"><span style="width:55px;">상태</span></th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty dList}">배송상품이 없습니다.</c:if>
													<c:if test="${!empty dList}">
														<c:forEach var="dList" items="${dList}">
															<tr>
																<td class="text-center"><span
																	id="num${status.index}">${dList.orderNum}</span></td>
																<td><img alt="Product" width="75px"
																	src="./resources/upload/${dList.thumbsysname}"></td>
																<td><a href="./productInfo?pnum=${dList.pnum}"
																	class="pname">${dList.productName}</a> <span
																	class="user-subhead">${dList.orderOption}</span></td>
																<td class="text-center"><span class="">${dList.orderQuantity}</span></td>
																<td><fmt:formatNumber value="${dList.orderPrice}"
																		type="number" /></td>
																<td><fmt:formatDate value="${dList.orderDate}"
																		pattern="yyyy-MM-dd" /></td>
																<td class="text-center">
																	<div class="deliveryChange">
																		<button class="delivery1_btn" style="min-width: max-content;">배송완료</button>
																		<a href="./refundOrder?orderNum=${dList.orderNum}"><button
																				type="text" class="delivery2_btn">환불</button></a>
																	</div>
																</td>
															</tr>

														</c:forEach>
													</c:if>

												</tbody>
											</table>
										</section>
										<section>
											<ul class="nav nav-pills nav-stacked">
												<li><i class="glyphicon glyphicon-list-alt" style="min-width: max-content;"></i> 환불완료 </a></li>
											</ul>
											<table class="table user-list">
												<thead>
													<tr>
														<th><span  style="width:55px;">번호</span></th>
														<th>&nbsp;</th>
														<th><span>판매상품 (선택옵션)</span></th>
														<th><span  style="width:55px;">수량</span></th>
														<th><span style="width:55px;">가격</span></th>
														<th><span  style="width:80px;">결제날짜</span></th>
														<th class="text-center"><span style="width:55px;">상태</span></th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty refundList}">환불처리된 상품이 없습니다.</c:if>
													<c:if test="${!empty refundList}">
														<c:forEach var="refundList" items="${refundList}">
															<tr>
																<td class="text-center"><span
																	id="num${status.index}">${refundList.orderNum}</span></td>
																<td><img alt="Product" width="75px"
																	src="./resources/upload/${refundList.thumbsysname}"></td>
																<td><a href="./productInfo?pnum=${refundList.pnum}"
																	class="pname">${refundList.productName}</a> <span
																	class="user-subhead">${refundList.orderOption}</span></td>
																<td class="text-center"><span class="">${refundList.orderQuantity}</span></td>
																<td><fmt:formatNumber
																		value="${refundList.orderPrice}" type="number" /></td>
																<td><fmt:formatDate value="${refundList.orderDate}"
																		pattern="yyyy-MM-dd" /></td>
																<td class="text-center">
																	<div class="deliveryChange">
																		<button class="delivery1_btn" style="min-width: max-content;">환불완료</button>
																	</div>
																</td>
															</tr>
														</c:forEach>
													</c:if>

												</tbody>
											</table>
										</section>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
			</div>
			<hr>
		</div>
	</section>
	<footer></footer>


	<!-- /Main -->
	<script type="text/javascript">
		
	<%-- 삭제 버튼 --%>
		function pdeleteValue() {
			var url = "/admin/pdelete";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");

			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					console.log(valueArr);
					valueArr.push(list[i].value);
				}
			}
			if (valueArr.length == 0) {
				alert("There's no item selected.")
			} else {
				var check = confirm = ("Really? You wanna delete this? You cannot undo this!");

				$.ajax({
					url : url,
					type : 'post',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(jadata) {
						if (jdata = 1) {
							alert("Deleted!");
							location.replace("productlist")
						} else {
							alert("failed to delete");
						}
					},
					error : function(error) {
						alert(JSON.stringify(error));
					}
				});
			}
		};

		$("#sent").on("change", function() {
			console.log("변경~~");
			var elm = $(this).next();
			var v = $(this).val();
			elm.val(v);
		});

		var b = $("#sabtn");
		console.log(b);
		$(document).on(
				"click",
				"#sabtn",
				function() {
					var idx = $(this).attr("t_data");
					//console.log(idx);
					var numValue = $("#num" + idx).text();
					console.log(numValue);
					var selValue = $("#sent" + idx).val();
					console.log(selValue);
					if (selValue == "") {
						alert("상태변경 값을 선택하세요.");
						return;
					}

					location.href = "./updateOrderStatus?orderNum=" + numValue
							+ "&orderStatus=" + selValue;
				});
	</script>
</body>
</html>