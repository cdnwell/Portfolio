<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Qna</title>
<style type="text/css">
#container {
	/* background-color: lime; */
	width: 1200px;
	margin: 0 auto;
}

#container table {
	width: 600px;
	border-collapse: collapse;
	margin: 5 auto;
}

#container th {
	width: 150px !important;
	text-align: left;
	padding: 5px;
}

#container td {
	width: 500px;
	padding: 5px;
	height: 40px;
}

#container input {
	width: 100%;
	height: 40px;
	box-sizing: border-box;
	border-width: 1px;
	border-radius: 5px;
}

h2 {
	text-align: center;
}

.btn {
	text-decoration: none;
	background-color: #e8e8e8;
	width: 80px;
	display: inline-block;
	padding: 5px 0px;
	font-weight: normal;
	border: 1px solid #585858;
	text-align: center;
	color: black;
	font-size: 14px;
	box-sizing: border-box;
}

.btn:hover {
	background-color: #282828;
	color: #FFFFFF
}

textarea {
	width: 100%;
	height: 300px;
	resize: none;
	box-sizing: border-box;
}

p input {
	width: 80% !important;
}

.ck-editor__editable_inline {
	min-height: 500px;
}
</style>
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
<style>
	.btns_div{
		text-align: right;
	}

	.btns_div button {
		background: #ff4545;
		border: 0;
		color: #fff;
		display: inline-block;
		font-size: 12px;
		font-weight: 700;
		height: 34px;
		line-height: 26px;
		padding: 5px 20px;
		text-transform: uppercase;
		cursor: pointer;
		-webkit-transition: .3s;
		transition: .3s;
		border-radius: 20px;
		margin: 10px 20px;
	}

	table td:nth-child(2){
		width: 50%;
	}
</style>
</head>

<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
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
					<!-- Tab panes -->
					<div class="col-sm-12 col-md-9 col-lg-9">
						<div class="tab-content dashboard_content">
							<div class="tab-pane fade show active">
								<div class="tab-pane dashboard_content container-fluid">
									<h3>QnA</h3>
									<div class="card shadow">
										<div class="card-body">
											<div class="table-responsive member-table">
												<table class="table table-bordered">
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
													</tr>
													<c:forEach items="${requestScope.list}" var="list">
														<tr>
															<td>${list.qno}</td>
															<td><a href="qnaview_page.do?qno=${list.qno }">${list.title }</a></td>
															<td>${list.memberid}</td>
															<td>${list.qnadate }</td>
														</tr>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="btns_div">
									<button type="button" onclick="location.href='qna_page.do'">글쓰기</button>
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