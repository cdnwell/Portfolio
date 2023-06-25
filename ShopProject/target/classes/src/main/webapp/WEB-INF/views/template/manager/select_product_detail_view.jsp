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
	height: 100px;
	border: 1px solid #e3e6f0;
	border-radius: 3px;
	position: relative;
	padding-left: calc( ( 100% - 400px ) / 2 );
}

.preview-stage img{
	height: 70px;
	margin: 5px;
}

.preview-div{
	float: left;
}

.preview-div span{
	width: 100%;
	margin-top: -5px;
	text-align: center;
	display: block;
	font-size: 14px;
}

.stage-label-p, .stage-label-m{
	height: 100%;
	position: absolute;
	left : 0;
	writing-mode: vertical-lr;
	text-orientation: upright;
	font-size: 14px;
	letter-spacing : -8px;

	background-color: #4e73df;
	color: white;
	text-align: center;
}



.modify-stage {
    width: 100%;
    height: 120px;
    border: 1px solid #e3e6f0;
    border-radius: 3px;
    position: relative;

    padding-left: calc( ( 100% - 400px ) / 2 );
}

.modify-stage img{
	height : 70px;
	margin : 5px;
}



.modify-div {
    width: 80px;
    height: 110px;
    box-sizing: border-box;
    float: left;
}

