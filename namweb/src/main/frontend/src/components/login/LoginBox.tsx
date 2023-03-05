import { useState } from "react";

import classes from "./LoginBox.module.scss";

import { Link, useNavigate } from "react-router-dom";
import GoogleLogin from "../api/GoogleLogin";
import KakaoLogin from "../api/KakaoLogin";
import NaverLogin from "../api/NaverLogin";
import axios from "../../common/axiosInstance";
import { useDispatch } from "react-redux";
import { loginActions } from "../store/login";

const LoginBox = () => {
  const [email, setEmail] = useState("");
  const [pw, setPw] = useState("");
  const [loginContent, setLoginContent] = useState("로그인");

  const navigate = useNavigate();
  const dispatch = useDispatch();

  const loginSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    axios
      .post("/member/login", { email, pw })
      .then((response) => {
        const data = response.data;

        if (data === "") throw new Error("로그인 정보가 올바르지 않습니다.");

        let name = "";
        if (data.name) name = data.name;
        else if (data.nick) name = data.nick;
        const email = data.email;

        dispatch(loginActions.setLoginInfo({ email, name }));

        navigate("/");
      })
      .catch((error) => {
        setLoginContent("로그인 정보가 올바르지 않습니다.");
        setTimeout(() => {
          setLoginContent("로그인");
        }, 2000);
      });
  };

  const onEmailEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    setEmail(e.target.value);
  };

  const onPwEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    setPw(e.target.value);
  };

  return (
    <>
      <span className={classes.login_span}>Login</span>
      <form className={classes.login_box} onSubmit={loginSubmit}>
        <div className={classes.login_input_box}>
          <input
            className={classes.id_input}
            placeholder="이메일"
            onChange={onEmailEntered}
            value={email}
          />
          <input
            type="password"
            className={classes.pw_input}
            placeholder="비밀번호"
            onChange={onPwEntered}
            value={pw}
          />
          <button className={classes.login_button}>{loginContent}</button>
          <div className={classes.register_box}>
            <Link className={classes.register_link} to="/login/register">
              회원가입
            </Link>
            {"|"}
            <Link className={classes.id_pw_find_link} to="/login/find-id-pw">
              아이디/비밀번호 찾기
            </Link>
          </div>
          <div className={classes.login_api_box}>
            <KakaoLogin />
            <NaverLogin />
            <GoogleLogin />
          </div>
        </div>
      </form>
    </>
  );
};

export default LoginBox;
