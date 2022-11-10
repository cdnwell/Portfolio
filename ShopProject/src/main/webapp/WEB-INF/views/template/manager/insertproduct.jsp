<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
body {
	overflow: auto;
}

select {
	width: 200px;
}

input {
	padding: 5px;
}

.card-container {
	min-width: 520px;
}

#file_form1 {
	position: relative;
}

.file_btn_first {
	position: absolute;
	top: 1px;
	right: 0;
}

.btn-primary {
	width: 40px;
}

.container-fluid {
	display: flex;
}

#thumbImg{
	margin-top : 40px;
	width : 100%;
	max-height: 804px;
}

.card-container{
	position : relative;
}

.head-card-body{
	margin-top: 0.5rem;
	top : 15px;
	text-align : center;
	width : 100%;
	padding: 5px;
}

.first_td{
	min-width: 100px;
}

.btn-td-align{
	text-align : right;
}

label input{
	display : none;
}

.size_label, .color_label{
	min-width : 40px;
	padding : 4px;
	border : 1px solid black;
	background-color : white;
	text-align : center;
	border-radius : 4px;
}

</style>
<style type="text/css">
.preview-stage{
	width: 100%;
	height: 80px;
	border: 1px solid #e3e6f0;
	border-radius: 3px;

	text-align: center;
}

.preview-stage img{
	height: 70px;
	margin: 5px;
}



.thumb-img{
	width: 96%;
	margin: 0 2%;
}



.disabled{
    display: none;
}

.stage-img{
    transition : .3s;
}
</style>
<script src="js/preview-img.js"></script>
<script>
	function label_chk(r){
        var label = $(r).parent();
        
        if(label.css('background-color') == 'rgb(255, 255, 255)'){
            label.css('background-color','#2e59d9');
            label.css('color','white');
        } else {
            label.css('background-color','white');
            label.css('color','black');
        }
    };
</script>
</head>

<body>
	<div class="container-fluid">
		<div class="card shadow mb-4 col-lg-6 card-container">
			<div class="card-body">
				<form id="file_form" action="insertproduct.do" method="post"
					enctype="multipart/form-data">
					<table class="table table-bordered">
						<tr>
							<td class="first_td">제품 명</td>
							<td><input type="text" name="productname" value=""
								placeholder="재품명"></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><select class="select_option color" id="color2"
								name="categoryno">
									<option selected>category in option</option>
									<c:forEach items="${requestScope.categorylist}"
										var="categorylist">
										<option value="${categorylist.categoryno}">${categorylist.categoryname}
										</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>사이즈</td>
							<td>
							 <c:forEach items="${requestScope.sizelist}" var="sizelist">
									<label class="size_label">${sizelist.sizekind } <input type="checkbox" value="${sizelist.sizeno }" name="sizes" onclick="label_chk(this);"></label>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>컬러</td>
							<td>
							 	<c:forEach items="${requestScope.colorlist}" var="colorlist">
									<label class="color_label">${colorlist.colorname } <input type="checkbox" value="${colorlist.colorno }" name="colors" onclick="label_chk(this);"> </label>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td>제품 단가</td>
							<td><input type="text" name="cost" value="" placeholder="단가"></td>
						</tr>
						<tr>
							<td>제품 가격</td>
							<td><input type="text" name="price" value=""
								placeholder="가격"></td>
						</tr>
						<tr>
							<td>제품 수량</td>
							<td><input type="text" name="productstock" value=""
								placeholder="수량"></td>
						</tr>
						<tr>
							<td>입고일</td>
							<td><input type="text" name="receivingdate" value=""
								placeholder="입고일(YYYY/MM/DD)"></td>
						</tr>
						<tr>
							<td>입고량</td>
							<td><input type="text" name="inquantity" value=""
								placeholder="입고량"></td>
						</tr>
						<tr>
							<td colspan="2" class="btn-td-align">
								<button class="btn btn-success btn-icon-split">
									<span class="icon text-white-50"> <i>+</i>
									</span> <span class="text" id="selectBtn">상품 등록</span>
								</button>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div id="file_form1">
									<!-- <p class="file_btn_first">
										<button type="button" id="plus" class="btn-primary btn plus-btn">+</button>
										<button type="button" id="minus" class="btn-primary btn">-</button>
									</p> -->
									<p>
										<input type="file" name="file" onchange="setThumbnail0(event);">
									</p>
									<p>
										<input type="file" name="file" onchange="setThumbnail1(event);">
									</p>
									<p>
										<input type="file" name="file" onchange="setThumbnail2(event);">
									</p>
									<p>
										<input type="file" name="file" onchange="setThumbnail3(event);">
									</p>
									<p>
										<input type="file" name="file" onchange="setThumbnail4(event);">
									</p>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="card shadow mb-4 col-lg-6 card-container">
			<h2 class="head-card-body">상품 미리 보기</h2>
			<div class="preview-stage">
				<img src="img/icon/tmp_img_icon.png" class="preview-img0 preview-img" alt="상품 미리보기 이미지">
				<img src="img/icon/tmp_img_icon.png" class="preview-img1 preview-img" alt="상품 미리보기 이미지">
				<img src="img/icon/tmp_img_icon.png" class="preview-img2 preview-img" alt="상품 미리보기 이미지">
				<img src="img/icon/tmp_img_icon.png" class="preview-img3 preview-img" alt="상품 미리보기 이미지">
				<img src="img/icon/tmp_img_icon.png" class="preview-img4 preview-img" alt="상품 미리보기 이미지">
			</div>
			<div class="card-body img-card-body"></div>
		</div>
	</div>
</body>

</html>