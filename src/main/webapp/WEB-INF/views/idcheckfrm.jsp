<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>아이디 찾기</title>
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

      <h3>ID 찾기</h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="./idcheckfrm" class="btn btn-lg btn-primary btn-block">아이디찾기</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="./pwdcheckfrm" class="btn btn-lg btn-info btn-block">비밀번호 찾기</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">or</span>
      </div>

      <form id="idsearch1">
        <div class="form-group">
          <label for="inputUsernameEmail">이름</label>
          <input type="text" class="form-control" id="memberName">
        </div>
        <div class="form-group">
          <label for="inputPassword">연락처</label>
          <input type="text" class="form-control" id="memberPnum">
        </div>
        <input type="button" class="btn btn btn-primary" value="아이디찾기" onclick="idsearch2()">
        <span id="mail_check_input_box_warn1"></span>
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
</style>

<script type="text/javascript">
function idsearch2(){
	
	
	var memberName= $("#memberName").val();
    var memberPnum= $("#memberPnum").val();
	
$.ajax({
    type:"POST",
    url:"./find_id",
    data:{
    	"memberName":memberName,"memberPnum":memberPnum
    },
    success:function(result){
    if(result == 0){
    		alert("회원 정보를 확인해주세요");
    		$("#memberName").val('');
    		$("#memberPnum").val('');
    }
    else{
    	alert(result+"입니다");
		$("#memberName").val('');
		$("#memberPnum").val('');
    }
    },
    error:function(error){
    	alert("전송 실패");
    	console.log(error);
    }
 });
};
</script>
</body>
</html>