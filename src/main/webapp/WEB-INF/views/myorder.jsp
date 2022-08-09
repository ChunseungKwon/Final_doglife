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
<link rel="stylesheet" href="resources/css/headercss.css">
<link href="resources/css/shopstyle.css" rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section>

		<div class="container bootstrap snippets bootdey">
			<div class="row profile">
				<jsp:include page="./sideBar.jsp"></jsp:include>

				<!-- column 2 -->
				<a href="#"><strong><i
						class="glyphicon glyphicon-dashboard"></i>&nbsp;주문내역</strong></a>
				<hr>
				<div>
					<div class="col-md-9" id="contentCol">
						<div class="profile-content">
							<div class="col-lg-12">
								<div class="main-box clearfix">
									<div class="table-responsive">
										<table class="table user-list">
											<thead>
												<tr>
													<th>&nbsp;</th>
													<th><span>판매상품 (선택옵션)</span></th>
											 		<th><span style="width:55px;">수량</span></th>
													<th><span style="width:65px;">결제액</span></th>
													<th><span style="width:80px;">결제날짜</span></th>
													<th class="text-center"><span>상태</span></th>
													<th>&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${empty oList}">nothing!!</c:if>
												<c:if test="${!empty oList}">
													<c:forEach var="oList" items="${oList}">
														<tr>
															<td><img alt="Product" width="75px"
																src="./resources/upload/${oList.thumbsysname}"></a></td>
															<td><a href="./productInfo?pnum=${oList.pnum}"
																class="pname">${oList.productName}</a> <span
																class="user-subhead">${oList.orderOption}</span></td>
															<td class="text-center"><span class="">${oList.orderQuantity}</span>
															</td>
															<td><fmt:formatNumber
																	value="${oList.orderQuantity*oList.orderPrice}"
																	type="number" /></td>

															<td><fmt:formatDate value="${oList.orderDate}"
																	pattern="yyyy-MM-dd" /></td>
															<td class="text-center"><span
																class="label label-default">${oList.orderStatus}</span></td>
															<td style="width: 20%;"><a
																href="./productInfo?pnum=${oList.pnum}"
																class="table-link">상세보기 <span class="fa-stack">
																		<i class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
																</span>
															</a> <br> <a href="./productReview?pnum=${oList.pnum}"
																class="table-link">후기작성 <span class="fa-stack">
																		<i class="fa fa-square fa-stack-2x"></i> <i
																		class="fa fa-pencil fa-stack-1x fa-inverse"></i>
																</span>
															</a></td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
										${pageHtml}
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</section>





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






</body>

</html>