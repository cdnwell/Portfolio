import kakao_btn from "../../assets/images/icons/kakao_btn.png";
import { REST_API_KEY, REDIRECT_URI } from "../../constant/KakaoConstant";
import classes from "./KakaoLogin.module.scss";

const KakaoLogin = () => {
  const KAKAO_AUTH_URL = `https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code`;

  const onKakaoClick = () => {
    window.location.href = KAKAO_AUTH_URL;
  };

  return (
    <div>
      <img
        src={kakao_btn}
        className={classes.kakao_btn}
        onClick={onKakaoClick}
        alt="카카오 로그인.png"
      />
    </div>
  );
};

export default KakaoLogin;
