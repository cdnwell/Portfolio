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

<script>
	// 변경 상태
	// 0 : 이미지 없음
	// 1 : 이미지 있음
	// 2 : 이미지가 있던 상태에서 변경 됨
	// 3 : 이미지가 있던 상태에서 한 번 더 변경 됨 -> 변경 될 경우 2가 됨
	var img_arr = [0,0,0,0,0];

	function setThumbnail0(event) {
		var reader = new FileReader();

		try{
			reader.onload = function(event) {
				img = $('.preview-img0');
				img.attr('src', event.target.result);
				var thumbNum = $('.thumb-img').length;
				var thumb_img = $('<img class="thumb-img">');
				if(thumbNum === 0){
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[0] = 1;
				} else if (img_arr[0] === 1) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[0] = 2;
				} else if (img_arr[0] === 2) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[0] = 3;
				} else if (img_arr[0] === 3) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[0] = 2;
				}
			};
			
			reader.readAsDataURL(event.target.files[0]);
		} catch (err) {
			img = $('.preview-img0');
			img.attr('src','img/icon/tmp_img_icon.png');
			if (img_arr[0] === 1 || img_arr[0] === 2 || img_arr[0] === 3) {
				$('.thumb-img').remove();
			}
			img_arr[0] = 0;
		}
		
	};

	function setThumbnail1(event) {
		var reader = new FileReader();

		try{
			reader.onload = function(event) {
				img = $('.preview-img1');
				img.attr('src', event.target.result);
				var thumbNum = $('.thumb-img').length;
				var thumb_img = $('<img class="thumb-img">');
				if(thumbNum === 0){
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[1] = 1;
				} else if (img_arr[1] === 1) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[1] = 2;
				} else if (img_arr[1] === 2) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[1] = 3;
				} else if (img_arr[1] === 3) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[1] = 2;
				}
			};
		
			reader.readAsDataURL(event.target.files[0]);
		} catch (err) {
			img = $('.preview-img1');
			img.attr('src','img/icon/tmp_img_icon.png');
			if (img_arr[1] === 1 || img_arr[1] === 2 || img_arr[1] === 3) {
				$('.thumb-img').remove();
			}
			img_arr[1] = 0;
		}
	};

	function setThumbnail2(event) {
		var reader = new FileReader();

		try{
			reader.onload = function(event) {
				img = $('.preview-img2');
				img.attr('src', event.target.result);
				var thumbNum = $('.thumb-img').length;
				var thumb_img = $('<img class="thumb-img">');
				if(thumbNum === 0){
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[2] = 1;
				} else if (img_arr[2] === 1) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[2] = 2;
				} else if (img_arr[2] === 2) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[2] = 3;
				} else if (img_arr[2] === 3) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[2] = 2;
				}
			};
		
			reader.readAsDataURL(event.target.files[0]);
		} catch (err) {
			img = $('.preview-img2');
			img.attr('src','img/icon/tmp_img_icon.png');
			if (img_arr[2] === 1 || img_arr[2] === 2 || img_arr[2] === 3) {
				$('.thumb-img').remove();
			}
			img_arr[2] = 0;
		}
	};

	function setThumbnail3(event) {
		var reader = new FileReader();

		try{
			reader.onload = function(event) {
				img = $('.preview-img3');
				img.attr('src', event.target.result);
				var thumbNum = $('.thumb-img').length;
				var thumb_img = $('<img class="thumb-img">');
				if(thumbNum === 0){
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[3] = 1;
				} else if (img_arr[3] === 1) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[3] = 2;
				} else if (img_arr[3] === 2) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[3] = 3;
				} else if (img_arr[3] === 3) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[3] = 2;
				}
			};
		
			reader.readAsDataURL(event.target.files[0]);
		} catch (err) {
			img = $('.preview-img3');
			img.attr('src','img/icon/tmp_img_icon.png');
			if (img_arr[3] === 1 || img_arr[3] === 2 || img_arr[3] === 3) {
				$('.thumb-img').remove();
			}
			img_arr[3] = 0;
		}
	};

	function setThumbnail4(event) {
		var reader = new FileReader();

		try{
			reader.onload = function(event) {
				img = $('.preview-img4');
				img.attr('src', event.target.result);
				var thumbNum = $('.thumb-img').length;
				var thumb_img = $('<img class="thumb-img">');
				if(thumbNum === 0){
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[4] = 1;
				} else if (img_arr[4] === 1) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[4] = 2;
				} else if (img_arr[4] === 2) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[4] = 3;
				} else if (img_arr[4] === 3) {
					$('.img-card-body').empty();
					thumb_img.attr('src',event.target.result);
					thumb_img.appendTo('.img-card-body');
					img_arr[4] = 2;
				}
			};
		
			reader.readAsDataURL(event.target.files[0]);
		} catch (err) {
			img = $('.preview-img4');
			img.attr('src','img/icon/tmp_img_icon.png');
			if (img_arr[4] === 1 || img_arr[4] === 2 || img_arr[4] === 3) {
				$('.thumb-img').remove();
			}
			img_arr[4] = 0;
		}
	};

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

	$(function() {
		$('.preview-img').click(function(e){
			$('.img-card-body').empty();
			var no_img = 'img/icon/tmp_img_icon.png';
			var find_img = e.target.src.indexOf(no_img);
			if(find_img === -1){
				var img = $('<img class="thumb-img">');
				img.attr('src',e.target.src);
				img.appendTo('.img-card-body');
			}
		});
	});
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
										<input type="file" name="file" class="file0" onchange="setThumbnail0(event);">
									</p>
									<p>
										<input type="file" name="file" class="file1" onchange="setThumbnail1(event);">
									</p>
									<p>
										<input type="file" name="file" class="file2" onchange="setThumbnail2(event);">
									</p>
									<p>
										<input type="file" name="file" class="file3" onchange="setThumbnail3(event);">
									</p>
									<p>
										<input type="file" name="file" class="file4" onchange="setThumbnail4(event);">
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