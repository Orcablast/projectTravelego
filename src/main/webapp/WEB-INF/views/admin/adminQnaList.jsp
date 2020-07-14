<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="UTF-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 비 로그인시 알람 부트스트랩  -->
<script src="/src/js/jquery/jquery-3.5.1.js"></script>
<script src="/src/js/bootstrap/popper.min.js"></script>
<script src="/src/js/bootstrap/bootstrap-4.5.0.js"></script>
<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="/src/imgs/header/favicon.png" />
<!-- Place favicon.ico in the root directory -->
<script src="/src/js/fontawesome/8bd2671777.js" crossorigin="anonymous"></script>
<!-- CSS here -->
<link rel="stylesheet" href="/src/css/header/header.css" />
<link rel="stylesheet" href="/src/css/footer/footer.css" />
<link rel="stylesheet" href="/src/css/main/web_default.css" />
<title>Admin</title>
<style></style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- 웹 콘텐츠는 section 태그 안에 작성을 해주세요!-->
	<section>
		<!DOCTYPE html>
		<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<style>
.admin_page {
	font-family: "Lato", sans-serif;
}

.admin_sidebar {
	margin-top: 15%;
	height: 40%;
	width: 200px;
	position: fixed;
	top: 0;
	left: 0;
	background-color: white;
	padding-top: 60px;
}

.admin_sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
}

.admin_sidebar a:hover {
	color: #f1f1f1;
}

main .admin_sidebar {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.material-icons, .admin_title {
	vertical-align: middle;
}

.material-icons {
	margin-right: 30px
}

#Contents {
	transition: margin-left 0.5s;
	padding: 16px;
	margin-left: 250px;
}

@media screen and (max-height: 450px) {
	.admin_sidebar {
		padding-top: 15px;
	}
	.admin_sidebar a {
		font-size: 18px;
	}
}

<!--
게시물 스타일-->#container {
	width: 960px;
	margin: 0 auto;
}

#container #input-form {
	text-align: center;
}

#user-table {
	margin: 0 auto;
	text-align: center;
}

#input-form {
	margin-top: 10px;
	margin-bottom: 10px;
}

#user-table {
	border-collapse: collapse;
}

#user-table>thead>tr {
	background-color: #333;
	color: #fff;
}

#user-table>thead>tr>th {
	padding: 8px;
	width: 150px;
}

#user-table>tbody>tr>td {
	border-bottom: 1px solid gray;
	padding: 8px;
}

@media screen and (max-width: 1000px) {
	#mySidebar {
		display: none;
	}
}

</style>

