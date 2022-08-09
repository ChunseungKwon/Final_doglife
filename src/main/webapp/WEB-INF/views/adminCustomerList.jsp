<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<link rel="stylesheet" href="resources/css/common.css">
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
<title>후기 작성</title>
<style>
section {
	margin-top: 80px;
}

.all-elements {
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}

/* ul {
	margin-right: 30px;
	list-style: none;
	min-width: 180px;
}

li {
	padding: 10px;
	text-align: center;
} */

table {
	margin: auto;
	/*이 부분 고치기*/
	width: 100%;
	/*이 부분 고치기*/
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.search-bar {
	text-align: right;
	margin-right: 20px;
}

span {
	margin: auto;
}

th {
	text-align: center;
}

td {
	text-align: center;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

button {
	padding: 3px 10px;
	border-radius: 5px;
	border: 0.5px solid #444444;
}

</style>
</head>

<body>
	<header>
		<jsp:include page="./centerheader.jsp" />
	</header>

	<section>
		<div class="container bootstrap snippets bootdey">
			<div class="row mother">
				<jsp:include page="./adminSideBar.jsp" />
				<div class="col-md-9">
					<div class="div-1">
						<a><strong><i
								class="glyphicon glyphicon-dashboard"></i>회원 목록 관리</strong></a>													
						<hr>											
					</div>
					<div class="search-bar" style="margin-bottom: 20px;">
						<select id="categories">
							<option value="memberId">아이디</option>
							<option value="memberName">이름</option>
							<option value="memberPnum">연락처</option>
							<option value="memberAddr">주소</option>
						</select> <input type="text" id="keyword">
						<button id="search">검색</button>
					</div>
					<table>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>연락처</th>
							<th>주소</th>
							<th></th>
						</tr>
						<c:forEach var="c" items="${mList}">
							<tr style="margin-bottom:5px
							
							
							">
								<td>${c.memberId}</td>
								<td>${c.memberName}</td>
								<td>${c.memberPnum}</td>
								<td>${c.memberAddr}</td>
								<td><button id="delete" onclick="deleteinfo('${c.memberId}');">삭제</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>

	<script>
		function deleteinfo(memberId) {
			console.log(memberId);

			var conf = confirm("삭제하시겠습니까?");

			if (conf == true) {
				location.href = "./memberDelete?memberId=" + memberId;
			}
		}

		$("#search").click(
				function() {
					var keyword = $("#keyword").val();
					if (keyword == "") {
						return;
					}

					var categories = $("#categories").val();
					console.log(categories, keyword);
					location.href = "./mManagement?colname=" + categories
							+ "&keyword=" + keyword;

				});
	</script>
</body>
</html>