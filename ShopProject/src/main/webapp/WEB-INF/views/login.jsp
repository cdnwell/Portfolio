<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Login</title>
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
<!--kakao min js-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<!--header area start-->
	<jsp:include page="template/main/main_header.jsp"></jsp:include>
	<!--header area end-->
	<script type="text/javascript">
		$(function(){
			Kakao.init('b76a0ecb195913e883fb1984fe078269');
			$('#naver_id_login img').attr('src','img/icon/naver_btn.png').css('width','32px');
		});
	</script>
	
	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>Login</h3>
						<ul>
							<li><a href="/">home</a></li>
							<li>Login</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	
	
	<!-- customer login start -->
	<div class="customer_login">
		<div class="container">
			<div class="row justify-content-center">
				<!--login area start-->
				<div class="col-lg-6 col-md-6">
					<div class="account_form">
						<h2>login</h2>
						<form method="post" action="login.do">
							<p>
								<label>Username or email <span>*</span></label><input
									type="text" name ="id">
							</p>
							<p>
								<label>Passwords <span>*</span></label><input type="password" name="passwd">
							</p>
							
							<div class="login_submit">
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
					                <img src="img/icon/kakao_btn.png" width="222" alt="카카오 로그인 버튼" style="width:32px;margin:0 10px;margin-bottom:7px;" />
					            </a>
								<a id="naver_id_login" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=1gT6ptILkTkiIXDqGrGi&redirect_uri=http://localhost:9999/naverLogin.do">
							    	<img src="img/icon/naver_btn.png" style="width:32px;margin-bottom:7px;"/>
							    </a>
								<button type="button" onclick="location.href='register-page.do';">register</button>
								<button type="submit">login</button>
							</div>
						</form>
			            <script type="text/javascript">
					        function loginWithKakao() {
					        	Kakao.Auth.authorize({
					        		redirectUri : 'http://127.0.0.1:9999/kakaoLogin.do'	
					        	});
					        }
					    </script>
					</div>
				</div>
				<!--login area start-->
				<script>
			    function kakaoLogout() {
			    	var nickname = '${sessionScope.nickname}';
			    	if (!Kakao.Auth.getAccessToken()) {
			    		  console.log('Not logged in.');
			    		  return;
		    		}
		    		Kakao.Auth.logout(function() {
		    		  console.log(Kakao.Auth.getAccessToken());
		    		});
			  	}
		    </script>
			</div>
		</div>
	</div>
	<!-- customer login end -->
	<!--footer area start-->
	<jsp:include page="template/main/main_footer.jsp"></jsp:include>
	<!--footer area end-->
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