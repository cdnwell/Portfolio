import classes from "./Login.module.scss";

import LoginBox from "../components/login/LoginBox";
import { Routes } from "react-router-dom";
import { Route } from "react-router"
import KakaoLoginRedirect from "../components/login/KakaoLoginRedirect";

const Login = () => {
    return <div className={classes.login_root}>
        <LoginBox />
        <Routes>
            <Route path="kakaoLogin" element={<KakaoLoginRedirect />} />
        </Routes>
    </div>
}

export default Login;