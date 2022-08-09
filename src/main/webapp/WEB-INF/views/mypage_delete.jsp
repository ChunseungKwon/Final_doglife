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
<link rel="stylesheet" href="resources/css/headercss.css">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<title>Insert title here</title>
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

.button1 {
	padding: 10px 20px;
	margin-right: 30px;
}

.memberup {
	border-radius: 10px;
	width: 400px;
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

#passwordCheckmsg {
	color: red;
}
</style>
</head>
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
									<a><i class="glyphicon glyphicon-dashboard"></i> 회원 정보 수정</a>

									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<form name="deletefrm" action="./updateAd" method="post"
				onsubmit="return check()">
				<div class="wrap">
					<div class="mem1">
						<Strong>아이디</Strong> <input type="text" class="memberup"
							name="memberId" id="memberId" value="${memberId}" readonly>
					</div>
					<div class="mem1">
						<Strong>비밀번호</Strong> <input type="password" class="memberup"
							name="uppassword" id="uppassword" onkeyup="passwordCheck();"
							title="비밀번호">
					</div>
					<div class="mem1">
						<Strong>비밀번호확인</Strong> <input type="password" class="memberup"
							name="uppassword1" id="uppassword1" onkeyup="passwordCheck();">
						<div style="display: none" class="mem1" id="passwordCheckmsg"
							title="비밀번호"></div>
					</div>

					<input type="submit" value="탈퇴" id="pwdcheck" class="button1">
				</div>
			</form>
		</div>
	</section>

	<script type="text/javascript">
		function passwordCheck() {
			var password = $("#uppassword").val();
			var password1 = $("#uppassword1").val();

			if (password != password1) {
				$("#passwordCheckmsg").show();
				$("#passwordCheckmsg").html("비밀번호가 일치하지않습니다");
				$("#pwdcheck").attr('disabled', true);
			} else {
				$("#passwordCheckmsg").show();
				$("#passwordCheckmsg").html("비밀번호가 일치합니다.");
				$("#pwdcheck").attr('disabled', false);
			}
		}
	</script>
	<script type="text/javascript">
		var ckOk = false;

		function check() {

			var frm = document.deletefrm;
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