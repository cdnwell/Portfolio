import google_btn from "../../assets/images/icons/google_btn.png";

import classes from "./GoogleLogin.module.scss";
import { API_KEY, CLIENT_ID } from "../../constant/GoogleConstant";
import axios from "../../common/axiosInstance";

const GoogleLogin = () => {
//   const GOOGLE_AUTH_URL = `https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=${API_KEY}`;
  const GOOGLE_AUTH_URL = `https://accounts.google.com/o/oauth2/v2/auth`+
  `?client_id=${CLIENT_ID}` +
  `&redirect_uri=http://localhost:5173/login/googleLogin` +
  `&scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile`+
  `&response_type=code`;

  const onGoogleLoginClick = () => {
    window.location.href = GOOGLE_AUTH_URL;
  };

  return (
    <div>
      <img
        src={google_btn}
        className={classes.google_btn}
        onClick={onGoogleLoginClick}
        alt="구글 로그인.png"
      />
    </div>
  );
};

export default GoogleLogin;
