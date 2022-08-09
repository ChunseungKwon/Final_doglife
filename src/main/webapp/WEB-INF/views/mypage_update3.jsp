<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.mem2 {
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

p {
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

Strong {
	display: inline-block;
	width: 120px;
	text-align: left;
}

.memberup {
	border-radius: 10px;
	width: 400px;
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


			<form name="updateform" action="./updateAd1" method="post"
				onsubmit="return check()">
				<div class="wrap">
					<div class="mem1">
						<strong>아이디</strong> <input type="text" class="memberup"
							name="memberId" id="customerID" value="${mb.memberId}" readonly>
					</div>
					<div class="mem1">
						<strong>비밀번호</strong> <input type="password" class="memberup"
							name="memberPwd" id="customerPwd" onkeyup="passwordCheck();"
							title="비밀번호">
					</div>
					<div class="mem1">
						<strong>비밀번호 확인</strong> <input type="password" class="memberup"
							name="uppassword1" id="uppassword1" onkeyup="passwordCheck();"
							title="비밀번호 확인">
						<div style="display: none" class="mem1" id="passwordCheckmsg"></div>
					</div>
					<div class="mem1">
						<strong>이름</strong> <input type="text" class="memberup"
							name="memberName" id="customerName" value="${mb.memberName}"
							readonly>
					</div>
					<div class="mem1">
						<strong>연락처</strong> <input type="text" class="memberup"
							name="memberPnum" id="customerPnum" value="${mb.memberPnum}">
					</div>
					<div class="mem1">
						<strong>주소</strong> <input type="text" class="memberup"
							name="memberAddr" id="customerAddr" value="${mb.memberAddr}">
					</div>
					<div class="mem1">
						<strong>생년월일</strong> <input type="text" class="memberup"
							name="memberBdate" id="customerBdate" value="${mb.memberBdate}"
							readonly>
					</div>
					<input type="submit" value="수정" id="update" class="button1">
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
				$("#passwordCheckmsg").show();
				$("#passwordCheckmsg").html("비밀번호가 일치하지않습니다");
				$("#update").attr('disabled', true);
			} else {
				$("#passwordCheckmsg").show();
				$("#passwordCheckmsg").html("비밀번호가 일치합니다.");
				$("#update").attr('disabled', false);
			}
		}
	</script>
	<script type="text/javascript">
		var ckOk = false;

		function check() {

			var frm = document.updateform;
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