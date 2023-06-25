<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Main Home</title>
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
</head>
<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
	<!--slider area start-->
	<section class="slider_section mb-100">
		<div class="slider_area owl-carousel">
			<div class="single_slider d-flex align-items-center"
				data-bgimg="assets/img/slider/slider1.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider_content">
								<h2>Get 30% Off &amp;Free Shipping</h2>
								<h1>SUmmer sale</h1>
								<p>
									An exclusive selection of this seasonâs trends. <span>Exclusively
										online </span>
								</p>
								<a href="shop.html">Shop Now+</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single_slider d-flex align-items-center"
				data-bgimg="img/index/main_img01.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider_content">
								<h2>Get 30% Off &amp;Free Shipping</h2>
								<h1>SUmmer sale</h1>
								<p>
									An exclusive selection of this seasonâs trends. <span>Exclusively
										online </span>
								</p>
								<a href="shop.html">Shop Now+</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single_slider d-flex align-items-center"
				data-bgimg="img/index/main_img_woman01.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider_content">
								<h2>Get 30% Off &amp;Free Shipping</h2>
								<h1>SUmmer sale</h1>
								<p>
									An exclusive selection of this seasonâs trends. <span>Exclusively
										online </span>
								</p>
								<a href="shop.html">Shop Now+</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single_slider d-flex align-items-center"
				data-bgimg="img/index/main_img_clothes.jpg">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="slider_content">
								<h2>Get 30% Off &amp;Free Shipping</h2>
								<h1>SUmmer sale</h1>
								<p>
									An exclusive selection of this seasonâs trends. <span>Exclusively
										online </span>
								</p>
								<a href="shop.html">Shop Now+</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--slider area end-->
	<!--categories product area start-->
	<div class="categories_product_area   mb-92">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>Top Categories</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="product_carousel product_column4 owl-carousel">
					<c:forEach items="${requestScope.productpreview }" var="dto">
						<div class="col-lg-3">
							<div class="product_items">
								<article class="single_product">
									<figure>
										<div class="product_thumb">
											<a class="primary_img" href="productdetailview.do?productno=${dto.productno }&productname=${dto.productname}"><img
												src="fileDown.do?productphotono=${dto.productphotono}&productno=${dto.productno}" alt=""></a>
											<div class="label_product">
												<span class="label_sale">Sale</span>
											</div>
											<div class="action_links">
												<ul>
													<li class="wishlist"><a href="productdetailview.do?productno=${dto.productno }&productname=${dto.productname}"
														title="상품 자세히 보기"><span class="pe-7s-like"></span></a></li>
												</ul>
											</div>
										</div>
										<figcaption class="product_content">
											<div class="product_content_inner">
												<h4 class="product_name">
													<a href="product-details.html">${dto.productname }</a>
												</h4>
												<div class="price_box">
													<span class="current_price">&#8361; ${dto.price }</span>
												</div>
											</div>
											<div class="add_to_cart">
												<a href="productdetailview.do?productno=${dto.productno }&productname=${dto.productname}">상품 바로가기</a>
											</div>
										</figcaption>
									</figure>
								</article>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--categories product area end-->
	<!--testimonial area start-->
	<div class="testimonial_area mb-95">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>Testimonials</h2>
					</div>
				</div>
			</div>
			<div class="testimonial_container">
				<div class="row">
					<div class="col-12">
						<div
							class="testimonial_wrapper  testimonial_collumn1 owl-carousel">
							<div class="single_testimonial">
								<div class="testimonial_thumb">
									<img src="assets/img/about/testimonial1.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>These guys have been absolutely outstanding. Perfect
										Themes and the best of all that you have many options to
										choose!Best Support team ever!Very fast responding!Thank you
										very much!I highly recommend this theme and these people!</p>
									<h3>
										<a href="#">John Sullivan</a>
									</h3>
									<span>Customer</span>
								</div>
							</div>
							<div class="single_testimonial">
								<div class="testimonial_thumb">
									<img src="assets/img/about/testimonial2.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>Lorem ipsum dolor sit amet,consectetur adipisicing elit.
										Error in,mollitia nulla officiis excepturi repudiandae beatae
										optio,sequi maxime assumenda ipsum exercitationem nostrum
										ducimus facilis,nesciunt aliquam dicta totam.</p>
									<h3>
										<a href="#">Jenifer Brown</a>
									</h3>
									<span>Manager of AZ</span>
								</div>
							</div>
							<div class="single_testimonial">
								<div class="testimonial_thumb">
									<img src="assets/img/about/testimonial3.png" alt="">
								</div>
								<div class="testimonial_content">
									<p>These guys have been absolutely outstanding. Perfect
										Themes and the best of all that you have many options to
										choose!Best Support team ever!Very fast responding!Thank you
										very much!I highly recommend this theme and these people!</p>
									<h3>
										<a href="#">Kathy Young</a>
									</h3>
									<span>CEO of SunPark</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--testimonial area end-->
	<!--product area start-->

	<div class="product_area  mb-95">
	</div>
	<!--footer area start-->
	<jsp:include page="template/main/main_footer.jsp"></jsp:include>
	<!--footer area end-->
	<!-- modal area start-->
	<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="ion-android-close"></i></span>
				</button>
				<div class="modal_body">
					<div class="container">
						<div class="row">
							<div class="col-lg-5 col-md-5 col-sm-12">
								<div class="modal_tab">
									<div class="tab-content product-details-large">
										<div class="tab-pane fade show active" id="tab1"
											role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/productbig1.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab2" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/productbig2.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab3" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/productbig3.jpg" alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab4" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/productbig4.jpg" alt=""></a>
											</div>
										</div>
									</div>
									<div class="modal_tab_button">
										<ul class="nav product_navactive owl-carousel" role="tablist">
											<li><a class="nav-link active" data-toggle="tab"
												href="#tab1" role="tab" aria-controls="tab1"
												aria-selected="false"><img
													src="assets/img/product/product3.jpg" alt=""></a></li>
											<li><a class="nav-link" data-toggle="tab" href="#tab2"
												role="tab" aria-controls="tab2" aria-selected="false"><img
													src="assets/img/product/product8.jpg" alt=""></a></li>
											<li><a class="nav-link button_three" data-toggle="tab"
												href="#tab3" role="tab" aria-controls="tab3"
												aria-selected="false"><img
													src="assets/img/product/product1.jpg" alt=""></a></li>
											<li><a class="nav-link" data-toggle="tab" href="#tab4"
												role="tab" aria-controls="tab4" aria-selected="false"><img
													src="assets/img/product/product6.jpg" alt=""></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-12">
								<div class="modal_right">
									<div class="modal_title mb-10">
										<h2>Donec Ac Tempus</h2>
									</div>
									<div class="modal_price mb-10">
										<span class="new_price">$64.99</span><span class="old_price">$78.99</span>
									</div>
									<div class="modal_description mb-15">
										<p>Lorem ipsum dolor sit amet,consectetur adipisicing
											elit. Mollitia iste laborum ad impedit pariatur esse optio
											tempora sint ullam autem deleniti nam in quos qui nemo ipsum
											numquam,reiciendis maiores quidem aperiam,rerum vel
											recusandae</p>
									</div>
									<div class="variants_selects">
										<div class="variants_size">
											<h2>size</h2>
											<select class="select_option"><option selected
													value="1">s</option>
												<option value="1">m</option>
												<option value="1">l</option>
												<option value="1">xl</option>
												<option value="1">xxl</option></select>
										</div>
										<div class="variants_color">
											<h2>color</h2>
											<select class="select_option"><option selected
													value="1">purple</option>
												<option value="1">violet</option>
												<option value="1">black</option>
												<option value="1">pink</option>
												<option value="1">orange</option></select>
										</div>
										<div class="modal_add_to_cart">
											<form action="#">
												<input min="1" max="100" step="2" value="1" type="number">
												<button type="submit">add to cart</button>
											</form>
										</div>
									</div>
									<div class="modal_social">
										<h2>Share this product</h2>
										<ul>
											<li class="facebook"><a href="#"><i
													class="fa fa-facebook"></i></a></li>
											<li class="twitter"><a href="#"><i
													class="fa fa-twitter"></i></a></li>
											<li class="pinterest"><a href="#"><i
													class="fa fa-pinterest"></i></a></li>
											<li class="google-plus"><a href="#"><i
													class="fa fa-google-plus"></i></a></li>
											<li class="linkedin"><a href="#"><i
													class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal area end-->
	<!-- JS ============================================ -->
	<!--jquery min js-->
	
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