<body>
	<div class="admin_page">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons" />

		<div id="mySidebar" class="admin_sidebar">
			<a href="/memberManagement.do?reqPage=1"><span
				class="admin_title" >회원 관리</span></a><a
				href="spot_managenet.do"><span class="admin_title">여행지
						관리</span></a> <a href="/adminQnaList.do" ><span class="admin_QA" style="color: black">회원문의사항</span></a>
			<a href="reportList.do"><span class="admin_title">신고글 관리</span></a>
		</div>
		<!-- 1.문의글 보여줄 것
		  	 2.보여줄때 답변이 있으면-답변완료 뜨게하기 QA값이 있으면 답변 완료 
		  	 3.답변하기 할때 insert 가 아니라 update
		  	 4.페이징 처리--오전안에 끝내기-->
		<div name="qnaContainer">
			<form role="form" method="get">

				<div class="search"
					style="padding-left: 710px; margin-bottom: 10px;">
					<select name="searchType" style="width: 100px; height: 29px;">
						<option value="n"
							<c:out value="${searchQna.searchType == null ? 'selected' : ''}"/>>선택</option>
						<option value="qnaTitle"
							<c:out value="${scri.searchType eq 'qnaTitle' ? 'selected' : ''}"/>>제목</option>
						<option value="qnaWriter"
							<c:out value="${searchQna.searchType eq 'qnaWriter' ? 'selected' : ''}"/>>작성자</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${searchQna.keyword}" />

					<button id="searchBtn" type="button">검색</button>

				</div>
				<table id="user-table" style="font-size: 0.85rem;">
					<thead>
						<tr>
							<th>문의 번호</th>
							<th>제목</th>
							<th>문의날짜</th>
							<th>작성자</th>
							<th>답변 여부</th>
							<th>답변날짜</th>
						</tr>
					</thead>
					<c:forEach items="${qnaList }" var="q">
						<tr>

							<td><a href="/anaAnswer.do?qnaNo=${q.qnaNo}"
								value="${q.qnaNo}">${q.qnaNo }</a></td>
							<td><a href="/qnaAnswer.do?qnaNo=${q.qnaNo}"
								value="${q.qnaNo}">${q.qnaTitle }</a></td>
							<td>${q.askDate }</td>
							<td>${q.qnaWriter }</td>

							<c:if test="${empty q.qnaAnswer  }">
								<td><a href="/qnaAnswer.do?qnaNo=${q.qnaNo}"
									value="${q.qnaNo}" style="color: red;">미답변</a></td>
								<td style="color: red;">X</td>
							</c:if>

							<c:if test="${!empty q.qnaAnswer}">
								<td><a href="/qnaAnswer.do?qnaNo=${q.qnaNo}"
									value="${q.qnaNo}">답변완료</a></td>
								<td>${q.answerDate }</td>
							</c:if>

						</tr>
					</c:forEach>
				</table>
				<br>
				<div name="mPage" style="text-align: center;">
					<c:if test="${pgm.prev}">
						<a href="adminQnaList.do${pgm.makeSearch(pgm.startPage - 1)}">이전</a>
					</c:if>
					<c:forEach begin="${pgm.startPage}" end="${pgm.endPage}" var="idx">
						<a href="adminQnaList.do${pgm.makeSearch(idx)}">${idx}</a>
					</c:forEach>

					<c:if test="${pgm.next && pgm.endPage > 0}">
						<a href="adminQnaList.do${pgm.makeSearch(pgm.endPage + 1)}">다음</a>
					</c:if>
				</div>

			</form>
		</div>
	</div>

	<br>



	<script>
		$(function() {
			$('#searchBtn').click(
					function() {
						self.location = "adminQnaList.do"
								+ '${pgm.makeQuery(1)}' + "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput').val());
					});
		});
	</script>
</body>

		</html>

	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<!-- Modal -->
	<div class="modal fade custom_search_pop" id="exampleModalCenter"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="serch_form">
					<input type="text" placeholder="Search" />
					<button type="submit">search</button>
				</div>
			</div>
		</div>
	</div>
	<!-- JS here -->
	<script src="/src/js/header/vendor/modernizr-3.5.0.min.js"></script>
	<!-- <script src="/src/js/header/vendor/jquery-1.12.4.min.js"></script>
	<script src="/src/js/header/popper.min.js"></script> -->
	<script src="/src/js/header/owl.carousel.min.js"></script>
	<script src="/src/js/header/isotope.pkgd.min.js"></script>
	<script src="/src/js/header/ajax-form.js"></script>
	<script src="/src/js/header/waypoints.min.js"></script>
	<script src="/src/js/header/jquery.counterup.min.js"></script>
	<script src="/src/js/header/imagesloaded.pkgd.min.js"></script>
	<script src="/src/js/header/scrollIt.js"></script>
	<script src="/src/js/header/jquery.scrollUp.min.js"></script>
	<script src="/src/js/header/wow.min.js"></script>
	<!-- 	<script src="/src/js/header/nice-select.min.js"></script> -->
	<script src="/src/js/header/jquery.slicknav.min.js"></script>
	<script src="/src/js/header/jquery.magnific-popup.min.js"></script>
	<script src="/src/js/header/plugins.js"></script>
	<script src="/src/js/header/gijgo.min.js"></script>
	<script src="/src/js/header/slick.min.js"></script>

	<!--contact js-->
	<script src="/src/js/header/contact.js"></script>
	<script src="/src/js/header/jquery.ajaxchimp.min.js"></script>
	<script src="/src/js/header/jquery.form.js"></script>
	<script src="/src/js/header/jquery.validate.min.js"></script>
	<script src="/src/js/header/mail-script.js"></script>
	<script src="/src/js/header/main.js"></script>
	<script>
		$(function() {
			$('[data-toggle="popover"]').popover();
		});

		$("#datepicker").datepicker({
			iconsLibrary : "fontawesome",
			icons : {
				rightIcon : "_$tag___________________________$tag__",
			},
		});
	</script>
</body>
</html>
