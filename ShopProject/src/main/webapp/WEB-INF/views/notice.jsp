<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Blothe - Notice</title>
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
.blog_fullwidth .blog_content p{
	max-width : 90%;
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
						<ul>
							<li><a href="/">home</a></li>
							<li>Notice</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->
	<!--blog area start-->
	<div class="blog_page_section blog_fullwidth mb-80">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-12">
					<div class="blog_wrapper">
						<c:forEach var="list" items="${requestScope.list}">
							<div class="single_blog">
								<div class="blog_thumb justify-content-center row">
									<a href="notice_detail.do?noticeno=${list.noticeno }"><img src="imageDown.do?photono=${list.photono}"
										alt=""></a>

								</div>
								<div class="blog_content">
									<div class="post_date">
										<span>Posted by:<a href="#">${list.writer}</a> / On:<a
											href="#"> ${list.wdate}</a></span>
									</div>
									<h4 class="post_title">
										<a href="notice_detail.do?noticeno=${list.noticeno }">${list.title}</a>
									</h4>
									<p>${list.content}</p>
									<footer class="blog_footer">
										<a href="notice_detail.do?noticeno=${list.noticeno }">+Read More</a>
									</footer>
								</div>
							</div>
							</c:forEach>
							<!-- 
						<div class="single_blog">
							<div class="blog_thumb">
								<a href="blog-details.html"><img
									src="assets/img/blog/blog1.jpg" alt=""></a>
									
							</div>
							<div class="blog_content">
								<div class="post_date">
									<span>Posted by:<a href="#">admin</a>/ On:<a href="#">April
											24,2020</a></span>
								</div>
								<h4 class="post_title">
									<a href="blog-details.html">Blog image post(sticky)</a>
								</h4>
								<p>Donec vitae hendrerit arcu,sit amet faucibus nisl. Cras
									pretium arcu ex. Aenean posuere libero eu augue condimentum
									rhoncus. Praesent ornare tortor ac ante egestas hendrerit.
									Aliquam et metus pharetra,bibendum massa nec,fermentum odio.</p>
								<footer class="blog_footer">
									<a href="blog-details.html">+Read More</a>
								</footer>
							</div>
						</div>
						-->
					</div>

					<!--blog pagination area start-->
					<div class="blog_pagination pagination_full">
						<div class="pagination">
							<ul>
								<c:if test="${requestScope.paging.previousPageGroup}">
									<li style="background: none;"><a
										href="/notice.do?pageNo=${paging.startPageOfPageGroup - 1 }">
											<img src="img/icon/back-button.png" class="before-arrow">
									</a></li>
								</c:if>
								<c:forEach var="m"
									begin="${requestScope.paging.startPageOfPageGroup}"
									end="${requestScope.paging.endPageOfPageGroup}">
									<c:choose>
										<c:when test="${m == paging.currentPageNo }">
											<li class="current">${m }</li>
										</c:when>
										<c:otherwise>
											<li><a href="/notice.do?pageNo=${m }">${m }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${requestScope.paging.nextPageGroup}">
									<li style="background: none;"><a
										href="/notice.do?pageNo=${paging.endPageOfPageGroup + 1 }">
											<img src="img/icon/fast-forward.png" class="next-arrow">
									</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!--blog pagination area end-->
				</div>
				<div class="col-lg-3 col-md-12">
					<div class="blog_sidebar_widget">
						<c:if test="${sessionScope.mLogin }">
							<div class="widget_list">
								<button type="button" class="btn" 
								onclick="location.href='manager_notice_write.do'">공지사항 글쓰기[관리자]</button>
							</div>
						</c:if>
						<div class="widget_list widget_search">
							<div class="widget_title">
								<h3>Search</h3>
							</div>
							<form action="searchNotice.do">
								<input placeholder="제목으로 검색하기" name="search" type="text">
								<button type="submit">search</button>
							</form>
						</div>
						<div class="widget_list comments">
							<div class="widget_title">
								<h3>Recent Comments</h3>
							</div>
							<c:forEach var="re" items="${requestScope.recent3re }">
								<div class="post_wrapper">
									<div class="post_thumb">
										<a href="blog-details.html"><img
											src="assets/img/blog/comment2.png.jpg" alt=""></a>
									</div>
									<div class="post_info">
										<span><a>${re.writer }</a> | </span><a
											>${re.content }</a>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="widget_list widget_post">
							<div class="widget_title">
								<h3>Recent Posts</h3>
							</div>
							<c:forEach var="no" items="${requestScope.recent3no }">
								<div class="post_wrapper">
									<div class="post_thumb">
										<a href="notice_detail.do?noticeno=${no.noticeno }"><img
											src="imageDown.do?photono=${no.photono }" alt=""></a>
									</div>
									<div class="post_info">
										<h4>
											<a href="notice_detail.do?noticeno=${no.noticeno }">${no.title }</a>
										</h4>
										<span>${no.wdate }</span>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- 
						<div class="widget_list widget_categories">
							<div class="widget_title">
								<h3>Categories</h3>
							</div>
							<ul>
								<li><a href="#">Audio</a></li>
								<li><a href="#">Company</a></li>
								<li><a href="#">Gallery</a></li>
								<li><a href="#">Image</a></li>
								<li><a href="#">Other</a></li>
								<li><a href="#">Travel</a></li>
							</ul>
						</div>
						<div class="widget_list widget_tag">
							<div class="widget_title">
								<h3>Tag products</h3>
							</div>
							<div class="tag_widget">
								<ul>
									<li><a href="#">asian</a></li>
									<li><a href="#">brown</a></li>
									<li><a href="#">euro</a></li>
								</ul>
							</div>
						</div>
						-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--blog area end-->
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