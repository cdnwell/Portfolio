import naver_btn from "../../assets/images/icons/naver_btn.png";

import classes from "./NaverLogin.module.scss";
import { CLIENT_ID, REDIRECT_URI } from "../../constant/NaverConstant";

const NaverLogin = () => {
  const NAVER_AUTH_URL = `https://nid.naver.com/oauth2.0/authorize?client_id=${CLIENT_ID}&response_type=code&redirect_uri=${REDIRECT_URI}`;

  const onNaverLoginClick = () => {
    window.location.href = NAVER_AUTH_URL;
  };

  return (
    <div>
      <img
        src={naver_btn}
        className={classes.naver_btn}
        onClick={onNaverLoginClick}
        alt="네이버 로그인.png"
      />
    </div>
  );
};

export default NaverLogin;
