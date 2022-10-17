<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script type="text/javascript">
$(function(){
	$("#add_cart").click(function() {
		console.log($("#productno").text());
		var tag ="";
		tag +="productname=" + $("#productname").text()+"&";
		tag +="productno=" + $("#productno").val()+"&";
		tag +="quantity=" + $("#quantity").val()+"&";
		tag +="sizeno=" + $("#sizes").val()+"&";
		tag +="colorno=" + $(".color").val()+"&"; 
		tag +="price=" + $("#price").val()+"&"; 
		var id = $("#memberid").val();
		console.log(id);
		if($("#memberid").val() == null || $("#memberid").val() ==""){
			alert("로그인 후 이용해주세요");
			console.log(result + "색 + 사이즈");
		}
		if($("#sizes").val() == -1 || $(".color").val() == -1){
			alert("색상과 사이즈를 모두 선택해 주세요");
			console.log(result + "색 + 사이즈");
		} else {
			$.ajax({
				url:"insert-cart.do",
				data : tag,
				dataType:"json",
				success:function(result){
					console.log(result);
					$("#form").attr('action','checkcartpop.do');
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.colorname + '" name=colorname>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.productno+ '" name=productno>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.productname+ '" name=productname>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.price+ '" name=price>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.sizekind+ '" name=sizekind>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.quantity+ '" name=quantity>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + result.memberid+ '" name=memberid>')); 
			  		  $("#form").append($('<input type="hidden" class="t1" value="' + ${requestScope.filelist[0].productphotono}+ '" name=pphoto>')); 
			  	  	window.open('','POP',"width=500, height=800, resizable=0, scrollbars=no, status=no;"); 
			  	  	$("#form").submit();
				  },
				  error:function(result) { }
			  });
			}
		});
	});
</script> 

<style>
	.choosecolor{
		border: 2px solid red;
		color : green;
		background : green;
	}
	.selectoption {
    display: flex;
    align-items: center;
	}
	.niceselect {
	    -webkit-tap-highlight-color: transparent;
	    background-color: #fff;
	    border-radius: 5px;
	    border: solid 1px #e8e8e8;
	    -webkit-box-sizing: border-box;
	    box-sizing: border-box;
	    clear: both;
	    cursor: pointer;
	    display: block;
	    float: left;
	    font-family: inherit;
	    font-size: 14px;
	    font-weight: normal;
	    height: 42px;
	    line-height: 40px;
	    outline: 0;
	    padding-left: 18px;
	    padding-right: 30px;
	    position: relative;
	    text-align: left!important;
	    -webkit-transition: all .2s ease-in-out;
	    transition: all .2s ease-in-out;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    white-space: nowrap;
	    width: auto;
	}
</style>

</head>


<body>
<input type="hidden" id="memberid" value="${requestScope.memberId}">
<div class="product_details variable_product mb-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5">
					<div class="product-details-tab">
						<div id="img-1" class="zoomWrapper single-zoom">
							<a href="#"><img id="zoom1"
								src="fileDown.do?productphotono=${requestScope.filelist[0].productphotono}&productno=${requestScope.filelist[0].productno}"
							 data-zoom-image="fileDown.do?productphotono=${requestScope.filelist[0].productphotono}&productno=${requestScope.filelist[0].productno}" alt="big-1"></a>
							 <input id="pphoto" type="hidden" value="${requestScope.filelist[0].productno}">
						</div>
						<div class="single-zoom-thumb">
							<ul class="s-tab-zoom owl-carousel single-product-active"
								id="gallery_01">
									<c:forEach var="f" items="${requestScope.filelist }">
								<li><a href="#" class="elevatezoom-gallery active"
									data-update="" data-image="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}"
									data-zoom-image="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}"><img
										src="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}" alt="zo-th-1" /></a></li>
										</c:forEach> 
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-7 col-md-7">
					<div class="product_d_right">
						<div class="productd_title_nav">
							<h1>
								<a href="#" id="productname">${requestScope.productdto.productname }</a>
								<input type="hidden" id="productno" value="${requestScope.productdto.productno }">
							</h1>
						</div>
						<div class=" product_ratting">
							<ul>
								<li><a href="#"><i class="ion-android-star"></i></a></li>
								<li><a href="#"><i class="ion-android-star"></i></a></li>
								<li><a href="#"><i class="ion-android-star"></i></a></li>
								<li><a href="#"><i class="ion-android-star"></i></a></li>
								<li><a href="#"><i class="ion-android-star"></i></a></li>
								<li class="review"><a href="#">(customer review) </a></li>
							</ul>
						</div>
						<div class="price_box">
							<span class="current_price" >&#8361;${requestScope.productdto.price }</span>
							<input id="price" type="hidden" value="${requestScope.productdto.price }">
						</div>
						
						<div class="product_desc">
							<p>eget velit. Donec ac tempus ante. Fusce ultricies massa
								massa. Fusce aliquam,purus eget sagittis vulputate,sapien libero
								hendrerit est,sed commodo augue nisi non neque. Lorem ipsum
								dolor sit amet,consectetur adipiscing elit. Sed tempor,lorem et
								placerat vestibulum,metus nisi posuere nisl,in</p>
						</div>
						<div class="product_variant size">
							<label>color</label><select class="selectoption niceselect color" id="color"
								name="produc_color2"><option selected value="-1">color
									in option</option>
								<c:forEach items="${requestScope.colorlist}" var="colorlist">
									<option value="${colorlist.colorno}">${colorlist.colorname}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="product_variant size">
							<label>size</label><select  class="selectoption niceselect"  name="produc_color2" id="sizes">
							<option selected value="-1">size in option</option>
								<c:forEach items="${requestScope.sizeslist }" var="sizeslist" >
									<option value="${sizeslist.sizeno }">${sizeslist.sizekind }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="product_variant quantity">
							<label>quantity</label><input min="1" max="100" value="1"
								type="number" id="quantity">
							<button class="button add_cart" id="add_cart" type="button">add
								to cart</button>
						</div>
						<div class=" product_d_action">
							<ul>
								<li><a href="insertwishproduct.do" title="Add to wishlist">+Add to
										Wishlist</a></li>
								<li><a href="#" title="Add to wishlist">+Compare</a></li>
							</ul>
						</div>
						<div class="product_d_meta">
							<span>SKU:N/A</span><span>Category:<a href="#">Clothings</a></span><span>Tags:<a
								href="#">Creams</a><a href="#">Lotions</a></span>
						</div>
						<div class="priduct_social">
							<ul>
								<li><a class="facebook" href="#" title="facebook"><i
										class="fa fa-facebook"></i>Like</a></li>
								<li><a class="twitter" href="#" title="twitter"><i
										class="fa fa-twitter"></i>tweet</a></li>
								<li><a class="pinterest" href="#" title="pinterest"><i
										class="fa fa-pinterest"></i>save</a></li>
								<li><a class="google-plus" href="#" title="google +"><i
										class="fa fa-google-plus"></i>share</a></li>
								<li><a class="linkedin" href="#" title="linkedin"><i
										class="fa fa-linkedin"></i>linked</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form id='form' method='post' target=POP>
	</form>
</body>
</html>