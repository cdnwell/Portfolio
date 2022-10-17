$(function(){
	//login button > 로그인 실행
    $('.login_btn_frm').click(function(){
    	var d = "id="+$('.login_frm_id').val()+"&pass=" + $('.login_frm_pass').val();            	
    	console.log(d);
    	$.ajax({
    		url : 'login',
    		data : d,
    		type : 'post',
    		success : function(r){
    			if(r == 0){
    				alert('존재하지 않는 이메일이거나 비밀번호가 틀렸습니다.');
    			}else{
    				//로그인에 성공하면 페이지를 새로고침 한다.
    				location.href='/';
    			}
    		}
    	});
    });
    
    //login input > 엔터 > 로그인 실행
    //id input
    $('.login_frm_id').on('keyup',function(key){
    	if(key.keyCode == 13){
    		$('.login_btn_frm').trigger('click');
    	}
    });
    //password input
    $('.login_frm_pass').on('keyup',function(key){
    	if(key.keyCode == 13){
    		$('.login_btn_frm').trigger('click');
    	}
    });
});