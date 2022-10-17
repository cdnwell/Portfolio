$(function(){
	//login (anchor)
    $('.login_btn').click(function () {
        $('#login').css('display', 'block');

        //body를 스크롤 못하게 막는 함수
        $('body').addClass('hidden');
        //레이어팝업 외 영역 클릭시 이벤트 발생시키는 클래스
        $('#login').addClass('layerPop');
        $('#login_frm').addClass('layerPop');
        $('#login_frm').children().addClass('layerPop');
        $('.login_img_box').children().addClass('layerPop');
        $('#custom-login-btn').addClass('layerPop');
        $('#custom-login-btn').children().addClass('layerPop');
		$('#naver_id_login').children().addClass('layerPop');
		$('#naver_id_login').children().children().addClass('layerPop');
    });
    
    //register (anchor)
    $('.register_btn').click(function () {
        $('#register').css('display', 'block');

        //body를 스크롤 못하게 막는 함수
        $('body').addClass('hidden');
        //레이어팝업 외 영역 클릭시 이벤트 발생시키는 클래스
        $('#register').addClass('layerPop');
        $('#register').children().addClass('layerPop');
        $('#register p').addClass('layerPop');
        $('.register_id_box').addClass('layerPop');
        $('.register_id_box').children().addClass('layerPop');
        $('.password_boxes').addClass('layerPop');
        $('.password_box1').addClass('layerPop');
        $('.password_box1').children().addClass('layerPop');
        $('.password_box2').addClass('layerPop');
        $('.password_box2').children().addClass('layerPop');
        $('.pass_chk').addClass('layerPop');
        $('.register_nick_box').addClass('layerPop');
        $('.register_nick_box').children().addClass('layerPop');
        $('.nick_chk').addClass('layerPop');
        $('.register_email_box').addClass('layerPop');
        $('.register_email_box').children().addClass('layerPop');
        $('.register_btn_box').addClass('layerPop');
        $('.register_btn_box').children().addClass('layerPop');
    });
    
    //회원가입 페이지 - input 유효성 체크 부분
    $(".password_box1 input").keyup(pass_chk);
    $(".password_box2 input").keyup(pass_chk);
    $(".register_nick_box input").keyup(nick_chk);
    $(".register_id_box input").keyup(id_chk);
    $(".email_input").keyup(email_chk);

    $('.register_btn_two').click(function(r){
        if(!id_chk_flag && !id_chk()){
            r.preventDefault();
        }else if(!pass_chk()){
            r.preventDefault();
        }else if(!nick_chk_flag && !nick_chk()){
            r.preventDefault();
        }else if(!email_chk()){
            r.preventDefault();
        }
    });
    
    //회원가입 페이지 - 아이디 중복확인 버튼 누르면 실행
    $('.id_chk_btn').click(function(){
        var d = 'id='+$('.register_id_box input').val();
        console.log(d);
        $.ajax({
            url : 'idChk',
            data : d,
            success : function(r){
                if(r==0){
                    id_chk_flag = true;
                    id_chk();
                } else {
                    id_chk_flag = false;
                    var id_p = $('.id_chk');
                    id_p.css('color','red');
                    id_p.html('아이디가 중복됩니다.');
                }
            }
        });
    });
    
    //회원가입 페이지 - 닉네임 중복확인 버튼 누르면 실행
    $('.nick_chk_btn').click(function(){
        var d = 'nick='+$('.register_nick_box input').val();
        console.log(d);
        $.ajax({
            url : 'nickChk',
            data : d,
            success : function(r){
                if(r==0){
                    nick_chk_flag = true;
                    nick_chk();
                } else {
                    nick_chk_flag = false;
                    var nick_p = $('.nick_chk');
                    nick_p.css('color','red');
                    nick_p.html('닉네임이 중복됩니다.');
                }
            }
        });
    });
    
    //회원 등록 button 클릭 > 회원등록
    
    $('.register_btn_two').click(function(){
    	var d = 'id='+$('.register_id_box input').val()+'&pass='+$('.password_box1 input').val()
    	+'&nick='+$('.register_nick_box input').val() +'&email='+$('.email_input').val();
    	if($('.email_sel').val()==1){
    		d += '@naver.com';
    	}else if($('.email_sel').val()==2){
    		d += '@hanmail.net';
    	}else if($('.email_sel').val()==3){
    		d += '@gmail.com';
    	}
    	console.log(d);
    	$.ajax({
    		url : 'register',
    		data : d,
    		dataType : 'json',
    		type : 'post',
    		success : function(r){
    			if(r==1){
    				alert("회원가입에 성공하였습니다.");
    				location.href="/";
    			}else{
    				alert("회원가입에 실패하였습니다.");
    			}
    		}
    	});
    });
    
    
    
    //로그인, 회원가입 레이어 팝업 영역 외 클릭시 사라짐
    var login_btn = false;
    var register_btn = false;
    var login_in = false;
    var register_in = false;

    //login (anchor)
    $('.login_btn').click(function () {
        $('#login').css('display', 'block');
        $('#register').css('display', 'none');
        //body를 스크롤 못하게 막는 함수
        $('body').addClass('hidden');
        //레이어팝업 외 영역 클릭시 이벤트 발생시키는 클래스
        login_btn = true;
    });

    //register (anchor)
    $('.register_btn').click(function () {
        $('#register').css('display', 'block');
        $('#login').css('display', 'none');
        //body를 스크롤 못하게 막는 함수
        $('body').addClass('hidden');
        //레이어팝업 외 영역 클릭시 이벤트 발생시키는 클래스
        register_btn = true;
    });

    

    $('#login').mouseenter(function(){
        console.log('login in');
        login_in = true;
    });

    $('#login').mouseleave(function(){
        console.log('login out');
        login_in = false;
    });

    $('#register').mouseenter(function(){
        console.log('login in');
        register_in = true;
    });

    $('#register').mouseleave(function(){
        console.log('login out');
        register_in = false;
    });

    $('html').click(function(e){
        if(login_btn && !login_in && !$(e.target).hasClass('layerPop')){
            $('#login').css('display','none');
            $('body').removeClass('hidden');
            login_btn = false;
        }

        if(register_btn && !register_in && !$(e.target).hasClass('layerPop')){
            $('#register').css('display','none');
            $('body').removeClass('hidden');
            register_btn = false;
        }
    });
    
    
});