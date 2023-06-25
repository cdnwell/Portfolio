<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center my-2"
		href="member-list.do">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			shopproject manager <sup>ver0.1</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<!-- <li class="nav-item"><a class="nav-link" href="index.html">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li> -->

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">상품</div>

	<!-- 
	class="nav-item"
	 -->
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item" >
	<a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo"
		aria-expanded="true" aria-controls="collapseTwo"> <i
			class="fas fa-fw fa-cog"></i> <span>상품 관리</span>
	</a>
		<div id="collapseTwo" aria-labelledby="headingTwo" 
		class="collapse"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">상품 관리:</h6>
				<a class="collapse-item" href="manager-insertproduct.do">상품 등록</a> 
				<a class="collapse-item" href="manager_productList.do">상품 관리</a>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
<!-- 	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Utilities:</h6>
				<a class="collapse-item" href="utilities-color.html">Colors</a> <a
					class="collapse-item" href="utilities-border.html">Borders</a> <a
					class="collapse-item" href="utilities-animation.html">Animations</a>
				<a class="collapse-item" href="utilities-other.html">Other</a>
			</div>
		</div></li> -->

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">회원</div>

	<c:set var="active" value="product"></c:set>
	<c:set var="active" value="member"></c:set>
	
	
	
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item" ><a class="nav-link" href="#"
		data-toggle="collapse" data-target="#collapsePages"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>회원 관리</span>
	</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">회원 관리:</h6>
				<a class="collapse-item" href="member-list.do">회원 목록</a>
				<a class="collapse-item" href="member-order-list.do">주문 내역 확인</a>
				<!-- <div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="404.html">404 Page</a> <a
					class="collapse-item active" href="blank.html">Blank Page</a> -->
			</div>
		</div></li>

	<!-- Nav Item - Charts -->
	<!-- <li class="nav-item"><a class="nav-link" href="charts.html">
			<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
	</a></li>

	Nav Item - Tables
	<li class="nav-item"><a class="nav-link" href="tables.html">
			<i class="fas fa-fw fa-table"></i> <span>Tables</span>
	</a></li> -->
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">게시판</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link" href="#"
		data-toggle="collapse" data-target="#collapseThree"
		aria-expanded="true" aria-controls="collapsePages"> <i
			class="fas fa-fw fa-folder"></i> <span>게시판 관리</span>
	</a>
		<div id="collapseThree" class="collapse"
			aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">게시판 관리:</h6>
				<a class="collapse-item" href="manager_notice_write.do">공지 글쓰기</a>
			</div>
		</div></li>
	
	<hr class="sidebar-divider">
	
	<div class="sidebar-heading">기능</div>
	
	<li class="nav-item">
	<a class="nav-link collapsed" href="manager-logout.do"> <i
			class="fas fa-fw fa-cog"></i> <span>로그 아웃</span>
	</a>
	</li>

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>