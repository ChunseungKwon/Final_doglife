<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>패스워드 찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
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
<div class="container bootstrap snippets bootdey">
  <div class="row">

    <div class="main">

      <h3>비밀번호 찾기</h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="./idcheckfrm" class="btn btn-lg btn-primary btn-block">아이디찾기</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-info btn-block">비밀번호 찾기</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">or</span>
      </div>

      <form name="pwdcheckFrm" action="./pwdauth" method="post" onsubmit="return check()">
        <div class="mail_check_wrap">
          <label for="inputPassword">이름</label>
          <input class="form-control" id="mail_input" name="memberName" title="이름">
        </div>
        <div class="form-group" style="margin-top:20px;">
          <label for="inputPassword">이메일</label>
          <input class="form-control" id="mail_check_input" name="memberId" title="이메일">
        </div>
        <input type="submit" class="btn btn btn-primary" id="pwdcheck" value="비밀번호 수정">
      </form>
    </div>  
  </div>
</div>

<style type="text/css">
  body {
    padding-top: 15px;
    font-size: 12px
  }
  .main {
    max-width: 320px;
    margin: 0 auto;
  }
  .login-or {
    position: relative;
    font-size: 18px;
    color: #aaa;
    margin-top: 10px;
            margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -2px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
  }
  .hr-or {
    background-color: #cdcdcd;
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
  }
  h3 {
    text-align: center;
    line-height: 300%;
  }
  .pull-right{
  	margin: 3px;
  }
</style>

<script type="text/javascript">
var ckOk = false;

function check(){
	
	var frm = document.pwdcheckFrm;
	console.log(frm);
	
	var length = frm.length - 1;
	console.log(length);
	
	for(var i = 0; i < length; i++){
		if(frm[i].value == "" || frm[i].value == null){
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