<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko"></html>
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Register</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<script>
		var id_chk_flag = false;

		function id_chk(){
			var id = $('.id_null').val();
			var id_p = $('.id_ckp');

			id_p.css('color','red');
			if(id.length < 3 || id.length > 10){
				id_p.html('아이디는 3-10글자까지 가능합니다.');
				return false;
			}

			return true;
		}

		function pw_chk(){
			var pw1 = $('.pw_null').val();
			var pw2 = $('.pw2_null').val();
			var pw_p = $('.pw_ckp');
			var regex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]/;
			
			pw_p.css('color','red');
			if(pw1.length > 20 || pw2.length > 20 || pw1.length < 4 || pw2.length < 4 ){
				pw_p.html('비밀번호는 4~20자까지 가능합니다.');
				return false;
			}

			if(!regex.test(pw1) || !regex.test(pw2)){
				pw_p.html('비밀번호는 하나 이상의 문자, 숫자여야 합니다.');
				return false;
			}

			if(pw1 != pw2){
				pw_p.html('비밀번호가 같지 않습니다.');
				return false;
			}

			pw_p.css('color','blue');
			pw_p.html('비밀번호가 일치합니다.');
			return true;
		}

		function name_chk(){
			var name = $('.name_null').val();
			var regex = /^[가-힣]{1,8}$/;
			var name_p = $('.name_ckp');

			name_p.css('color','red');
			if(!regex.test(name)){
				name_p.html('이름은 한글 8글자까지 가능합니다.');
				return false;
			}

			name_p.css('color','blue');
			name_p.html('사용 가능한 이름입니다.');
			return true;
		}

		function address_chk(){
			var add = $('#sample4_detailAddress').val();
			var add_p = $('.add_ckp');

			if(add.length < 1 || add == ''){
				add_p.css('color','red');
				add_p.html('주소를 입력해주세요');
				return false;
			}
			
			add_p.html('');
			return true;
		}

		function tel_chk(){
			var tel = $('.tel_null');

			if(tel.val().length > 11){
				tel.val(tel.val().substring(0,13));
			}

			tel.val(tel.val()
				.replace(/[^0-9]/g, '')
				.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""));


			if(tel.val().length == 13)
				return true;
			else
				return false;
		}

		$(function(){
			$('.pw_null').keyup(pw_chk);
			$('.pw2_null').keyup(pw_chk);
			$('.name_null').keyup(name_chk);
			$('#sample4_detailAddress').keyup(address_chk);
			$('.tel_null').keyup(tel_chk);

			$('.registerform').submit(function(r){
				if(!id_chk()){
					r.preventDefault();
				}else if(!id_chk_flag){
					r.preventDefault();
					$('.id_ckp').css('color','red');
					$('.id_ckp').html('아이디 중복확인을 해주세요');
				}else if(!pw_chk()){
					r.preventDefault();
				}else if(!name_chk()){
					r.preventDefault();
				}else if(!address_chk()){
					r.preventDefault();
				}else if($('.birthDate_null').val() == '' || $('.birthDate_null').val().length < 1){
					r.preventDefault();
					$('.birth_ckp').css('color','red');
					$('.birth_ckp').html('생일을 입력해주세요.');
				}else if(!tel_chk()){
					$('.birth_ckp').html('');
					r.preventDefault();
					$('.tel_ckp').css('color','red');
					$('.tel_ckp').html('전화번호를 입력해주세요.');
				}
			});

			$('.register_id_chk_btn').click(function(){
				var d = 'memberId='+$('.id_chk').val();
				$.ajax({
					url : 'idCheck.do',
					data : d,
					success : function(r){
						var id_p = $('.id_ckp');
						if(r==1){
							if(!id_chk()) return;
							id_chk_flag = true;
							id_p.css('color','blue');
							id_p.html('아이디가 사용 가능 합니다.');
						} else if(r==0) {
							id_chk_flag = false;
							id_p.css('color','red');
							id_p.html('아이디가 중복됩니다.');
						} else {
							id_chk_flag = false;
							id_p.css('color','red');
							id_p.html('아이디를 입력해주세요.');
						}
					}
				});
			});
		});
	
