<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>pop_title</title>
<script type="text/javascript">
	
</script>
<style>
.container-fluid{
	display : flex;
}



.file_td {
	position: relative;
}

.btn_p {
	position: absolute;
	top: 5px;
	left: 420px;
}

.two-btns {
	width: 40px;
}

.back-btn {
	margin-left: 10px;
}

input[type=file]::file-selector-button {
	width: 100px;
	height: 30px;
	background: #4e73df;
	border: 1px solid #4e73df;
	color: white;
	border-radius: 3px;
	cursor: pointer;
}

input[type=file]::file-selector-button:hover {
	background: #4565c4;
}

select {
	width: 194px;
	padding: 2px;
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



.head-card-body{
	margin-top: 0.5rem;
	top : 15px;
	text-align : center;
	width : 100%;
	padding: 5px;
}

.thumb-img{
	width: 96%;
	margin: 0 2%;
}

</style>
<script type="text/javascript">
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
	}
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
<style>
	
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="card shadow mb-4 col-lg-6 card-container">
			<div class="card-body">
				<div class="table-responsive">
					<form action="updateProduct.do" method="post"
						enctype="multipart/form-data">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr>
							<td>상품번호</td>
							<td><input type="text"
								value="${requestScope.product.productno }" placeholder="상품번호"
								disabled> <input type="hidden" name="productno"
								value="${requestScope.product.productno }"></td>
						</tr>

						<tr>
							<td>상품명</td>
							<td><input type="text" name="productname"
								value="${requestScope.product.productname }" placeholder="상품명">
							</td>
						</tr>

						<tr>
							<td>입고일</td>
							<td><input type="text" name="receivingdate"
								value="${requestScope.product.receivingdate }" placeholder="입고일">
							</td>
						</tr>

						<tr>
							<td>입고량</td>
							<td><input type="text" name="inquantity"
								value="${requestScope.product.inquantity }" placeholder="입고량">
							</td>
						</tr>

						<tr>
							<td>재고</td>
							<td><input type="text" name="productstock"
								value="${requestScope.product.productstock }" placeholder="재고">
							</td>
						</tr>

						<tr>
							<td>카테고리</td>
							<td><input type="text" name="categoryno"
								value="${requestScope.product.categoryno }" placeholder="카테고리">
							</td>
						</tr>
						<tr>
							<td>사이즈</td>
							 <td>
							 	<c:forEach items="${requestScope.sizelist}" var="sizelist">
									<label class="size_label">${sizelist.sizekind } <input type="checkbox" value="${sizelist.sizeno }" name="sizes" onclick="label_chk(this);"
										<c:if test="${sizelist.sizesel == 'sel' }">
											checked
										</c:if>
									> </label>
								</c:forEach>
							 </td>
						</tr>
						<tr>
							<td>컬러</td>
							 <td>
								 <c:forEach items="${requestScope.colorlist}" var="colorlist">
									<label class="color_label">${colorlist.colorname } <input type="checkbox" value="${colorlist.colorno }" name="colors" onclick="label_chk(this);"
										<c:if test="${colorlist.colorsel == 'sel' }">
											checked
										</c:if>
									> </label>
								 </c:forEach>
							 </td>
						</tr>
						<tr>
							<td>단가</td>
							<td><input type="text" name="cost"
								value="${requestScope.product.cost }" placeholder="단가">
							</td>
						</tr>
						<tr>
							<td>가격</td>
							<td><input type="text" name="price"
								value="${requestScope.product.price }" placeholder="가격">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="file_td">
							<!-- 
								<p class="btn_p">
									<button type="button" id="plus"
										class="btn btn-primary two-btns">+</button>
									<button type="button" id="minus"
										class="btn btn-primary two-btns">-</button>
								</p>
								 -->
								<p>
									<input type="file" name="file">
								</p>
								
								<p>
									<input type="file" name="file">
								</p>
								<p>
									<input type="file" name="file">
								</p>
								<p>
									<input type="file" name="file">
								</p>
								<p>
									<input type="file" name="file">
								</p>
							</td>
						</tr>
						<tr>
							<td><input type="hidden" name="update"
								value=${requestScope.product.productno }></td>
						</tr>
						<tr>
							<td colspan="2">
								<button class="btn btn-primary">수정하기</button>
								<button type="button" class="btn btn-primary back-btn"
									onclick="history.back();">뒤로가기</button>
							</td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
		<div class="card shadow mb-4 col-lg-6 card-container">
			<h2 class="head-card-body">상품 정보 수정</h2>
			<div class="preview-stage">
				<c:forEach var="f" items="${requestScope.Filepath }" varStatus="i" begin="0" end="5">
					<c:choose>
					<c:when test="${f.productno != null }">
						<img class="preview-img${i.index } preview-img" src="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno} onchange="setThumbnail${i.index }(event);">
					</c:when>
					<c:otherwise>
						<img src="img/icon/tmp_img_icon.png" class="preview-img${i.index } preview-img" alt="상품 미리보기 이미지" onchange="setThumbnail${i.index }(event);">
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="card-body img-card-body"></div>
		</div>
	</div>
</body>

</html>