<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Shop</title>
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
	.mb-80 {
	    margin-bottom: 200px;
	}
</style>
</head>
<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp" flush="" />
	<!--header area end-->
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>new</h3>
						<ul>
							<li><a href="index.html">home</a></li>
							<li>new</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!--shop area start-->
	<div class="shop_area shop_fullwidth mb-80">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!--shop wrapper start-->
					<!--shop toolbar start-->
					<!--shop toolbar end-->
					<div class="row shop_wrapper">
						<c:forEach items="${requestScope.shopNewProductList }"
							var="shopNewProductList" varStatus="status" begin="0" end="3">
							<div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
								<div class="single_product">
									<div class="product_thumb">
										<a class="primary_img" href="product-details.html"><img
											src="fileDown.do?productphotono=${shopNewProductList.productphotono}&productno=${shopNewProductList.productno}" alt=""></a>
										<div class="label_product">
											<span class="label_new">New</span>
										</div>
										<div class="action_links">
											
										</div>
									</div>
									<div class="product_content grid_content">
										<div class="product_content_inner">
											<h4 class="product_name">
												<a href="product-details.html">${shopNewProductList.productname}</a>
											</h4>
											<div class="price_box">
											<span
													class="current_price">&#8361; ${shopNewProductList.price }</span>
											</div>
										</div>
										<div class="add_to_cart">
											<a href="productdetailview.do?productno=${shopNewProductList.productno}&productname=${shopNewProductList.productname}">상품 바로가기</a>
										</div>
									</div>
									<div class="product_content list_content">
										<h4 class="product_name">
											<a href="product-details.html">${shopNewProductList.productname}</a>
										</h4>
										<div class="price_box">
											<span
												class="current_price">&#8361; ${shopNewProductList.price }</span>
										</div> 
										<div class="product_rating">
											<ul>
												<li><a href="#"><i class="ion-android-star"></i></a></li>
												<li><a href="#"><i class="ion-android-star"></i></a></li>
												<li><a href="#"><i class="ion-android-star"></i></a></li>
												<li><a href="#"><i class="ion-android-star"></i></a></li>
												<li><a href="#"><i class="ion-android-star"></i></a></li>
											</ul>
										</div>
										<div class="product_desc">
											<p>Lorem ipsum dolor sit amet,consectetur adipiscing
												elit. Fusce posuere metus vitae arcu imperdiet,id aliquet
												ante scelerisque. Sed sit amet sem vitae urna fringilla
												tempus.</p>
										</div>
										<div class="add_to_cart shop_list_cart">
											<a href="cart.html">Add to cart</a>
										</div>
										<div class="shop_toolbar t_bottom">
											<div class="pagination">
												<ul>
													<li class="current">1</li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li class="next"><a href="#">next</a></li>
													<li><a href="#">>></a></li>
												</ul>
											</div>
										</div>
										<!--shop toolbar end-->
										<!--shop wrapper end-->
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--shop area end-->
	<!--footer area start-->
	<jsp:include page="template/main/main_footer.jsp"></jsp:include>
	<!--footer area end-->
	<!-- modal area end-->
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