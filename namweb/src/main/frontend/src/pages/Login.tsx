import classes from "./Login.module.scss";

import LoginBox from "../components/login/LoginBox";
import { Routes } from "react-router-dom";
import { Route } from "react-router"
import KakaoLoginRedirect from "../components/login/KakaoLoginRedirect";
import NaverLoginRedirect from "../components/login/NaverLoginRedirect";
import GoogleLoginRedirect from "../components/login/GoogleLoginRedirect";

const Login = () => {
    return <div className={classes.login_root}>
        <LoginBox />
        <Routes>
            <Route path="kakaoLogin" element={<KakaoLoginRedirect />} />
            <Route path="naverLogin" element={<NaverLoginRedirect />} />
            <Route path="googleLogin" element={<GoogleLoginRedirect />} />
        </Routes>
    </div>
}

export default Login;