import { useEffect, useState } from "react";

import classes from "./LoginInfo.module.scss";

import { useDispatch, useSelector as useReduxSelector } from "react-redux";
import { loginActions } from "../store/login";

import axios from "../../common/axiosInstance";
import KakaoPost from "../api/KakaoPost";
import PhoneButton from "./buttons/PhoneButton";
import NameButton from "./buttons/NameButton";
import NickButton from "./buttons/NickButton";
import AddressButton from "./buttons/AddressButton";
import { useNavigate } from "react-router-dom";

const NO_ADDRESS_STR = "주소 정보 없음";
const NO_ADDRESS_DETAIL_STR = "상세 주소 정보 없음";
const NO_NAME_STR = "이름 정보 없음";
const NO_NICK_STR = "닉네임 정보 없음";
const NO_PHONE_STR = "010-0000-0000";

const LoginInfo = () => {
  const [email, setEmail] = useState("");
  const [name, setName] = useState("");
  const [initName, setInitName] = useState("");
  const [nick, setNick] = useState("");
  const [initNick, setInitNick] = useState("");
  const [address, setAddress] = useState("");
  const [initAddress, setInitAddress] = useState("");
  const [addressDetail, setAddressDetail] = useState("");
  const [initAddressDetail, setInitAddressDetail] = useState("");
  const [phone, setPhone] = useState("");
  const [initPhone, setInitPhone] = useState("");
  const [registerType, setRegisterType] = useState("");
  const [isReload, setIsReload] = useState(true);

  const searchEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  const dispatch = useDispatch();
  const navigate = useNavigate();

  const onLogoutHandler = () => {
    dispatch(loginActions.setLoginInvalid());
  };

  const onResultHandler = (result: any) => {
    const address_name = result[0].address_name;
    setAddress(address_name);
  };

  const onReloadClick = () => {
    setIsReload(true);
  };

  useEffect(() => {
    if (!isReload) return;

    axios
      .get(`/member/info?email=${searchEmail}`)
      .then((response) => {
        const data = response.data;

        const email = data.email;
        const name = data.name;
        const nick = data.nick;
        const address = data.address;
        const address_detail = data.address_detail;
        const phone = data.phone;
        const registerType = data.register_type;

        setEmail(email);
        if (address) {
          setAddress(address);
          setInitAddress(address);
        } else {
          setAddress(NO_ADDRESS_STR);
        }
        if (address_detail) {
          setAddressDetail(address_detail);
          setInitAddressDetail(address_detail);
        } else {
          setAddressDetail(NO_ADDRESS_DETAIL_STR);
        }
        if (name) {
          setName(name);
          setInitName(name);
        } else {
          setName(NO_NAME_STR);
        }
        if (nick) {
          setNick(nick);
          setInitNick(nick);
        } else {
          setNick(NO_NICK_STR);
        }
        if (phone) {
          setPhone(phone);
          setInitPhone(phone);
        } else {
          setPhone(NO_PHONE_STR);
        }

        if (registerType === "kakao") setRegisterType("카카오(로그인) 가입");
        else if (registerType === "naver")
          setRegisterType("네이버(로그인) 가입");
        else if (registerType === "google")
          setRegisterType("구글(로그인) 가입");
        else setRegisterType("홈페이지 가입");

        setIsReload(false);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [isReload]);

  const onChangeAddressDetail = (e: React.ChangeEvent<HTMLInputElement>) => {
    const addressDetailTmp = e.target.value;

    if (addressDetailTmp.trim().length > 40) return;

    setAddressDetail(addressDetailTmp);
  };

  const addressDetailPlaceholder =
    addressDetail === NO_ADDRESS_DETAIL_STR
      ? addressDetail
      : addressDetail.trim().length === 0
      ? NO_ADDRESS_DETAIL_STR
      : "";

  const onChangePhone = (e: React.ChangeEvent<HTMLInputElement>) => {
    let phoneTmp = e.target.value;

    if (phoneTmp.length > 13) return;

    phoneTmp = phoneTmp.replace(/[^0-9\-]/g, "");

    setPhone(phoneTmp);
  };

  const phonePlaceholder =
    phone === NO_PHONE_STR
      ? phone
      : phone.trim().length === 0
      ? NO_PHONE_STR
      : "";

  const onChangeName = (e: React.ChangeEvent<HTMLInputElement>) => {
    let nameTmp = e.target.value;

    if (nameTmp.trim().length > 20) return;

    nameTmp = nameTmp.replace(/[^ㄱ-ㅎ가-힣a-zA-Z]/g, "");

    setName(nameTmp);
  };

  const namePlaceholder =
    name === NO_NAME_STR ? name : name.trim().length === 0 ? NO_NAME_STR : "";

  const onChangeNick = (e: React.ChangeEvent<HTMLInputElement>) => {
    let nickTmp = e.target.value;

    if (nickTmp.trim().length > 20) return;

    setNick(nickTmp);
  };

  const nickPlaceholder =
    nick === NO_NICK_STR ? nick : nick.trim().length === 0 ? NO_NICK_STR : "";

  const pwChangeHandler = () => {
    navigate("/login/pw-change");
  };

  return (
    <div className={classes.login_info}>
      <h2>Info</h2>
      <span className={classes.email_span}>이메일</span>
      <p className={classes.email_p}>{email}</p>
      <span className={classes.password_span}>비밀번호</span>
      <button
        type="button"
        className={classes.password_button}
        onClick={pwChangeHandler}
      >
        비밀번호 변경 / 설정
      </button>
      <span className={classes.name_span}>이름</span>
      <input
        className={classes.name_input}
        onChange={onChangeName}
        value={name !== NO_NAME_STR ? name : ""}
        placeholder={namePlaceholder}
      />
      <NameButton
        nameP={name}
        nameInit={initName}
        onReloadClick={onReloadClick}
      />
      <span className={classes.nick_span}>닉네임</span>
      <input
        className={classes.nick_input}
        onChange={onChangeNick}
        value={nick !== NO_NICK_STR ? nick : ""}
        placeholder={nickPlaceholder}
      />
      <NickButton
        nickP={nick}
        nickInit={initNick}
        onReloadClick={onReloadClick}
      />
      <span className={classes.address_span}>주소</span>
      <KakaoPost onResult={onResultHandler} />
      <p className={classes.address_name_p}>{address}</p>
      <span className={classes.address_detail_span}>상세 주소</span>
      <input
        type="text"
        className={classes.address_detail_input}
        onChange={onChangeAddressDetail}
        value={addressDetail !== NO_ADDRESS_DETAIL_STR ? addressDetail : ""}
        placeholder={addressDetailPlaceholder}
      />
      <AddressButton
        addressP={address}
        addressInit={initAddress}
        addressDetailP={addressDetail}
        addressDetailInit={initAddressDetail}
        onReloadClick={onReloadClick}
      />
      <span className={classes.phone_span}>전화번호</span>
      <input
        className={classes.phone_input}
        onChange={onChangePhone}
        value={phone !== NO_PHONE_STR ? phone : ""}
        placeholder={phonePlaceholder}
      />
      <PhoneButton
        phoneP={phone}
        phoneInit={initPhone}
        onReloadClick={onReloadClick}
      />
      <span className={classes.register_type_span}>가입 방법</span>
      <p className={classes.register_type_p}>{registerType}</p>
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
