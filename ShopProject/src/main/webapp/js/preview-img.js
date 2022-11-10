/**
 * 변경 상태
 * 0 : 이미지 없음
 * 1 : 이미지 있음
 * 2 : 이미지가 있던 상태에서 변경 됨
 * 3 : 이미지가 있던 상태에서 한 번 더 변경 됨 -> 변경 될 경우 2가 됨
 */
 
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