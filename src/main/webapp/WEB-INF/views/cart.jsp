<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/cart.css">
<link rel="stylesheet" href="resources/css/headercss.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/10-11.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="resources/css/headercss.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
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
<body onload="">
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section style="margin-top: 30px;">
		<c:if test="${empty cartlist}">
			<div align="center">
				<img src="./resources/images/emptybag.jpeg" alt="Product"
					width="600" style="align: center;">
				<p>Please insert items to the basket</p>
			</div>
		</c:if>
		<c:if test="${!empty cartlist}">
			<div class="container padding-bottom-3x mb-1">
				<!-- Alert-->
				<div
					class="alert alert-info alert-dismissible fade show text-center"
					style="margin-bottom: 30px;">
					<span class="alert-close" data-dismiss="alert"></span><img
						class="d-inline align-center"
						src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA1MTIuMDAzIDUxMi4wMDMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMi4wMDMgNTEyLjAwMzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxNnB4IiBoZWlnaHQ9IjE2cHgiPgo8Zz4KCTxnPgoJCTxnPgoJCQk8cGF0aCBkPSJNMjU2LjAwMSw2NGMtNzAuNTkyLDAtMTI4LDU3LjQwOC0xMjgsMTI4czU3LjQwOCwxMjgsMTI4LDEyOHMxMjgtNTcuNDA4LDEyOC0xMjhTMzI2LjU5Myw2NCwyNTYuMDAxLDY0eiAgICAgIE0yNTYuMDAxLDI5OC42NjdjLTU4LjgxNiwwLTEwNi42NjctNDcuODUxLTEwNi42NjctMTA2LjY2N1MxOTcuMTg1LDg1LjMzMywyNTYuMDAxLDg1LjMzM1MzNjIuNjY4LDEzMy4xODQsMzYyLjY2OCwxOTIgICAgIFMzMTQuODE3LDI5OC42NjcsMjU2LjAwMSwyOTguNjY3eiIgZmlsbD0iIzUwYzZlOSIvPgoJCQk8cGF0aCBkPSJNMzg1LjY0NCwzMzMuMjA1YzM4LjIyOS0zNS4xMzYsNjIuMzU3LTg1LjMzMyw2Mi4zNTctMTQxLjIwNWMwLTEwNS44NTYtODYuMTIzLTE5Mi0xOTItMTkycy0xOTIsODYuMTQ0LTE5MiwxOTIgICAgIGMwLDU1Ljg1MSwyNC4xMjgsMTA2LjA2OSw2Mi4zMzYsMTQxLjE4NEw2NC42ODQsNDk3LjZjLTEuNTM2LDQuMTE3LTAuNDA1LDguNzI1LDIuODM3LDExLjY2OSAgICAgYzIuMDI3LDEuNzkyLDQuNTY1LDIuNzMxLDcuMTQ3LDIuNzMxYzEuNjIxLDAsMy4yNDMtMC4zNjMsNC43NzktMS4xMDlsNzkuNzg3LTM5Ljg5M2w1OC44NTksMzkuMjMyICAgICBjMi42ODgsMS43OTIsNi4xMDEsMi4yNCw5LjE5NSwxLjI4YzMuMDkzLTEuMDAzLDUuNTY4LTMuMzQ5LDYuNjk5LTYuNGwyMy4yOTYtNjIuMTQ0bDIwLjU4Nyw2MS43MzkgICAgIGMxLjA2NywzLjE1NywzLjU0MSw1LjYzMiw2LjY3Nyw2LjcyYzMuMTM2LDEuMDY3LDYuNTkyLDAuNjQsOS4zNjUtMS4yMTZsNTguODU5LTM5LjIzMmw3OS43ODcsMzkuODkzICAgICBjMS41MzYsMC43NjgsMy4xNTcsMS4xMzEsNC43NzksMS4xMzFjMi41ODEsMCw1LjEyLTAuOTM5LDcuMTI1LTIuNzUyYzMuMjY0LTIuOTIzLDQuMzczLTcuNTUyLDIuODM3LTExLjY2OUwzODUuNjQ0LDMzMy4yMDV6ICAgICAgTTI0Ni4wMTcsNDEyLjI2N2wtMjcuMjg1LDcyLjc0N2wtNTIuODIxLTM1LjJjLTMuMi0yLjExMi03LjMxNy0yLjM4OS0xMC42ODgtMC42NjFMOTQuMTg4LDQ3OS42OGw0OS41NzktMTMyLjIyNCAgICAgYzI2Ljg1OSwxOS40MzUsNTguNzk1LDMyLjIxMyw5My41NDcsMzUuNjA1TDI0Ni43LDQxMS4yQzI0Ni40ODcsNDExLjU2MywyNDYuMTY3LDQxMS44NCwyNDYuMDE3LDQxMi4yNjd6IE0yNTYuMDAxLDM2Mi42NjcgICAgIEMxNjEuOSwzNjIuNjY3LDg1LjMzNSwyODYuMTAxLDg1LjMzNSwxOTJTMTYxLjksMjEuMzMzLDI1Ni4wMDEsMjEuMzMzUzQyNi42NjgsOTcuODk5LDQyNi42NjgsMTkyICAgICBTMzUwLjEwMywzNjIuNjY3LDI1Ni4wMDEsMzYyLjY2N3ogTTM1Ni43NTksNDQ5LjEzMWMtMy40MTMtMS43MjgtNy41MDktMS40NzItMTAuNjg4LDAuNjYxbC01Mi4zNzMsMzQuOTIzbC0zMy42NDMtMTAwLjkyOCAgICAgYzQwLjM0MS0wLjg1Myw3Ny41ODktMTQuMTg3LDEwOC4xNi0zNi4zMzFsNDkuNTc5LDEzMi4yMDNMMzU2Ljc1OSw0NDkuMTMxeiIgZmlsbD0iIzUwYzZlOSIvPgoJCTwvZz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K"
						width="18" height="18" alt="Medal icon"> &nbsp;&nbsp; With
					this purchase you will earn <strong id="total_point"></strong>
					Reward Points.
				</div>
				<!-- Shopping Cart-->
				<div class="table-responsive shopping-cart">
					<table class="table">
						<script>
 
			
            function itemSum() {
                var str = "";
                var sum = 0;
                var point = 0;
                var count = $(".chkbox").length;
                var chklist = "";
                for (var i = 0; i < count; i++) {
                    if ($(".chkbox")[i].checked == true) {
                        sum += parseInt($(".chkbox")[i].value);
                        chklist += $("#order"+i).attr("data-ordernum") + ",";
                    }
                }
                if(chklist.length>0) chklist = chklist.substring(0,chklist.length-1); 
                $("#orderNumlist").val(chklist);
                $("#total_sum").html(sum);
                $("#total_pay").html(sum);
                point = sum * 0.01;
                const earnedpoint = Math.trunc(point);
                $("#amount").val(sum);
                $("#total_point").html(earnedpoint);
				$("#used_point").html(0);
            }
 
       			</script>
						<thead>
							<tr>
								<th><input type="checkbox" name="allCheck" id="allCheck" /></th>
								<!-- 상품 전체선택  -->
								<script>
                                    $("#allCheck").click(function () {
                                        var chk = $("#allCheck").prop("checked");
                                        if (chk) {
                                            $(".chkbox").prop("checked", true);
                                            itemSum();
                                        } else {
                                            $(".chkbox").prop("checked", false);
                                            itemSum();
                                        }
                                    });
                       </script>
								<th>상품 이름 (옵션)</th>
								<th class="text-center">수량</th>
								<th class="text-center">가격</th>
								<th class="text-center">총 금액</th>
								<th class="text-center"><a
									class="btn btn-sm btn-outline-danger"
									href="./deleteCartProducts">삭제</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cartlist" items="${cartlist}"
								varStatus="orderidx">
								<form name="form" method="get">
									<tr>
										<td class="product-close"><input type="checkbox"
											onClick="itemSum()" class="chkbox"
											id="order${orderidx.index}"
											value="${cartlist.orderPrice * cartlist.orderQuantity}"
											data-ordernum="${cartlist.orderNum}" /></td>
										<td>
											<div class="product-item">
												<a class="product-thumb"
													href="./productInfo?pnum=${cartlist.pnum}"><img
													src="./resources/upload/${cartlist.thumbsysname}"
													alt="Product"></a>
												<div class="product-info">
													<h4 class="product-title">
														<a href="./productInfo?pnum=${cartlist.pnum}">${cartlist.productName}</a>
													</h4>
													<span><em>${cartlist.orderOption}</em></span>
												</div>
											</div>
										</td>
										<td class="text-center">
											<div class="count-input">
												<input class="form-control"
													value="${cartlist.orderQuantity}" readonly>
											</div>
										</td>
										<td class="text-center text-lg text-medium"><fmt:formatNumber
												pattern="###,###,###" value="${cartlist.orderPrice}" /> 원</td>
										<td class="text-center text-lg text-medium"><fmt:formatNumber
												pattern="###,###,###"
												value="${cartlist.orderPrice * cartlist.orderQuantity}" />
											원</td>
										<td class="text-center"><a class="remove-from-cart"
											href="./deleteCartProduct?orderNum=${cartlist.orderNum}"
											data-toggle="tooltip" title="delete"
											data-original-title="Remove item"><i class="fa fa-trash"></i></a></td>
									</tr>
								</form>
							</c:forEach>


						</tbody>
					</table>
				</div>
				<div class="shopping-cart-footer">
					<div class="column">
						<span>사용 가능 포인트 : ${mb.memberPoint}</span>
						<!-- <form class="coupon-form" method="post"> -->
						<div class="coupon-form">
							<input class="form-control form-control-sm" type="number"
								id="usedPoint" max="${mb.memberPoint}" onblur="fixPoint()"
								value="0">
							<button class="btn btn-outline-primary btn-sm"
								onclick="pointuse()">포인트 사용</button>
						</div>
						<!-- </form> -->
					</div>
					<div class="">
						총 금액: <span class="text-medium" id="total_sum"> 0 </span> 원
					</div>
					<br>
					<div class="">
						사용 포인트: <span class="text-medium" id="used_point"> 0 </span> 포인트
					</div>
					<br>
					<div class="">
						총 결제금액: <span class="text-medium" id="total_pay"> 0 </span> 원
					</div>
				</div>
				<div class="shopping-cart-footer">
					<div class="column">
						<a class="btn btn-outline-secondary" href="./toShopMain"><i
							class="icon-arrow-left"></i>&nbsp;쇼핑 계속하기</a>
					</div>
					<div class="column">
						<a class="btn btn-primary" href="./toCart" data-toast=""
							data-toast-type="success" data-toast-position="topRight"
							data-toast-icon="icon-circle-check" data-toast-title="Your cart"
							data-toast-message="is updated successfully!">다시 계산하기</a> <input
							class="btn btn-success" type="submit" onclick="buyProduct()"
							value="결제하기"> <input type="hidden" id="orderNumlist"
							value="">
					</div>
				</div>
			</div>
		</c:if>
	</section>
	<footer></footer>


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
	var url = "/deleteCartProduct";
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
					location.replace("cart")
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


