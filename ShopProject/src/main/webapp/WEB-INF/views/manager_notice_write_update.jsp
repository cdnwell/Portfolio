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

    <title>Manager - 공지 사항 글쓰기(수정)</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../vendor/ckeditor/ckeditor.js"></script>
<script src="../vendor/ckeditor/UploadAdapter.js"></script>
<!-- 
<script src="/UploadAdapter.js"></script>
 -->
<script>
function uploadAdapterPlugin(editor){
		editor.plugins.get('FileRepository').createUploadAdapter = (loader) =>{
			return new UploadAdapter(loader)
		}
	}
	$(function(){
		var count = 3;//첨부파일 태그 개수
		$("#plus").click(function(){
			if(count == 5) return;
			count++;
			$("#file_form").append("<p><input type='file' name='file'></p>");
		});
		$("#minus").click(function(){
			if(count == 1) return;
				$(this).parent().parent().children("p").last().remove();
			count--;
		});
		var editor;
		//jquery는 기본적으로 배열로 값을 받는다.
		ClassicEditor.create($("#input-content")[0],{
			extraPlugins:[uploadAdapterPlugin]
		})
		.then(editor => {
			console.log("에디터 초기화 완료",editor);
			myEditor = editor;
		}).catch(error => {
			console.log(error);
		});
	});
	
</script>
<style type="text/css">
	th {
		width : 250px;
	}
	td > input{
		width : 100%;
	}
	.ck-content{
		height : 500px;
	}
	.content_td{
		width : 1700px;
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

                      <!-- 관리자 top menu 아이콘 모음 로그인시 표시/ 비로그인시 삭제 -->
                        <c:choose>
							<c:when test="${ sessionScope.mLogin != null}">
								<jsp:include page="template/manager/menu_top_icon.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
               <!-- 관리자 top menu 아이콘 모음 로그인시 표시/ 비로그인시 삭제 끝 -->
                </ul>
                </nav>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                <div class="card shadow mb-4">
                	<div class="card-body">
						<h2>글쓰기 페이지</h2>
						<form action="managerBoardUpdate.do" enctype="multipart/form-data" method="post">
							<table>
								<input type="hidden" name="noticeno" value="${requestScope.notice.noticeno }">
								<tr>
									<th>제목</th>
									<td><input class="content_title" type="text" name="title" minlength="2" maxlength="80"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>
										<input type="hidden" name="writer" value="${sessionScope.managerId }">
										${sessionScope.managerId }
									</td>
								</tr>
								<tr>
									<td style="vertical-align: top;" colspan="2">내용</td>
								</tr>
								<tr>
									<td colspan="2" class="content_td"><textarea name="content" id="input-content"></textarea></td>
								</tr>
								<!-- 첨부 파일 -->
								<tr>
									<td colspan="2" id="file_form">
										<p><input type="file" name="file">
										<button type="button" id="plus">+</button>
										<button type="button" id="minus">-</button></p>
										<p><input type="file" name="file"></p>
										<p><input type="file" name="file"></p>
									</td>
								</tr>
								<tr>
									<td>
										<button>글쓰기</button>
									</td>
								</tr>
							</table>
						</form>
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
	<script>
	var notice_cnt_chk = `${requestScope.notice.content}`;
	$('.content_title').val(`${requestScope.notice.title}`);	
	
	if(notice_cnt_chk != null)
		$('#input-content').val(`${requestScope.notice.content}`);
	
	
	</script>
</body>

</html>