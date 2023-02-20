import classes from "./KakaoLogin.module.scss";

const KakaoLogin = () => {

    
    const onKakaoClick = () => {

    };

    return <div>
         <img src="icons/kakao_btn.png" className={classes.kakao_btn} onClick={onKakaoClick} alt="카카오 로그인.png" />
    </div>
}

export default KakaoLogin;