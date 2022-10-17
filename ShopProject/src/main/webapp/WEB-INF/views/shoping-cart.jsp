<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Cart</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	.shopping_cart_area{
		margin-bottom: 200px;
	}
</style>
<script>
	$(function(){
		$("#checkbtn").click(function(){
			var productname="";
			var colorname="";
			var sizekind="";
			var price=0;
			var quantity=0;
			var total=0;
			var productphotono="";
			var productno="";
			
			var tdArr = new Array();
			var checkbox = $("input[id=cart_check]:checked");
			var checkcount = $("input[id=cart_check]:checked").length;
			
			checkbox.each(function(i) {	
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				productno = td.eq(9).children().val();
				productname = td.eq(3).text();
				colorname = td.eq(4).text();
				sizekind = td.eq(5).text();
				price = parseInt(td.eq(6).text());
				quantity = parseInt(td.eq(7).text());
				console.log(productno);
				
			});	
				
			if(checkcount == 0){
				alert("하나 이상 선택해주세요.");
				return false;
			}
			
			 var new_form = $('<form></form>');
		    new_form.attr("name", "test_form");
		    new_form.attr("method", "post");
		    new_form.attr("action", "checkout.do");

		    new_form.append($('<input/>', {type: 'hidden', name: 'productname', value: productname}));
		    new_form.append($('<input/>', {type: 'hidden', name: 'productno', value: productno}));
		    new_form.append($('<input/>', {type: 'hidden', name: 'colorname', value: colorname}));
		    new_form.append($('<input/>', {type: 'hidden', name: 'sizekind', value: sizekind}));
		    new_form.append($('<input/>', {type: 'hidden', name: 'price', value: price}));
		    new_form.append($('<input/>', {type: 'hidden', name: 'quantity', value: quantity}));
			
		    new_form.appendTo('body');
		    
	   		new_form.submit(); 
		});
	});
 	</script>
 	<style>
 		.pno_hidden{
 			display : none;
 		}
 	</style>
</head>
<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp" flush=""/>
	<!--header area end-->
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>cart</h3>
						<ul>
							<li><a href="index.html">home</a></li>
							<li>shopping cart</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!--shopping cart area start -->
	<c:set var="total_price" value="0" />
	<div class="shopping_cart_area">
		<div class="container">
			<form action="#">
				<div class="row">
					<div class="col-12">
						<div class="table_desc">
							<div class="cart_page table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product_remove">Delete</th>
											<th class="product_select">Select</th>
											<th class="product_thumb">Image</th>
											<th class="product_name">Product</th>
											<th class="product_name">Color</th>
											<th class="product_name">Size</th>
											<th class="product-price">Price</th>
											<th class="product_quantity">Quantity</th>
											<th class="product_total">Total</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${requestScope.cartlist }" var="cdto">
										<tr>
										<!-- 삭제 -->
											<td class="product_remove"><a href="deletecart.do?productno=${cdto.productno }"><i
													class="fa fa-trash-o"></i></a></td>
											<td class="product_checkbox">
												<input type="checkbox" id="cart_check">											
											</td>
											<td class="product_thumb"><a href="productdetailview.do?productno=${cdto.productno }&productname=${cdto.productname}"><img
													src="prImageDown.do?productno=${cdto.productno }" alt=""></a></td>
											<td class="cart_product_name" ><a href="productdetailview.do?productno=${cdto.productno }&productname=${cdto.productname}">${cdto.productname }</a></td>
											<td class="cart_color_name">${cdto.colorname }</td>
											<td class="cart_size_name">${cdto.sizekind }</td>
											<td class="product-price">￦${cdto.price }</td>
											<td class="product_quantity">${cdto.quantity }</td>
											
											<td class="product_total">￦${cdto.price  * cdto.quantity }</td>
											<td class="pno_hidden"><input type="hidden" value="${cdto.productno }"></td>
											<c:set var="total_price" value="${total_price + cdto.price * cdto.quantity }" />
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- 
							<div class="cart_submit">
								<button type="submit">update cart</button>
							</div>
							-->
						</div>
					</div>
				</div>
				<!--coupon code area start-->
				<div class="coupon_area">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="coupon_code left">
								<h3>Coupon</h3>
								<div class="coupon_inner">
									<p>Enter your coupon code if you have one.</p>
									<input placeholder="Coupon code" type="text">
									<button type="submit">Apply coupon</button>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="coupon_code right">
								<h3>Cart Totals</h3>
								<div class="coupon_inner">
									<div class="cart_subtotal">
										<p>Subtotal</p>
										<p class="cart_amount">Â£215.00</p>
									</div>
									<div class="cart_subtotal ">
										<p>Shipping</p>
										<p class="cart_amount">
											<span>Flat Rate:</span>Â£255.00
										</p>
									</div>
									<a href="#">Calculate shipping</a>
									<div class="cart_subtotal">
										<p>Total</p>
										<p class="cart_amount">￦ <c:out value="${total_price }"/></p>
									</div>
									<div class="checkout_btn">
										<span id="checkbtn">주문페이지로 이동</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--coupon code area end-->
			</form>
			
		</div>
	</div>
	<!--shopping cart area end -->
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