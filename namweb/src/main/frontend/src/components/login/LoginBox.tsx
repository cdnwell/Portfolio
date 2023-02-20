import { Link } from "react-router-dom";
import GoogleLogin from "../api/GoogleLogin";
import KakaoLogin from "../api/KakaoLogin";
import NaverLogin from "../api/NaverLogin";

import classes from "./LoginBox.module.scss";

const LoginBox = () => {
    return (
        <>
        <span className={classes.login_span}>로그인</span>
        <form className={classes.login_box}>
            <input type="text" className={classes.id_input} placeholder="아이디" />
            <input type="text" className={classes.pw_input} placeholder="비밀번호" />
            <button type="button" className={classes.login_button}>로그인</button>
            <div className={classes.register_box}>
                <Link className={classes.register_link} to="/login/register">회원가입</Link>
                <Link className={classes.id_pw_find_link} to="/login/find-id-pw">아이디/비밀번호 찾기</Link>
            </div>
            <div className={classes.login_api_box}>
                <KakaoLogin />
                <NaverLogin />
                <GoogleLogin />
            </div>
        </form>
        </>
    )
}  

export default LoginBox;