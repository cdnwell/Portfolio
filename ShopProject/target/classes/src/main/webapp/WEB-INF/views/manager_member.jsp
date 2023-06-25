<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Manager - 회원 관리</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<style type="text/css">
	.before-arrow .next-arrow{
		width: 15px;
		margin-bottom : 3px;
	}
	
	.paging_normal{
		color : blue;
		font-weight : bold;
	}
	tbody > tr > td:last-of-type {
		width : 160px;
	}
</style> 

</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<jsp:include page="template/manager/sidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>
                    <!-- Topbar Search -->
                    <form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
						action="member-list.do" method="get">
						<div class="input-group">
						
							<select class="search_select" name="type">
								<option value="memberId">아이디</option>
								<option value="memberName">이름</option>
								<option value="address">주소</option>
							</select>
							<input type="text" class="form-control bg-light border-0 small search_input"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2" name="search">
							<div class="input-group-append">
								<button class="btn btn-primary search_btn">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                      <!-- manager widget start -->
                        <c:choose>
							<c:when test="${ sessionScope.mLogin != null}">
								<jsp:include page="template/manager/menu_top_icon.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
               <!-- manager widget end -->
                </ul>
                </nav>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                <div class="card shadow mb-4">
                <div class="card-body">
						<div class="table-responsive member-table">
	   						<table class="table table-bordered">
		   						<thead>
	                               <tr>
	                                   <th>회원 아이디</th>
	                                   <th>이름</th>
	                                   <th>우편 번호</th>
	                                   <th>주소</th>
	                                   <th>주소(상세주소)</th>
	                                   <th>생년월일</th>
	                                   <th>전화번호</th>
	                                   <th>탈퇴여부</th>
	                                   <th>성별</th>
	                                   <th>자세히</th>
	                               </tr>
	                               </thead>
	                               <tbody>
	                               	   <c:forEach var="m" items="${requestScope.member }">
	                               	   		<tr>
			                               		<td>${m.memberId }</td>
			                               		<td>${m.memberName }</td>
			                               		<td>${m.postNo }</td>
			                               		<td>${m.address }</td>
			                               		<td>${m.addressDetail }</td>
			                               		<td>${m.birthDate }</td>
			                               		<td>${m.memberTelNo }</td>
			                               		<td>${m.withdraw}</td>
			                               		<td>${m.gender }</td>
			                               		<td><a href="manager-member-detail.do?memberId=${m.memberId }">주문내역</a></td>
		                               		</tr>   	  
	                               	   </c:forEach>
	                               </tbody>
	                               <tfoot>
	                               	<tr>
										<td colspan="9" class="table_footer"><c:if
												test="${requestScope.paging.previousPageGroup}">
												<a href="/member-list.do?pageNo=${paging.startPageOfPageGroup - 1 }&search=${requestScope.search}&type=${requestScope.type}"> <img src="img/back-button.png" class="before-arrow"> </a>
											</c:if> <c:forEach var="m"
												begin="${requestScope.paging.startPageOfPageGroup}"
												end="${requestScope.paging.endPageOfPageGroup}">
												<c:choose>
													<c:when test="${m == paging.currentPageNo }">
														<span class="paging_normal">${m }</span>
													</c:when>
													<c:otherwise>
														<a href="/member-list.do?pageNo=${m }&search=${requestScope.search}&type=${requestScope.type}">${m }</a>
													</c:otherwise>
												</c:choose>
											</c:forEach> <c:if test="${requestScope.paging.nextPageGroup}">
												<a href="/member-list.do?pageNo=${paging.endPageOfPageGroup + 1 }"> <img src="img/fast-forward.png" class="next-arrow"> </a>
											</c:if>
										</td>
										<td>
											 <button class="btn btn-info" type="button" onclick="location.href='member-list-excel.do?search=${requestScope.search}&type=${requestScope.type}'">엑셀 파일 생성</button>
										</td>
									</tr>
	                               </tfoot>
							</table>
						</div>
					</div>
				</div>
				</div>
				</div>
            <!-- End of Main Content -->

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
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">Ã</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>