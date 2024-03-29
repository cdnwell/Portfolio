<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	.menu_title{
		border-bottom : 1px solid #b7b7b7;
		width: 75%;
	}
	.cart_gallery {
	    height: 622px;
	    overflow-y: scroll;
	    width: 105%;
	    padding: 0 11px;
	}
	.category_ul a{
		width : fit-content;
	}
	.pe-7s-config{
	    font-size: 28px;
	    color: #232323;
	    margin-right : 10px;
	}
	.pe-7s-config:hover {
	    color: #e83e8c;
	    transition-duration: 1s;
	}
</style>
<script src="js/cart_list.js"></script>
<script src="js/category_list.js"></script>
<header>
		<div class="main_header sticky-header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-2 col-md-4 offset-md-4 offset-lg-0 col-5 offset-3 col-sm-5">
						<div class="logo">
							<a href="/"><img src="img/logo/blothe_logo.png" alt=""></a>
						</div>
					</div>
					<div class="col-lg-8">
						<!--main menu start-->
						<div class="main_menu menu_position">
							<nav>
								<ul>
									<li><a href="/">HOME</a>
									</li>
									<li class="mega_items"><a style="cursor : pointer;">shop<i class="fa fa-angle-down"></i></a>
										<div class="mega_menu">
											<ul class="mega_menu_inner">
												<li>
													<p class="menu_title">FOCUS</p>
													<ul>
														<li>
															<a href="shop-fullwidth.do">NEW</a>
														</li>
														<li>
															<a href="shop-fullwidth-best.do">BEST</a>
														</li>
													</ul>
												</li>
												<li>
													<p class="menu_title">CATEGORY</p>
													<ul class="category_ul">
													</ul>
												</li>
												<li>
												<p></p>
												<br>
												<ul class="category_ul_det">
												</ul>
											</li>
											</ul>
										</div>
									</li>
									<li><a style="cursor : pointer;">Community<i class="fa fa-angle-down"></i></a>
									<ul class="sub_menu pages">
											<li><a href="notice.do">공지사항</a></li>
										</ul></li>
									<li><a style="cursor : pointer;">About us<i class="fa fa-angle-down"></i></a>
										<ul class="sub_menu pages">
										<li><a href="about-page.do">쇼핑몰 소개</a></li>
										<li><a href="contact.do">오시는 길</a></li>
									</ul></li>
								</ul>
							</nav>
						</div>
						<!--main menu end-->
					</div>
					<div class="col-lg-2 col-md-4 col-sm-4 col-4">
						<div class="header_account_area">
							<div>
								<a href="manager.do"><span class="pe-7s-config"></span></a>
							</div>
							<c:if test="${sessionScope.login }">
								<div class="header_account_list mini_cart_wrapper">
									<a href="javascript:void(0)"><span class="pe-7s-shopbag before_item_count"></span></a>
								</div>
							</c:if>
							<c:choose>
								<c:when test="${sessionScope.login }">
									<div class="language_currency header_account_list ">
										<a href="#"><span class="pe-7s-user"></span></a>
										<ul class="dropdown_currency">
											<li><a href="my-account-access.do">회원정보</a></li>
											<li><a href="Allqnalist.do">QNA</a></li>
											<li><a href="cart.html">쿠폰함</a></li>
											<li><a href="logout.do">Log out</a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<div class="language_currency header_account_list ">
										<a href="#"><span class="pe-7s-user"></span></a>
										<ul class="dropdown_currency">
											<li><a href="login-page.do">Log in</a></li>
										</ul>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--mini cart-->
		<div class="mini_cart">
			<div class="cart_close">
				<div class="cart_text">
					<h3>cart</h3>
				</div>
				<div class="mini_cart_close">
					<a href="javascript:void(0)"><i class="ion-android-close"></i></a>
				</div>
			</div>
			<div class="cart_gallery">
			</div>
			<div class="mini_cart_table">
				<div class="cart_table_border">
					<div class="cart_total mt-10">
						<span>total:</span><span class="price"></span>
					</div>
				</div>
			</div>
			<div class="mini_cart_footer">
				<div class="cart_button">
					<a href="shoping-cart.do?memberId=${cdto.memberId }"><i class="fa fa-shopping-cart"></i>View
						cart</a>
				</div>
				<div class="cart_button">
					<a href="checkout.do"><i class="fa fa-sign-in"></i>Checkout</a>
				</div>
			</div> 
		</div>  
		<!--mini cart end-->
	</header>