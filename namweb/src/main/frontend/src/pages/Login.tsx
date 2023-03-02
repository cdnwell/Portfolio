import classes from "./Login.module.scss";

import { useEffect, useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import { Routes } from "react-router-dom";
import { Route } from "react-router";

import LoginBox from "../components/login/LoginBox";
import KakaoLoginRedirect from "../components/login/redirect/KakaoLoginRedirect";
import NaverLoginRedirect from "../components/login/redirect/NaverLoginRedirect";
import GoogleLoginRedirect from "../components/login/redirect/GoogleLoginRedirect";
import LoginInfo from "../components/login/LoginInfo";

const Login = () => {
  const [isLoading, setIsLoading] = useState(false);

  const isLoggedIn = useReduxSelector(
    (state: { login: { isLoggedIn: boolean } }) => state.login.isLoggedIn
  );

  const onLoginHandler = (status: boolean) => {
    setIsLoading(status);
  };

  return (
    <div className={classes.login_root}>
      {!isLoggedIn && !isLoading && <LoginBox />}
      {isLoggedIn && !isLoading && <LoginInfo />}
      <Routes>
        <Route
          path="kakaoLogin"
          element={<KakaoLoginRedirect onLoginHandler={onLoginHandler} />}
        />
        <Route
          path="naverLogin"
          element={<NaverLoginRedirect onLoginHandler={onLoginHandler} />}
        />
        <Route
          path="googleLogin"
          element={<GoogleLoginRedirect onLoginHandler={onLoginHandler} />}
        />
      </Routes>
    </div>
  );
};

export default Login;
