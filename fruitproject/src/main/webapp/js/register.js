var id_chk_flag = false;
var change_flag = false;

var nick_chk_flag = false;
var nick_change_flag = false;

function id_chk() {
    const regex = /^[a-zA-Z0-9]*$/;
    var id = $('.register_id_box input').val();
    var id_p = $('.id_chk');

    id_p.css('color', 'red');
    id_p.css('display', 'block');
	
	if(change_flag){
        id_chk_flag = false;
        change_flag = false;
    }

    if (!regex.test(id)) {
        id_p.html('아이디는 영어 혹은 숫자로 이루어져야만 합니다.');
        id_chk_flag = false;
        return false;
    }

    if (id.length < 4 || id.length > 8) {
        id_p.html('아이디는 4-8자로 입력해주세요');
        id_chk_flag = false;
        return false;
    }

    if (!id_chk_flag) {
        id_p.html('아이디 중복 확인을 해주세요');
        id_chk_flag = false;
        return false;
    }

    id_p.css('color', 'blue');
    id_p.html('아이디가 유효합니다.');
    change_flag = true;
    return true;
}
function pass_chk() {
    const regex = /^[a-zA-Z0-9]*$/;
    var pass1 = $('.password_box1 input').val();
    var pass2 = $('.password_box2 input').val();
    var pass_p = $('.pass_chk');

    pass_p.css('color', 'red');
    pass_p.css('display', 'block');
    if (!regex.test(pass1) || !regex.test(pass2)) {
        pass_p.html('패스워드는 영어 혹은 숫자로 이루어져야만 합니다.');
        return false;
    }

    if ((pass1.length < 6 || pass1.length > 20) || (pass2.length < 6 || pass2.length > 20)) {
        pass_p.html('패스워드는 6-20자를 입력해주세요.');
        return false;
    }

    if (pass1 != pass2) {
        pass_p.html('패스워드가 일치하지 않습니다.')
        return false;
    }

    pass_p.css('color', 'blue');
    pass_p.html('패스워드가 유효합니다.');
    return true;
}
function name_chk() {
    const regex = /^[가-힣]*$/
    var name = $('.name_chk').val();
    var name_p = $('.register_name_chk');

    name_p.css('color', 'red');
    name_p.css('display', 'block');
    if (!regex.test(name)) {
        name_p.html('이름은 한글만 허용됩니다.');
        return false;
    }

    if (name.length > 8 || name.length < 1) {
        name_p.html('이름은 1-8글자 까지만 허용됩니다.')
        return false;
    }

    name_p.css('color', 'blue');
    name_p.html('이름이 유효합니다.');
    return true;
}
function nick_chk() {
    const regex = /^[a-zA-Z0-9가-힣]*$/;
    var nick = $('.register_nick_box input').val();
    var nick_p = $('.nick_chk');

	if(nick_change_flag){
        nick_chk_flag = false;
        nick_change_flag = false;
    }

    nick_p.css('color', 'red');
    nick_p.css('display', 'block');
    if (!regex.test(nick)) {
        nick_p.html('닉네임은 한글 혹은 영어 숫자로 이루어져야 합니다.');
        return false;
    }

    if (nick.length > 10 || nick.length < 2) {
        nick_p.html('닉네임은 2-10 글자가 가능합니다.');
        return false;
    }
    
    if(!nick_chk_flag){
		nick_p.html('닉네임 중복을 확인해주세요.');
		return false;
	}

    nick_p.css('color', 'blue');
    nick_p.html('허용 가능한 닉네임입니다.');
    nick_change_flag = true;
    return true;

}

function email_chk() {
    var email = $('.email_input').val();
    var email_p = $('.email_chk');

    email_p.css('color', 'red');
    email_p.css('display', 'block');

    if (email.length > 14 || email.length < 4) {
        email_p.html('이메일 주소는 4-14자리 까지 가능합니다.');
        return false;
    }

    email_p.css('color', 'blue');
    email_p.html('가능한 이메일입니다.');
    return true;
}


