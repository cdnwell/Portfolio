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
	height: 120px;
	border: 1px solid #e3e6f0;
	border-radius: 3px;

	padding-left: calc( ( 100% - 400px ) / 2 );
}

.preview-stage img{
	height: 70px;
	margin: 5px;
}



.preview-div {
    width: 80px;
    height: 110px;
    box-sizing: border-box;
    float: left;

	text-align: center;
}

.preview-div select {
    width: 70px;
    height: 30px;
    box-sizing: border-box;
    display: inline;
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
</script>
<script>
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
</script>
</head>

<body>
	<div class="container-fluid">
		<div class="card shadow mb-4 col-lg-6 card-container">
			<div class="card-body">
				<form id="file_form" action="insertproduct.do" method="post"
					enctype="multipart/form-data" onsubmit="return submit_chk();">
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
							 	<c:forEach items="${requestScope.colorlist}" var="colorlist" varStatus="i">
									<label class="color_label">${colorlist.colorname } <input type="checkbox" class="chkbox${i.index}" value="${colorlist.colorno }" name="colors" onclick="label_chk(this);"> </label>
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
				<div class="preview-div0 preview-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img0 preview-img" alt="상품 미리보기 이미지">
					<select class="select0 div-select" onchange="select_chg(0);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="preview-div1 preview-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img1 preview-img" alt="상품 미리보기 이미지">
					<select class="select1 div-select" onchange="select_chg(1);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="preview-div2 preview-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img2 preview-img" alt="상품 미리보기 이미지">
					<select class="select2 div-select" onchange="select_chg(2);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="preview-div3 preview-div">
					<img src="img/icon/tmp_img_icon.png" class="preview-img3 preview-img" alt="상품 미리보기 이미지">
					<select class="select3 div-select" onchange="select_chg(3);">
						<option value="-1">-------</option>
					</select>
				</div>
				<div class="preview-div4 preview-div">
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