.modify-div select {
    width: 70px;
    height: 30px;
    box-sizing: border-box;
    display: inline;
	margin-left: 5px;
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

.disabled{
	display: none;
}

</style>
<script src="js/preview-img.js"></script>
<script type="text/javascript">
	function label_chk(r){
        var label = $(r).parent();
		
		var color_bool = $(r).attr('name') === 'colors' ? true : false ;

		if(color_bool){
			var colorkind = label.html();
			var index = colorkind.indexOf('<');
			colorkind = colorkind.substring(0,index).trim();

			var colorno = label.children('input').attr('value');
			var select = $('.div-select');
		}

        if(label.css('background-color') == 'rgb(255, 255, 255)'){
            label.css('background-color','#2e59d9');
            label.css('color','white');
			if(color_bool)
				select.append('<option value="'+colorno+'" class="colorno'+colorno+'">'+colorkind+'</option');
        } else {
            label.css('background-color','white');
            label.css('color','#858796');
			if(color_bool)
				$('.colorno'+colorno).remove();
        }
    };

	function color_init(){
		var label = $('.color_label input').filter(':checked').parent();
		console.log(label);
		var select = $('.div-select');
		for(let i=0;i<label.length;i++){
			var color_label = label.get(i);
			var colorkind = color_label.innerHTML;
			var index = colorkind.indexOf('<');
			colorkind = colorkind.substring(0,index).trim();
			console.log('colorkind',colorkind);

			var colorno = color_label.children.item(0).getAttribute('value');

			select.append('<option value="'+colorno+'" class="colorno'+colorno+'">'+colorkind+'</option');
		}

	}

	//--------select 값 바뀔 때 form안의 input hidden 값도 바뀜--------//
	// value : -1 -> 아무 것도 선택하지 않았다. 
	function select_chg(event){
		var index = event;
		var value = $('.select'+index+' option:selected').val();
		
		$('.color-hidden'+index).val(value);
	}

	//--------form이 submit 되기 전에 이미지와 색상 매치 확인--------//
	function submit_chk(){
		// submit을 하기 전에 사진에 색상이 적용되었는지 체크한다.
		var no_img = 'img/icon/tmp_img_icon.png';
		var img_no = 0;

		for(let i=0;i<5;i++){
			var img_src = $('.preview-img'+i).attr('src');
			var find_img = img_src.indexOf(no_img);

			if(find_img === -1){
				var select_val = $('.select'+i+' option:selected').val();

				if(select_val == -1){
					alert('이미지에 색상이 선택되지 않았습니다.');
					return false;
				}
			} else {
				img_no++;
			}
		}

		// 이미지가 기본 이미지라면 img_no가 계속 추가되어 5가 됨
		// 이미지를 먼저 추가해달라는 메세지를 보냄
		if(img_no === 5){
			alert('이미지를 먼저 추가해주세요');
			return false;
		}

		// 이미지에 적용된 색상 option만 남기고 나머지는 삭제한다.
		var colors = $('input[name=colors]:checked');
		var colors_arr = [];
		var colors_del = [];

		for(let i=0;i<colors.length;i++){
			var colors_ea = colors.get(i);
			var colors_no = colors_ea.getAttribute('value');
			colors_arr.push(colors_no);
		}

		console.log('colors_arr',colors_arr);

		for(let i=0;i<5;i++){
			var select_val = $('.select'+i+' option:selected').val();

			colors_arr = colors_arr.filter(e => e !== select_val);
		}

		var colors_del_arr = $('input[name=colors]:checked');
		console.log(colors_del_arr);

		for(let i=0;i<colors_del_arr.length;i++){
			var colors_del_val = colors_del_arr[i].getAttribute('value');
			var colors_class = colors_del_arr[i].getAttribute('class');
			
			for(let j=0;j<colors_arr.length;j++){
				if(colors_arr[j] === colors_del_val){
					var colors_class_tag = $('.'+colors_class);
					colors_class_tag.prop('checked',false);

					colors_class_tag.parent().css('background-color','white');
            		colors_class_tag.parent().css('color','#858796');

					$('.colorno'+colors_del_val).remove();
				}
			}
		}

		colors_del_arr = $('input[name=colors]:checked');
		console.log(colors_del_arr);
		// 이미지에 적용된 색상 option만 남음 [완료]

		// 모든 조건을 통과했다면 submit
		return true;
	}
	
	$(function() {
		// size와 color의 label 색상 설정
		$('.size_label input').filter(':checked').parent().css('background-color','#2e59d9').css('color','white');
		$('.color_label input').filter(':checked').parent().css('background-color','#2e59d9').css('color','white');
		
		// 선택된 color -> colorkind, colorno 불러오기
		color_init();

		// 미리보기 img가 있을 경우 첫번째 이미지를 썸네일로 표시
		var find_src = $('.preview-img-before0').attr('src').indexOf('img/icon/tmp_img_icon.png');
		if(find_src === -1){
			var img = $('<img class="thumb-img">');
			img.attr('src',$('.preview-img-before0').attr('src'));
			img.appendTo('.img-card-body');
		}
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
						enctype="multipart/form-data" onsubmit="return submit_chk();">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr>
							<td style="width: 100px;">상품번호</td>
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
							</td>
						</tr>
						<tr class="disabled">
							<td colspan="2" class="hidden-input">
								<input type="hidden" class="color-hidden0" name="color0" value="-1">
								<input type="hidden" class="color-hidden1" name="color1" value="-1">
								<input type="hidden" class="color-hidden2" name="color2" value="-1">
								<input type="hidden" class="color-hidden3" name="color3" value="-1">
								<input type="hidden" class="color-hidden4" name="color4" value="-1">
							</td>
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
				<div class="stage-label-p">Before</div>
				<c:forEach var="f" items="${requestScope.Filepath }" varStatus="i">
					<c:choose>
						<c:when test="${f.productno != null }">
							<div class="preview-div">
								<img class="preview-img preview-img-before${i.index }" src="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}">
								<span class="pre-colorname">${f.colorname}</span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="preview-div">
								<img src="img/icon/tmp_img_icon.png" class="preview-img" alt="상품 미리보기 이미지">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="modify-stage">
				<div class="stage-label-m">After</div>
				<div class="modify-div0 modify-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img0 preview-img" alt="상품 미리보기 이미지">
					<select class="select0 div-select" onchange="select_chg(0);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="modify-div1 modify-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img1 preview-img" alt="상품 미리보기 이미지">
					<select class="select1 div-select" onchange="select_chg(1);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="modify-div2 modify-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img2 preview-img" alt="상품 미리보기 이미지">
					<select class="select2 div-select" onchange="select_chg(2);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="modify-div3 modify-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img3 preview-img" alt="상품 미리보기 이미지">
					<select class="select3 div-select" onchange="select_chg(3);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="modify-div4 modify-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img4 preview-img" alt="상품 미리보기 이미지">
					<select class="select4 div-select" onchange="select_chg(4);">
						<option value="-1">-------</option>
					</select>
				</div>
			</div>
			<div class="card-body img-card-body"></div>
		</div>
	</div>
</body>

</html>