<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="resources/css/headercss.css">
</head>
<style type="text/css">
#faq-title {
	box-sizing: border-box;
	text-align: center;
	margin-top: 30px;
	font-size: 25px;
}

.box-faq {
	box-sizing: border-box;
	text-align: center;
	margin-top: 30px;
}

.but-area {
	text-align: center;
	padding: 5px;
	height: 50px;
	line-height: 50px;
	margin: 0px auto;
	width: 300px;
}

.answer {
	display: none;
	padding-bottom: 30px;
}

.faq-content {
	border-bottom: 1px solid #e0e0e0;
	width: 50%;
	text-align: left;
	margin: 0 auto;
}

.question {
	font-size: 19px;
	padding: 30px 0;
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	width: 100%;
	text-align: left;
}

.question:hover {
	color: #2962ff;
}

.question-1 {
	font-size: 19px;
	padding: 30px 0;
	cursor: pointer;
	border: none;
	outline: none;
	background: none;
	width: 100%;
	text-align: left;
}

.question-1:hover {
	color: #2962ff;
}

[id$="-toggle"] {
	margin-right: 15px;
}

.hr {
	width: 50%;
	margin:auto;
}
</style>

<body>
	<header>
		<jsp:include page="centerheader.jsp" />
	</header>
	<section>

		<div class="box-faq">
			<span id="faq-title">입양(FAQ)</span>
			<c:forEach var="aitem" items="${flist}" varStatus="status">
				<c:if test="${aitem.faqType eq '1'}">
					<div class="faq-content">
						<button class="question" id="que${status.count}">
							<span id="que-toggle">Q:</span><span>${aitem.faqQuestion}</span>
						</button>
						<div class="answer" id="ans${status.count}">A:&nbsp;${aitem.faqAnswer}</div>
					</div>
				</c:if>
			</c:forEach>
			<hr class="hr">
			<div class="box-faq">
				<span id="faq-title">장례(FAQ)</span>
				<c:forEach var="fitem" items="${flist}" varStatus="status">
					<c:if test="${fitem.faqType eq '2'}">
						<div class="faq-content">
							<button class="question-1" id="q-1${status.count}">
								<span id="q-1-toggle">Q:</span><span>${fitem.faqQuestion}</span>
							</button>
							<div class="answer" id="a-1${status.count}">A:&nbsp;${fitem.faqAnswer}</div>
						</div>
					</c:if>
				</c:forEach>
				<hr class="hr">
				<div class="box-faq">
					<span id="faq-title">SHOP(FAQ)</span>
					<c:forEach var="fitem" items="${flist}" varStatus="status">
						<c:if test="${fitem.faqType eq '3'}">
							<div class="faq-content">
								<button class="question-1" id="q-2${status.count}">
									<span id="q-1-toggle">Q:</span><span>${fitem.faqQuestion}</span>
								</button>
								<div class="answer" id="a-2${status.count}">A:&nbsp;${fitem.faqAnswer}</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
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
		console.log(1);
	} else if (id != "" && type == 1) {
		$(".suc").css("display", "none");
		$(".bef").css("display", "inline-block");
		$(".mypage").css("display", "inline-block");
		$(".seller").css("display", "none");
		$(".admin").css("display", "none");
		console.log(2);
	}
	else if (id != "" && type == 2) {
		$(".suc").css("display", "none");
		$(".bef").css("display", "inline-block");
		$(".mypage").css("display", "none");
		$(".seller").css("display", "inline-block");
		$(".admin").css("display", "none");
		console.log(3);
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
  var items = document.querySelectorAll('.question');

  function openCloseAnswer() {
    var answerId = this.id.replace('que', 'ans');

    if(document.getElementById(answerId).style.display === 'block') {
      document.getElementById(answerId).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer));
  
  var items = document.querySelectorAll('.question-1');

  function openCloseAnswer2() {
    var answerId2 = this.id.replace('q', 'a');

    if(document.getElementById(answerId2).style.display === 'block') {
      document.getElementById(answerId2).style.display = 'none';
      document.getElementById(this.id + '-toggle').textContent = '+';
    } else {
      document.getElementById(answerId2).style.display = 'block';
      document.getElementById(this.id + '-toggle').textContent = '-';
    }
  }

  items.forEach(item => item.addEventListener('click', openCloseAnswer2));
</script>
</html>