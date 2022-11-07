<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Qna</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<!-- CSS ========================= -->
<!--bootstrap min css-->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!--owl carousel min css-->
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<!--slick min css-->
<link rel="stylesheet" href="assets/css/slick.css">
<!--magnific popup min css-->
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<!--font awesome css-->
<link rel="stylesheet" href="assets/css/font.awesome.css">
<!--ionicons css-->
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<!--7 stroke icons css-->
<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
<!--animate css-->
<link rel="stylesheet" href="assets/css/animate.css">
<!--jquery ui min css-->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css">
<!--plugins css-->
<link rel="stylesheet" href="assets/css/plugins.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="assets/css/style.css">
<!--modernizr min js here-->
<script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>
<!--jquery min js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
.table-responsive table tbody tr td {
	text-align: left !important;
}
textarea{
	width : 100%;
	height : 150px;
}
</style>
</head>

<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
	<script>
		$(function() {
			$('#qnareply').submit(function(r) {
				var chk = $('.qnarecontent').val();

				console.log('submit', chk);
				if (chk.length <= 0 || chk.trim() == '') {
					r.preventDefault();
					alert("댓글를 입력하세요!");
				}
			});
		});
	</script>
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>My account</h3>
						<ul>
							<li><a href="/">home</a></li>
							<li>qna</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!-- my account start -->
	<section class="main_content_area">
		<div class="container">
			<div class="account_dashboard">
				<div class="row">
					<!-- Nav tabs start -->
					<div class="col-sm-12 col-md-3 col-lg-3">
						<div class="dashboard_tab_button">
							<ul role="tablist" class="nav flex-column dashboard-list">
								<li><a href="my-account-access.do" class="nav-link">회원정보수정</a></li>
								<li><a href="Allqnalist.do" class="nav-link active">QNA</a></li>
								<li><a href="#event" class="nav-link">쿠폰함</a></li>
								<li><a href="logout.do" class="nav-link">Log out</a></li>
							</ul>
						</div>
					</div>
					<!-- Nav tabs end -->
					<div class="col-sm-12 col-md-9 col-lg-9">
						<!-- Tab panes -->
						<div class="tab-content dashboard_content">
							<div class="tab-pane fade show active" id="member-info">
								<h3>QnA</h3>
								<div class="container-fluid">
									<div class="card shadow mb-4">
										<div class="card-body">
											<div class="table-responsive member-table">
												<h2>글조회 페이지</h2>
												<table class="table table-bordered">
													<tr>
														<th>제목</th>
														<td>
															<!-- 조회한 내용 --> ${requestScope.qna.title }
														</td>
													</tr>
													<tr>
														<th>작성자</th>
														<td>${requestScope.qna.memberid }</td>
													</tr>
													<tr>
														<th>내용</th>
														<td style="height : 250px;">${requestScope.qna.qnacontent }</td>
													</tr>
													<tr>
														<td colspan="2">첨부파일<br> <c:forEach var="f"
																items="${requestScope.flist }">
																<a href="fileDown.do?fno=${f.fno}&qno=${f.qno}">
																	${f.fileName}</a>
																<br>
																<!-- 해당 파일이 이미지인지? -->
																<c:if test="${f.type =='image' }">
																	<img
																		src="imageLoad.do?file=${f.fileName}&type=${f.type}">
																</c:if>
															</c:forEach>
														</td>
													</tr>
													<c:forEach var="comment"
														items="${ requestScope.qnacomment}">
														<tr>
															<td colspan="2">
																<div>
																	<b>${comment.writer }</b><br> <font size="2">${comment.qnarecontent }</font>
																</div>
															</td>
														</tr>
													</c:forEach>
													<c:if test="${sessionScope.login == true}">
													<form id="qnareply" action="qnareply.do">
														<tr>
															<td colspan=>
																<div class="comment_form">
																<input type="hidden" name="qno"
																	value="${requestScope.qna.qno }"> <input
																	type="hidden" name="writer"
																	value="${requestScope.qna.memberid }"> <span
																	class="memberid">${sessionScope.id }</span>
																</div>
															</td>
															<td><textarea name="qnarecontent" maxlength="500"></textarea>
																<span class="length">0/500</span>
																<button>등록</button>
															</td>
														</form>
													</c:if>
													<!-- 댓글 목록 -->
													<tr>
														<th><a href="/Allqnalist.do" class="btn">목록보기</a></th>
														<td style="text-align: right;"><c:if
																test="${sessionScope.id == requestScope.qna.memberid }">
																<a href="qnaUpdateView.do" class="btn">수정</a>
																<a href="deleteqna.do?qno=${requestScope.qna.qno }"
																	class="btn">삭제</a>
															</c:if></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- my account end -->
	<!--footer area start-->
	<jsp:include page="template/main/main_footer.jsp"></jsp:include>
	<!--footer area end-->
	<!-- JS ============================================ -->
	<!--jquery min js-->
	<script src="assets/js/vendor/jquery-3.5.0.min.js"></script>
	<!--popper min js-->
	<script src="assets/js/popper.js"></script>
	<!--bootstrap min js-->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--owl carousel min js-->
	<script src="assets/js/owl.carousel.min.js"></script>
	<!--slick min js-->
	<script src="assets/js/slick.min.js"></script>
	<!--magnific popup min js-->
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<!--jquery countdown min js-->
	<script src="assets/js/jquery.countdown.js"></script>
	<!--jquery ui min js-->
	<script src="assets/js/jquery.ui.js"></script>
	<!--jquery elevatezoom min js-->
	<script src="assets/js/jquery.elevatezoom.js"></script>
	<!--isotope packaged min js-->
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<!-- Plugins JS -->
	<script src="assets/js/plugins.js"></script>
	<!-- Main JS -->
	<script src="assets/js/main.js"></script>
</body>

</html>