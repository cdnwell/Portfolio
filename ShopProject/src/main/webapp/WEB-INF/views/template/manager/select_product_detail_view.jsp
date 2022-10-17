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
</style>
<script type="text/javascript">
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
	$(function(){
		var count = 3;
		$('.size_label input').filter(':checked').parent().css('background-color','#2e59d9').css('color','white');
		$('.color_label input').filter(':checked').parent().css('background-color','#2e59d9').css('color','white');
		$("#plus").click(function() {
			if (count == 5)
				return;
			count++;
			$(".file_td").append("<p><input type='file' name='file'></p>");
		});
		$("#minus").click(function() {
			if (count == 1)
				return;
			count--;
			$(this).parent().parent().children("p").last().remove();
		});
	});
</script>
</head>

<body>
	<h2>제품 상세 보기</h2>
	<form action="updateProduct.do" method="post"
		enctype="multipart/form-data">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<c:forEach var="f" items="${requestScope.Filepath }">
							<tr>
								<td colspan="2"><a
									href="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}">
										${f.fileName}</a></td>
							</tr>
							<c:if test="${f.type =='image' }">
								<tr>
									<td colspan="2"><img
										src="fileDown.do?productphotono=${f.productphotono}&productno=${f.productno}">
									</td>
								</tr>
							</c:if>
						</c:forEach>
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
							<!-- 
							<td><select name="sizeno">
									<c:forEach var="size" items="${requestScope.sizeList }">
										<option value="${size.sizeno }"
											<c:if test="${size.sizeno == requestScope.product.sizeno }">
													selected
												</c:if>>${size.sizekind }
											<c:if test="${size.sizeno == requestScope.product.sizeno }">
												[o]
											</c:if>
										</option>
									</c:forEach>
							</select></td>
							 -->
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
							<!-- 
							<td><select name="colorno">
									<c:forEach var="color" items="${requestScope.colorList }">
										<option value="${color.colorno }"
											<c:if test="${color.colorno == requestScope.product.colorno }">
														selected
													</c:if>>${color.colorname }
											<c:if
												test="${color.colorno == requestScope.product.colorno }">
													[o]
												</c:if>
										</option>
									</c:forEach>
							</select></td>
							 -->
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
								<p class="btn_p">
									<button type="button" id="plus"
										class="btn btn-primary two-btns">+</button>
									<button type="button" id="minus"
										class="btn btn-primary two-btns">-</button>
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
								<button class="btn btn-primary">이미지 업로드</button>
								<button type="button" class="btn btn-primary back-btn"
									onclick="history.back();">뒤로가기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>

</html>