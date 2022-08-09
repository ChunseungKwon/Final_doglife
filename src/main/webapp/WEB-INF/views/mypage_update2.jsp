<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>개인정보 수정 페이지</title>
<style type="text/css">
.mem1 {
	padding: 20px;
	margin-right: 10px;
}

.wrap {
	text-align: center;
}

.col-md-3 {
	float: left;
	height: 10px;
}

Strong {
	display: inline-block;
	width: 120px;
	text-align: left;
}

.button1 {
	padding: 5px 15px;
	margin-right: 30px;
	border-radius: 10px;
	color: #fff;
	background-color: #5bc0de;
	border-color: #46b8da;
}

.memberup {
	border-radius: 10px;
	width: 400px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>
	<section>
		<div class="container bootstrap snippets bootdey">
			<jsp:include page="./sideBar.jsp"></jsp:include>
			<div class="col-md-9">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="main-box clearfix">
								<div class="table-responsive">
									<a><i class="glyphicon glyphicon-dashboard"></i> 회원정보</a>

									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- main -->
			<form action="./updateAd1" method="post">
				<div class="wrap">
					<div class="mem1">
						<strong>아이디</strong> <input type="text" class="memberup"
							name="memberId" id="customerID" value="${mDto.memberId}" readonly>
					</div>
					<div class="mem1">
						<strong>비밀번호</strong> <input type="password" class="memberup"
							name="memberPwd" id="customerPwd" value="${mDto.memberPwd}"
							readonly>
					</div>
					<div class="mem1">
						<strong>비밀번호 확인</strong> <input type="password" class="memberup"
							name="uppassword1" id="uppassword1" value="${mDto.memberPwd}"
							readonly>
						<h7 style="color: red;" id="passwordCheckmsg"></h7>
					</div>
					<div class="mem1">
						<strong>이름</strong> <input type="text" class="memberup"
							name="memberName" id="customerName" value="${mDto.memberName}"
							readonly>
					</div>
					<div class="mem1">
						<strong>연락처</strong> <input type="text" class="memberup"
							name="memberPnum" id="customerPnum" value="${mDto.memberPnum}"
							readonly>
					</div>
					<div class="mem1">
						<strong>주소</strong> <input type="text" class="memberup"
							name="memberAddr" id="customerAddr" value="${mb.memberAddr}"
							readonly>
					</div>
					<div class="mem1">
						<strong>생년월일</strong> <input type="text" class="memberup"
							name="memberBdate" id="customerBdate" value="${mb.memberBdate}"
							readonly>
					</div>
					<input type="button" value="탈퇴" id="deletead" class="button1"
						onclick="location.href='./mypage_delete'"> <input
						type="button" value="수정" id="update" class="button1"
						onclick="location.href='./mypage_update3'">
				</div>
				<hr>
			</form>
		</div>
	</section>

	<script type="text/javascript">
		function passwordCheck() {
			var password = $("#customerPwd").val();
			var password1 = $("#uppassword1").val();

			if (password != password1) {
				$("#passwordCheckmsg").html("비밀번호가 일치하지않습니다");
				$("#pwdcheck").attr('disabled', true);
			} else {
				$("#passwordCheckmsg").html("비밀번호가 일치합니다.");
				$("#pwdcheck").attr('disabled', false);
			}
		}
	</script>
	<script type="text/javascript">
		var ckOk = false;

		function check() {

			var frm = document.upfrm;
			console.log(frm);

			var length = frm.length - 1;
			console.log(length);

			for (var i = 0; i < length; i++) {
				if (frm[i].value == "" || frm[i].value == null) {
					alert(frm[i].title + "입력");
					frm[i].focus();
					return false;
				}
			}

			return true;
		}
	</script>
</body>
</html>