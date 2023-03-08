import classes from "./FindPwPage.module.scss";

import { useState } from "react";

import axios from "../../../common/axiosInstance";

import BackwardButton from "../buttons/BackwardButton";

const FindPwPage: React.FC<{ onSuccess: (code : number) => void }> = ({ onSuccess }) => {
  const [email, setEmail] = useState("");
  const [buttonStr, setButtonStr] = useState("비밀번호 찾기");
  const [isFail, setIsFail] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);
  const [isEmpty, setIsEmpty] = useState(false);
  const [isFormNotCorrect, setIsFormNotCorrect] = useState(false);

  const [isChange, setIsChange] = useState(false);

  const onEmailEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    const emailEntered = e.target.value;
    setIsEmpty(false);
    setIsFormNotCorrect(false);

    setEmail(emailEntered);
  };

  const onPwFindClick = () => {
    if (email.trim().length === 0) {
      setIsEmpty(true);
      return;
    }

    const emailRegex = /[a-zA-Z0-9]@[a-zA-Z0-9]{1,15}\.[a-zA-Z0-9\.]{1,10}/g;

    if (!emailRegex.test(email)) {
      setIsFormNotCorrect(true);
      return;
    }

    console.log(email);

    axios
      .get(`/login/find-email?email=${email}`)
      .then((response) => {
        console.log(response);
        const code = response.data;

        if (code === -1) throw new Error();

        setIsChange(true);

        setTimeout(() => {
          onSuccess(code);
        }, 500);
      })
      .catch((error) => {
        console.log(error);
        setIsFail(true);
        setTimeout(() => {
          setButtonStr("이메일로 가입한 계정이 없습니다.");
        }, 200);

        setTimeout(() => {
          setIsFail(false);
          setButtonStr("비밀번호 찾기");
        }, 2000);
      });
  };

  const fail_class = isFail ? classes.find_pw_fail : "";

  const success_class = isChange ? classes.find_pw_div_change : "";

  return (
    <div className={`${classes.find_pw_div} ${success_class}`}>
      <div className={classes.find_pw_span_div}>
        <label className={classes.find_pw_span} htmlFor="email">
          이메일(E-mail)
        </label>
      </div>
      <input
        id="email"
        type="text"
        className={classes.find_pw_input}
        placeholder="이메일을 입력해주세요."
        onChange={onEmailEntered}
        value={email}
      />
      {isEmpty && <p className={classes.not_right}>이메일을 입력해주세요</p>}
      {isFormNotCorrect && (
        <p className={classes.not_right}>
          이메일 형식이 올바르지 않습니다.(예) test@email.com
        </p>
      )}
      <div className={classes.find_pw_button_div}>
        <button
          className={`${classes.find_pw_button} ${fail_class}`}
          onClick={onPwFindClick}
        >
          {buttonStr}
        </button>
        <BackwardButton path="/login" />
      </div>
    </div>
  );
};

export default FindPwPage;
