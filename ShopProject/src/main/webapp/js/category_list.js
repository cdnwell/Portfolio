var array;

$.ajax({
	url: 'category-list.do',
	success: function(list) {
		array = list;
		var tag = '';
		for (i = 0; i < list.length; i++) {
			if(list[i].categoryno % 100 == 0 )
				tag += '<li><a href="category_simple_view.do?categoryno=' + list[i].categoryno + '">' + list[i].categoryname + ' <span class="category_li_dot"></span></a></li>';
		}
		$('.category_ul').append(tag);
		
		var categoryno = $('.category_ul a:eq(0)').attr('href');
		var index = categoryno.indexOf('=');
		categoryno = categoryno.substring(index+1,categoryno.length); 
		
		$('.category_ul a:eq(0)').children('span').html(' ⚬ ');
		
		var tagP = '';
		
		for(i=0;i<array.length;i++){
			if(array[i].categoryfor == categoryno){
				tagP += '<li><a href="category_detail_view.do?categoryno=' + array[i].categoryno + '">' + array[i].categoryname + '</a></li>';
			}
		}
		
		$('.category_ul_det').append(tagP);
	}
});

$(function(){
	$(document).on('mouseover','.category_ul a',function(){
		$('.category_ul_det').empty();
		var categoryno = $(this).attr('href');
		var index = categoryno.indexOf('=');
		categoryno = categoryno.substring(index+1,categoryno.length); 
		
		$('.category_li_dot').html('');
		$(this).children('span').html(' ⚬ ');
		
		var tag = '';
		
		for(i=0;i<array.length;i++){
			if(array[i].categoryfor == categoryno){
				tag += '<li><a href="category_detail_view.do?categoryno=' + array[i].categoryno + '">' + array[i].categoryname + '</a></li>';
			}
		}
		
		$('.category_ul_det').append(tag);
	});
});
