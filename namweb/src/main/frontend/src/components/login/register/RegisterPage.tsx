import classes from "./RegisterPage.module.scss";

import { useState } from "react";

import KakaoPost from "../../api/KakaoPost";
import EmailButton from "./buttons/EmailButton";

import { AiFillCheckCircle } from "react-icons/ai";
import axios from "../../../common/axiosInstance";
import { useNavigate } from "react-router-dom";
import BackwardButton from "../buttons/BackwardButton";

const RegisterPage = () => {
  const [email, setEmail] = useState("");
  const [pw, setPw] = useState("");
  const [pwRe, setPwRe] = useState("");
  const [name, setName] = useState("");
  const [nick, setNick] = useState("");
  const [address, setAddress] = useState("");
  const [addressDetail, setAddressDetail] = useState("");
  const [phone, setPhone] = useState("");

  const [isEmailEmpty, setIsEmailEmpty] = useState(false);
  const [isEmailDup, setIsEmailDup] = useState(false);
  // 이메일 중복확인 완료 => true
  const [isEmailDupChecked, setIsEmailDupChecked] = useState(false);
  const [isEmailDupNotChecked, setIsEmailDupNotChecked] = useState(false);
  const [isPwEqual, setIsPwEqual] = useState(false);
  const [isPwNotEqual, setIsPwNotEqual] = useState(false);
  const [isPwLength, setIsPwLength] = useState(false);
  const [isPwEmpty, setIsPwEmpty] = useState(false);
  const [isNameEmpty, setIsNameEmpty] = useState(false);
  const [isNameNotCorrect, setIsNameNotCorrect] = useState(false);
  const [isNickEmpty, setIsNickEmpty] = useState(false);
  const [isNickNotCorrect, setIsNickNotCorrect] = useState(false);
  const [isAddressContent, setIsAddressContent] = useState(false);
  const [isAddressNone, setIsAddressNone] = useState(false);
  const [isAddressDetailNone, setIsAddressDetailNone] = useState(false);
  const [isPhoneEmpty, setIsPhoneEmpty] = useState(false);

  const navigate = useNavigate();

  const onResultHandler = (result: any) => {
    const address_name = result[0].address_name;
    setAddress(address_name);
    if (address_name) {
      setIsAddressContent(true);
      setIsAddressNone(false);
    } else {
      setIsAddressContent(false);
    }
  };

  const isEmailChecked = (checked: boolean) => {
    setIsEmailDup(checked);
    if (!checked) setIsEmailDupChecked(true);
  };

  const onEmailIcon = () => {
    setIsEmailDupNotChecked(false);
    setIsEmailEmpty(false);
    setIsEmailDupChecked(false);
  };

  const onChangeEmail = (e: React.ChangeEvent<HTMLInputElement>) => {
    setIsEmailEmpty(false);
    setIsEmailDupChecked(false);
    setIsEmailDupNotChecked(false);
    const emailTmp = e.target.value;

    if (emailTmp.length > 30) return;

    setEmail(emailTmp);
  };

  const onChangePassword = (e: React.ChangeEvent<HTMLInputElement>) => {
    // 비밀번호 입력 시, empty 속성 삭제
    setIsPwEmpty(false);
    const pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    setPw(pwTmp);
  };

  const onChangePasswordRe = (e: React.ChangeEvent<HTMLInputElement>) => {
    // 비밀번호 입력 시, empty 속성 삭제
    setIsPwEmpty(false);
    const pwReTmp = e.target.value;

    if (pwReTmp.length > 20) return;

    if (pw.length < 5 || pwReTmp.length < 5) {
      setIsPwNotEqual(false);
      setIsPwEqual(false);
      setIsPwLength(true);
    } else if (pw !== pwReTmp) {
      setIsPwLength(false);
      setIsPwEqual(false);
      setIsPwNotEqual(true);
    } else if (pw === pwReTmp) {
      setIsPwNotEqual(false);
      setIsPwLength(false);
      setIsPwEqual(true);
    }

    setPwRe(pwReTmp);
  };

  const onChangeAddressDetail = (e: React.ChangeEvent<HTMLInputElement>) => {
    const addressDetailTmp = e.target.value;

    if (addressDetailTmp.trim().length > 40) return;

    if (addressDetailTmp.trim().length === 0) {
      setIsAddressDetailNone(true);
    } else {
      setIsAddressDetailNone(false);
    }

    setAddressDetail(addressDetailTmp);
  };

  const onChangePhone = (e: React.ChangeEvent<HTMLInputElement>) => {
    // phone을 입력 시 empty 속성 삭제
    setIsPhoneEmpty(false);

    let phoneTmp = e.target.value;

    if (phoneTmp.length > 13) return;

    phoneTmp = phoneTmp.replace(/[^0-9\-]/g, "");

    setPhone(phoneTmp);
  };

  const onChangeName = (e: React.ChangeEvent<HTMLInputElement>) => {
    // 이름 입력 시 empty 속성 삭제
    setIsNameEmpty(false);
    let nameTmp = e.target.value;

    if (nameTmp.length > 20) return;

    nameTmp = nameTmp.replace(/[^ㄱ-ㅎ가-힣a-zA-Z ]/g, "");

    const nameRegex = /^([가-힣a-zA-Z] ?){2,20}$/g;

    if (nameRegex.test(nameTmp)) {
      setIsNameNotCorrect(false);
    } else {
      setIsNameNotCorrect(true);
    }

    setName(nameTmp);
  };

  const onChangeNick = (e: React.ChangeEvent<HTMLInputElement>) => {
    // 닉네임을 입력시 empty 속성 삭제
    setIsNickEmpty(false);
    let nickTmp = e.target.value;

    if (nickTmp.length > 15) return;

    const nickRegex = /^([가-힣a-zA-Z] ?){2,20}$/g;

    if (nickRegex.test(nickTmp)) {
      setIsNickNotCorrect(false);
    } else {
      setIsNickNotCorrect(true);
    }

    setNick(nickTmp);
  };

  const onRegisterClick = () => {};

  // form : submit 함수
  const onRegisterSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    // isAddressContent, 주소를 입력하지 않을 경우 false, 입력한 경우 true
    // 1. 유효성 검사

    // 1. 이메일이 입력되지 않을 경우 실행되는 조건
    if (email.length === 0) {
      setIsEmailEmpty(true);
      return;
    }
    setIsEmailEmpty(false);

    // 1.1 이메일이 입력되었으나 중복 확인이 되지 않은 경우
    if (!isEmailDupChecked) {
      setIsEmailDupNotChecked(true);
      setIsEmailEmpty(false);
      setIsEmailDupChecked(false);
      return;
    }
    setIsEmailDupNotChecked(false);

    // 2. 비밀번호 입력 확인 (비밀번호가 동일하지 않을 경우, 비밀번호 미입력)
    if (!isPwEqual) {
      setIsPwEmpty(true);
      setIsPwLength(false);
      setIsPwNotEqual(false);
      return;
    }
    setIsPwEmpty(false);

    // 3. 이름 입력 확인
    if (name.trim().length === 0) {
      setIsNameEmpty(true);
      setIsNameNotCorrect(false);
      return;
    }
    setIsNameEmpty(false);

    // 4. 닉네임 입력 확인
    if (nick.trim().length === 0) {
      setIsNickEmpty(true);
      setIsNickNotCorrect(false);
      return;
    }
    setIsNickEmpty(false);

    // 5. 주소 확인
    if (!isAddressContent) {
      setIsAddressDetailNone(false);
      setIsAddressNone(true);
      return;
    }
    setIsAddressNone(false);

    // 6. 전화번호 확인
    if (phone.length !== 13) {
      setIsPhoneEmpty(true);
      return;
    }
    setIsPhoneEmpty(false);

    // 7. 모든 유효성 확인 완료
    const confirmCheck = confirm("회원가입 하시겠습니까?");

    if (!confirmCheck) return;

    axios
      .post(`/member/register`, {
        email,
        nick,
        pw,
        name,
        phone,
        address,
        address_detail: addressDetail,
      })
      .then((response) => {
        alert("회원 가입이 완료되었습니다.");
        navigate("/login");
      })
      .catch((error) => {
        alert("회원 가입에 실패하였습니다.");
      });
  };

  return (
    <form className={classes.register_page} onSubmit={onRegisterSubmit}>
      <h2>회원 가입</h2>
      <span className={classes.email_span}>이메일</span>
      <input
        className={classes.email_input}
        onChange={onChangeEmail}
        value={email}
        placeholder={"이메일 입력"}
      />
      <div className={classes.email_button_box}>
        <EmailButton
          emailP={email}
          isEmailChecked={isEmailChecked}
          onEmailIcon={onEmailIcon}
        />
        {isEmailDupChecked && (
          <AiFillCheckCircle className={classes.email_checked} />
        )}
      </div>
      {isEmailEmpty && (
        <p className={classes.not_right}>이메일을 입력해주세요.</p>
      )}
      {isEmailDup && <p className={classes.not_right}>이메일이 중복됩니다.</p>}
      {isEmailDupNotChecked && (
        <p className={classes.not_right}>이메일 중복확인을 해주세요.</p>
      )}
      <span className={classes.password_span}>비밀번호</span>
      <input
        type="password"
        className={classes.password_input}
        onChange={onChangePassword}
        value={pw}
        placeholder="비밀번호 입력"
      />
      <input
        type="password"
        className={classes.password_re_input}
        onChange={onChangePasswordRe}
        value={pwRe}
        placeholder="비밀번호 확인(재입력)"
      />
      {isPwEmpty && (
        <p className={classes.not_right}>비밀번호를 입력해주세요.</p>
      )}
      {isPwLength && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          비밀번호는 5글자 이상 적어주세요.
        </p>
      )}
      {isPwNotEqual && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          비밀번호가 일치하지 않습니다.
        </p>
      )}
      {isPwEqual && (
        <p className={`${classes.right} ${classes.margin_p}`}>
          비밀번호가 일치합니다.
        </p>
      )}
      <span className={classes.name_span}>이름</span>
      <input
        className={classes.name_input}
        onChange={onChangeName}
        value={name}
        placeholder={"이름 입력"}
      />
      {isNameEmpty && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          이름을 입력해주세요.
        </p>
      )}
      {isNameNotCorrect && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          이름은 띄어쓰기(1회) 포함한 글자입니다.(2글자 이상)
        </p>
      )}
      <span className={classes.nick_span}>닉네임</span>
      <input
        className={classes.nick_input}
        onChange={onChangeNick}
        value={nick}
        placeholder={"닉네임 입력"}
      />
      {isNickEmpty && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          닉네임을 입력해주세요.
        </p>
      )}
      {isNickNotCorrect && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          닉네임은 띄어쓰기(1회) 포함한 글자입니다.(2글자 이상)
        </p>
      )}
      <span className={classes.address_span}>주소</span>
      <KakaoPost onResult={onResultHandler} />
      <p className={classes.address_name_p}>{address}</p>
      <span className={classes.address_detail_span}>상세 주소</span>
      <input
        type="text"
        className={classes.address_detail_input}
        onChange={onChangeAddressDetail}
        value={addressDetail}
        placeholder={"상세 주소 입력"}
      />
      {isAddressNone && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          주소를 입력해주세요.
        </p>
      )}
      {isAddressDetailNone && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          상세 주소를 입력해주세요.
        </p>
      )}
      <span className={classes.phone_span}>전화번호</span>
      <input
        className={classes.phone_input}
        onChange={onChangePhone}
        value={phone}
        placeholder={"전화번호 입력"}
      />
      {isPhoneEmpty && (
        <p className={`${classes.not_right} ${classes.margin_p}`}>
          올바른 전화번호를 입력해주세요.
        </p>
      )}
      <div className={classes.register_button_box}>
        <button className={classes.register_button} onClick={onRegisterClick}>
          회원가입
        </button>
        <BackwardButton path="/login" />
      </div>
    </form>
  );
};

export default RegisterPage;