</script>
<style>
	.account_form button{
		margin-left : 0px;
		margin-top : 15px;
	}
	.gender_null{
		margin-left : 10px;
	}
	#sample4_postcode{
		width : 30%;
	}
	#sample4_post_search{
		width : 30%;
	}
	.account_form {
		min-width : 700px;
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
						<h3>register</h3>
						<ul>
							<li><a href="index.html">home</a></li>
							<li>register</li>
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
			<div class="row">
				<!--register area start-->
				<div class="col-lg-12 col-md-12 row justify-content-center">
					<div class="account_form register">
						<h2>Register</h2>
						<form action="register.do" class="registerform">
							<p>
								<label>id <span>*</span></label><input type="text"
									name="memberId" class="id_chk id_null">
								<button class="register_id_chk_btn" type="button">아이디
									중복확인</button>
							</p>
							<p class="id_ckp"></p>
							<p>
								<label>passwords <span>*</span></label><input type="password"
									name="pw" class="pw_null">
							</p>
							<p>
								<label>passwords(check) <span>*</span></label><input type="password"
								 class="pw2_null">
							</p>
							<p class="pw_ckp"></p>
							<p>
								<label>name <span>*</span></label><input type="text"
									name="memberName" class="name_null">
							</p>
							<p class="name_ckp"></p>
							<p>
								<label>address <span>*</span></label><br>
								<input type="text" name="postNo" id="sample4_postcode" placeholder="우편번호">
								<input type="button" id="sample4_post_search" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
								<input type="text" name="address" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" name="addressDetail" id="sample4_detailAddress" placeholder="상세주소">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
								<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
								<script>
									//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
									function sample4_execDaumPostcode() {
										new daum.Postcode({
											oncomplete: function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var roadAddr = data.roadAddress; // 도로명 주소 변수
												var extraRoadAddr = ''; // 참고 항목 변수

												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
													extraRoadAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if(data.buildingName !== '' && data.apartment === 'Y'){
												extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if(extraRoadAddr !== ''){
													extraRoadAddr = ' (' + extraRoadAddr + ')';
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document.getElementById('sample4_postcode').value = data.zonecode;
												document.getElementById("sample4_roadAddress").value = roadAddr;
												document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
												
												// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
												if(roadAddr !== ''){
													document.getElementById("sample4_extraAddress").value = extraRoadAddr;
												} else {
													document.getElementById("sample4_extraAddress").value = '';
												}

												var guideTextBox = document.getElementById("guide");
												// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
												if(data.autoRoadAddress) {
													var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
													guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
													guideTextBox.style.display = 'block';

												} else if(data.autoJibunAddress) {
													var expJibunAddr = data.autoJibunAddress;
													guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
													guideTextBox.style.display = 'block';
												} else {
													guideTextBox.innerHTML = '';
													guideTextBox.style.display = 'none';
												}
											}
										}).open();
									}
								</script>
							</p>
							<p class="add_ckp"></p>
							<p>
								<label>birthdate <span>*</span></label><input type="date"
									name="birthDate" class="birthDate_null">
							</p>
							<p class="birth_ckp"></p>
							<p>
								<label>tel <span>*</span></label><input type="tel"
									name="memberTelNo" class="tel_null">
							</p>
							<p class="tel_ckp"></p>
							<p>
								<label>gender <span>*</span></label>
								<select name="gender" class="gender_null">
									<option value="M">남</option>
									<option value="F">여</option>
								</select>
							</p>
							<div class="login_submit">
								<button>Register</button>
							</div>
						</form>
					</div>
				</div>
				<!--register area end-->
			</div>
		</div>
	</div>
	<!-- customer login end -->
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
