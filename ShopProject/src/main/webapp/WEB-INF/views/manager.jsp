<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Manager - Login</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
 
<link href="css/sb-admin-2.min.css" rel="stylesheet">
 

<style type="text/css">
	html{
		height : 100%;
	}	
	.account_div{
		display : flex;
		flex-direction : column;
		align-items : center;
	}
	body{
		display : flex;
		flex-direction : column;
		justify-content : center;
		height: 100%;
	}
	.account_form > h2{
		text-align : center;
	}
	form > p:last-of-type > input{
		margin-left : 56px;
	}
	form > p:first-of-type > input{
		margin-left : 20px;
	}
	.account_form > h2{
		padding : 10px 0;
	}
</style>

</head>

<body>
	<div class="container">
		<div class="container-fluid row justify-content-center">
			<div
				class="col-lg-6 col-md-6 account_div card shadow mb-4"
				style="float: none; margin: 100 auto;">
				<div class="account_form card-body">
					<h2>관리자 로그인</h2>
					<c:choose>
						<c:when test="${sessionScope.mLogin }">
							<p>${sessionScope.managerId }님 로그인 되었습니다.</p>
							<a href="manager-logout.do">로그아웃</a> <br>
							<a href="member-list.do">관리자 페이지로</a>
						</c:when>
						<c:otherwise>
							<form method="post" action="manager-login.do">
								<p>
									<label>관리자 아이디</label> <input type="text" name="managerId">
								</p>
								<p>
									<label>비밀번호</label> <input type="password" name="pw">
								</p>
									<button type="submit" class="btn btn-dark">login</button>
									<button type="button" class="btn btn-dark" onclick="location.href='/';">메인 화면</button>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2020</span>
				</div>
			</div>
		</footer>
	<!-- End of Footer -->
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>