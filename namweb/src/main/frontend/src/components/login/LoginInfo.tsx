import { useEffect, useState } from "react";

import classes from "./LoginInfo.module.scss";

import { useDispatch, useSelector as useReduxSelector } from "react-redux";
import { loginActions } from "../store/login";

import axios from "../../common/axiosInstance";
import KakaoPost from "../api/KakaoPost";

const LoginInfo = () => {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [nick, setNick] = useState("");
  const [address, setAddress] = useState("");
  const [phone, setPhone] = useState("");
  const [registerType, setRegisterType] = useState("");

  const searchEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  const dispatch = useDispatch();

  const onLogoutHandler = () => {
    dispatch(loginActions.setLoginInvalid());
  };

  useEffect(() => {
    axios
      .get(`/member/info?email=${searchEmail}`)
      .then((response) => {
        const data = response.data;
        console.log(response);

        const email = data.email;
        const name = data.name;
        const nick = data.nick;
        const address = data.address;
        const phone = data.phone;
        const registerType = data.register_type;

        setEmail(email);
        if (address) setAddress(address);
        else setAddress("주소 정보 없음");
        if (name) setName(name);
        else setName("이름 정보 없음");
        if (nick) setNick(nick);
        else setNick("닉네임 정보 없음");
        if (phone) setPhone(phone);
        else setPhone("010-****-****");

        if (registerType === "kakao") setRegisterType("카카오(로그인) 가입");
        else if (registerType === "naver")
          setRegisterType("네이버(로그인) 가입");
        else if (registerType === "google")
          setRegisterType("구글(로그인) 가입");
        else setRegisterType("홈페이지 가입");
      })
      .catch((error) => console.log(error));
  }, []);

  return (
    <div className={classes.login_info}>
      <h2>Info</h2>
      <span>이메일</span>
      <p>{email}</p>
      <span>
        비밀번호 <button type="button">비밀번호 변경 / 설정</button>
      </span>
      <span>이름</span>
      <p>{name}</p>
      <span>닉네임</span>
      <p>{nick}</p>
      <button type="button">닉네임 변경</button>
      <span>주소</span>
      <KakaoPost />
      <p>{address}</p>
      <button type="button">주소 변경</button>
      <span>전화번호</span>
      <p>{phone}</p>
      <span>가입 방법</span>
      <p>{registerType}</p>
      <div className={classes.logout_button_box}>
        <button
          type="button"
          className={classes.logout_button}
          onClick={onLogoutHandler}
        >
          로그아웃
        </button>
      </div>
    </div>
  );
};

export default LoginInfo;
