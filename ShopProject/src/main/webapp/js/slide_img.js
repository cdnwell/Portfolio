function right_slide(arr_img_src, arr_img){
    const arr_cpy = [...arr_img];
    const slide_img_ea = arr_img_src.length;

    for(i=0;i<5;i++){
        if(i===0){
            //1번째 이미지의 클래스명을 가져온다.
            const className = arr_img[0].attr('class');
            //숫자 파싱
            const number = parseInt(className.substr(className.indexOf('imgb'),5).replace(/[^0-9]/g,''));
            arr_img[0] = arr_img_src[(number+slide_img_ea-1)%slide_img_ea];
            continue;
        }
        arr_img[i] = arr_cpy[i-1];
    }
}

function left_slide(arr_img_src, arr_img){
    const arr_cpy = [...arr_img];
    const slide_img_ea = arr_img_src.length;

    for(i=0;i<5;i++){
        if(i===4){
            //4번째 이미지의 클래스명을 가져온다.
            const className = arr_img[4].attr('class');
            //숫자 파싱
            const number = parseInt(className.substr(className.indexOf('imgb'),5).replace(/[^0-9]/g,''));
            arr_img[4] = arr_img_src[(number+1) % slide_img_ea];
            continue;
        }
        arr_img[i] = arr_cpy[i+1];
    }
}

function img_join(arr_img){
    const arr_tmp = [];
    let arr_join = '';

    for(i=0;i<5;i++){
        const img_src = arr_img[i].attr('src');
        const img_class = arr_img[i].attr('class');
        const img_tmp = '<img class="'+img_class+'" src="'+img_src+'">';
        arr_tmp.push(img_tmp);
    }

    arr_join = arr_tmp.join('');
    
    return arr_join;
}

$(function(){
    //아래 이미지 클릭시 썸네일 이미지로 변화
    //동적엘리먼트 처리
    $(document).on('click','.stage-img',function(){
        const img_src = $(this).attr('src');
        $('.thumb_img img').attr('src',img_src);
    });

    const slide_img = $('.footer-stage img');
    const slide_img_ea = slide_img.length;
    const imgb_nav = $('.imgb-nav');

    // slide할 이미지를 arr_img 배열에 저장
    // src 참조용
    const arr_img_src = [];
    for(i=0;i<slide_img_ea;i++){
        slide_img.eq(i).addClass("imgb"+i);
        arr_img_src.push(slide_img.eq(i));
    }

    //초기화
    const arr_img = [];
    for(i=0;i<5;i++){
        if(i===0){
            arr_img.push(slide_img.eq(slide_img_ea-1));
            continue;
        }
        arr_img.push(slide_img.eq((i - 1) % slide_img_ea));
    }

    //이미지 추가(초기화)
    $('.footer-stage').empty();
    const arr_join_init = img_join(arr_img);
    $('.footer-stage').prepend(arr_join_init);

    // 이미지가 1개일 경우 -> 표시 x
    if (slide_img_ea === 2){
        imgb_nav.addClass('disabled');
    } else if (slide_img_ea === 1){
        slide_img.addClass('disabled');
        imgb_nav.addClass('disabled');
    }

    $('.imgb-prev').click(function(){
        let slide_width = parseInt($('.footer-stage').css('width')) / 5;
        $('.stage-img').css('transform','translateX(-'+slide_width+'px)');
        setTimeout(function(){
            left_slide(arr_img_src, arr_img);
            $('.footer-stage').empty();
            const arr_join = img_join(arr_img);
            $('.footer-stage').prepend(arr_join);
        },300);
    });

    $('.imgb-next').click(function(){
        let slide_width = parseInt($('.footer-stage').css('width')) / 5;
        $('.stage-img').css('transform','translateX('+slide_width+'px)');
        setTimeout(function(){
            right_slide(arr_img_src, arr_img);
            $('.footer-stage').empty();
            const arr_join = img_join(arr_img);
            $('.footer-stage').prepend(arr_join);
        },300);
    });

});