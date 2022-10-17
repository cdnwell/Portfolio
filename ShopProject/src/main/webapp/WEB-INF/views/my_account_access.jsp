<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!doctype html>
		<html class="no-js" lang="ko">

		<head>
			<meta charset="utf-8">
			<meta http-equiv="x-ua-compatible" content="ie=edge">
			<title>Blothe - My Account</title>
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
				#member-info {
					text-align: center;
				}

				.account_form{
					text-align: left;
				}

				.account_form button {
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
					margin-left: 20px;
					border-radius: 20px;
				}

			</style>
		</head>

		<body>
			<c:if test="${requestScope.login_fail }">
				<script>
					alert("비밀번호가 틀렸습니다.");
				</script>
			</c:if>
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
									<li>My account</li>
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
										<li><a href="my-account-access.do" class="nav-link active">회원정보수정</a></li>
										<li><a href="Allqnalist.do" class="nav-link">QNA</a></li>
										<li><a href="#event" class="nav-link">쿠폰함</a></li>
										<li><a href="logout.do" class="nav-link">Log out</a></li>
									</ul>
								</div>
							</div>
							<!-- Nav tabs end -->
							<div class="col-sm-12 col-md-9 col-lg-9">
								<!-- Tab panes start -->
								<div class="tab-content dashboard_content">
									<div class="tab-pane fade show active" id="member-info">
										<h3>회원정보확인</h3>
										<div class="row justify-content-center">
											<div class="col-lg-6">
												<div class="account_form">
													<form action="my_account_check.do" method="post">
														<p>
															<label>Passwords <span>*</span></label><input type="password" name="passwd">
														</p>
														<div class="login_submit">
															<button type="submit">login</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Tab panes end -->
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