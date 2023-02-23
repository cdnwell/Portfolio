/**
 * 카트 리스트를 불러오는 자바스크립트입니다.
 */
 $(function(){
		var total_price = 0;
		var total_ea = 0;
		$.ajax({
			url : 'cart_list.do',
			dataType : 'json',
			success : function(r){
				var arr = r.list;
				var data = "";
				for(i=0;i<arr.length;i++){
					data += "<div class='cart_item'>";
					data += "<div class='cart_img'>";
					data += "<a href='#'><img src='prImageDown.do?productno="+arr[i].productno+"' alt=''></a></div>";
					data += "<div class='cart_info'>";
					data += "<a href='#'>"+arr[i].productname+"</a>";
					data += "<p class='pr_info' style='margin:2px 0;'>"+arr[i].colorname+" ("+arr[i].sizekind+")"+"</p>";
					data += "<p class='pr_quantity'>"+arr[i].quantity+" x";
					data += "<span class='pr_price'> &#8361;"+arr[i].price.toLocaleString('ko-KR')+"</span></p></div>";
					data += "<input type='hidden' name='cartno' value='"+arr[i].cartno+"'>";
					data += "<div class='cart_remove'>";
					data += "<a style='cursor : pointer;'><i class='ion-ios-close-outline'></i></a></div></div>";
					total_price += arr[i].price*arr[i].quantity;
					var price = total_price.toLocaleString('ko-KR');
					total_ea += 1;
				}
				$('.cart_gallery').append(data);
				
				if(price == undefined){
					price = 0;
				}
				$('.price').html('&#8361; '+price);
				
				if(total_ea > 0)
					$('.before_item_count').after(`<span class="item_count">`+total_ea+`</span>`);
			}
		});
		$(document).on('click','.cart_remove a',function(){
			var cartno = $(this).parent().parent().children("input[name=cartno]").val();
			var only_productno = $(this).parent().parent().children("input[type=hidden]").val();
			var deleteTag = false;
			$.ajax({
				url : 'cart_delete.do',
				data : {
					deleteTag, cartno
				},
				type : 'post',
				dataType : 'json',
				success : function(r){
					if(r == 0){
						alert('카트 목록 삭제에 실패하였습니다.');
					} else {
						console.log('데이터 삭제 완료');
						deleteTag = true;
					}
					
					if(deleteTag){
						var vTag =$('.cart_item').children('input[name=cartno]').val();
						console.log('value',vTag);
						var pTag =$('.cart_item').children('input[value="'+cartno+'"]').parent();
						pTag.remove();
						var tagInfo = pTag.children('div[class="cart_info"]').children('[class="pr_quantity"]').text();
						
						// 문자('x')를 기준으로 가격과 갯수 나눠서 arr 배열에 넣기
						var arr= tagInfo.split('x');
						
						//지워지는 태그의 가격, 갯수 구하기
						var pr_quantity = arr[0].trim();
						var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 매칭하는 정규식
						var pr_price = arr[1].trim().replace(regex, "");		//정규식을 이용해 숫자만 추출
						
						var tot_price = $('.price').text();
						tot_price = tot_price.trim().replace(regex, "");
						
						tot_price -= pr_price * pr_quantity;
						
						var price = tot_price.toLocaleString('ko-KR');
						
						//가격 입력
						if(price == undefined){
							price = 0;
						}
						$('.price').html('&#8361; '+price);
						
						//숫자 개수 아이콘 그리기
						var total_ea = $('.item_count').text()-1;
						if(total_ea > 0)
							$('.before_item_count').after(`<span class="item_count">`+total_ea+`</span>`);
						else
							$('.item_count').remove();
					}
				}
			});
		});
	});