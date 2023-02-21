import axios from "../../common/axiosInstance";
import { REST_API_KEY, REDIRECT_URI } from "../../constant/KakaoConstant";
import classes from "./KakaoLogin.module.scss";

const KakaoLogin = () => {
  const KAKAO_AUTH_URL = `https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code`;

  const onKakaoClick = () => {
    console.log("kakao login clicked");
    window.location.href = KAKAO_AUTH_URL;
  };

  return (
    <div>
      <img
        src="icons/kakao_btn.png"
        className={classes.kakao_btn}
        onClick={onKakaoClick}
        alt="카카오 로그인.png"
      />
    </div>
  );
};

export default KakaoLogin;