function fixPoint() {
	  var x = document.getElementById("usedPoint");
	  var xv = x.value;
	  if(xv > ${mb.memberPoint}){
		  alert("${mb.memberPoint} 이상 사용할 수 없습니다.");
		  x.value = ${mb.memberPoint};
	  }	  
	}

function pointuse(){
	var vp = document.getElementById("usedPoint").value;
	var ts = $("#total_sum").html();
    
	if(vp == 0){
		alert("사용할 포인트를 입력하십시오.");
		return;
	}
	
	if(ts == 0){
		alert("구매할 상품을 선택하세요.");
		return;
	}
	
	var ls = ts - vp;
	console.log(ls);
	console.log(vp);
	$("#total_pay").html(ls);
	$("#used_point").html(vp);
}



<%--결제--%>

function buyProduct() {

	var used_point = $("#used_point").html();
	let mc_uid = 'DOG_SHOP_BUYPRODUCT_' + new Date().getTime();
    var IMP = window.IMP; 
	var payment = $("#total_pay").html();
    IMP.init('imp63603097'); 
    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : 'kakaopay',
        merchant_uid : mc_uid,
        name : 'DogShop',
        amount : payment,
        buyer_email : '${mb.memberId}',
        buyer_name : '${mb.memberId}',
        buyer_tel : '${mb.memberPnum}',
        buyer_addr : '${mb.memberAddr}',
        buyer_postcode : '인천',
        m_redirect_url : 'redirect url'
    },     
    
    function(rsp) {
        if ( rsp.success ) {
        	console.log(rsp);
            var msg = '결제가 완료되었습니다.';
            alert(msg);
            
            //var orderNum = ${"cartlist.orderNum"};
            var orderNumlist = $("#orderNumlist").val();
            console.log("orderNumlist="+orderNumlist);
            location.href="./buyProduct?orderNumList="+orderNumlist+"&mcuid="+mc_uid+"&usedPoint="+used_point;
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });

 }
    


</script>
</body>
</html>