<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>Form register inside narrow jumbotron - Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/js/reactHeader.js"></script>
	<link rel="stylesheet" type="text/css"
		href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
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
	<section>
	<div class="container bootstrap snippets bootdey" 
			style="box-sizing: border-box; padding: 30px; margin-bottom: 30px; color: inherit;">
		<div class="jumbotron text-center"
			style="min-height: 650px; height: auto;">
			<div class="col-md-10 col-md-offset-2">
				<form name="joinFrm" class="form-horizontal" role="form"
					action="./memInsert" method="post"
					onsubmit="return passwordCheck()">
					<div class="form-group text-center">
						<div class="col-sm-10 reg-icon">
							<span class="fa fa-user fa-3x">회원가입</span>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="email" title="아이디" name="memberId"
								class="form-control" id="mid" placeholder="이메일 주소를 입력해주세요"
								required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="button" class="idcheck-btn" value="중복확인"
								onclick="idcheck()">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" title="비밀번호" class="form-control"
								name="memberPwd" onkeyup="passwordCheck();" id="customerPwd1"
								placeholder="패스워드" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" title="비밀번호체크" class="form-control"
								onkeyup="passwordCheck();" id="customerPwd2"
								placeholder="패스워드 확인" required>
							<td><h6 style="color: red;" id="passwordCheckmsg"></h6></td>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" title="이름" name="memberName"
								class="form-control" placeholder="이름" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
								<button type="button"
									style="background-color: #50bcdf; color: white;"
									class="form-control" onClick="goPopup();">주소검색</button>
							<input type="text" class="form-control" name="memberAddr"
								id="customerAddr" placeholder="주소검색 버튼을 눌러 주세요." title="이메일"
								required readonly>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" title="연락처" name="memberPnum"
								class="form-control" placeholder="(010-1234-5678) 연락처" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="text" title="생년월일" name="memberBdate"
								class="form-control" placeholder="(0000-01-01) 생년월일" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10">
							<input type="submit" class="btn btn-info" id="admin" value="가입">
							<input type="hidden" name="memberType" value="1">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</section>

	<style type="text/css">
.jumbotron label {
	font-size: 12px;
}
.jumbotron{
	background-color: white;
}
.reg-icon {
	color: #5bc0de;
	font-weight: bold;
	text-shadow: 2px 2px 0px rgba(0, 0, 0, 0.4) !important;
}

.nav-pills>li.active>a, .nav-pills>li.active>a:hover, .nav-pills>li.active>a:focus
	{
	color: #fff;
	background-color: #5bc0de;
}

.prj-name {
	font-weight: bold;
	color: #5bc0de;
}

.idcheck-btn {
	display: block;
	width: 98%;
	padding: 10px 16px;
	font-size: 12px;
	line-height: 1;
	border-radius: 6px;
	background-color: #50bcdf;
	border-color: #50bcdf;
	margin: 2px auto;
	color: #fff;
}
</style>

	<script type="text/javascript">
		var ckOk = false;

		function idcheck() {
			var inId = $("#mid").val();

			if (inId == "") {
				alert("아이디를 입력하세요.");
				$("#mid").focus();
				return;
			}

			var email = $("#mid").val();
			var exptext = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[com]{3}$/;

			if (exptext.test(email) == false) {
				console.log(email);
				alert("이메일형식이 올바르지 않습니다.");

				$("#mid").focus();

				return false;
			}

			var ckObj = {
				"mid" : inId
			};
			console.log(ckObj);

			$.ajax({
				url : "./idCheck",
				type : "get",
				data : ckObj,
				success : function(result) {
					console.log(result);
					if (result == "ok") {
						alert("아이디 사용 가능");
						ckOk = true;
					} else {
						alert("사용할 수 없는 아이디");
						$("#mid").val("");
						$("#mid").focus();
						ckOk = false;
					}
				},
				error : function(error) {
					console.log(error);
					ckOk = false;
				}
			});
		}

		function passwordCheck() {
			var customerPwd1 = $("#customerPwd1").val();
			var customerPwd2 = $("#customerPwd2").val();

			if (customerPwd1 != customerPwd2) {
				$("#passwordCheckmsg").html("비밀번호가 서로 일치하지않습니다.");
				$("#admin").attr('disabled', true);
			} else {
				$("#passwordCheckmsg").html("비밀번호가 일치합니다.");
				$("#admin").attr('disabled', false);
			}
			return true;
		}

		//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";

		function goPopup() {
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("/db/jusoPopup", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");

			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
			//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.joinFrm.memberAddr.value = roadFullAddr;

			//$("#frAddr").val(roadFullAddr);

		}
	</script>
</body>
</html>