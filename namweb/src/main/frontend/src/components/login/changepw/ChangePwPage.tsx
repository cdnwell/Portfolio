import classes from "./ChangePwPage.module.scss";

import { useState, useEffect } from "react";
import axios from "../../../common/axiosInstance";
import { useSelector as useReduxSelector } from "react-redux";
import BackwardButton from "../buttons/BackwardButton";
import { useNavigate } from "react-router-dom";

const ChangePwPage = () => {
  const [msg, setMsg] = useState("");
  const [isPwExist, setIsPwExist] = useState(false);
  const [existPw, setExistPw] = useState("");
  const [pw, setPw] = useState("");
  const [pwRe, setPwRe] = useState("");
  const [isEmpty, setIsEmpty] = useState(false);
  const [isLen, setIsLen] = useState(false);
  const [isEqual, setIsEqual] = useState(false);
  const [isEmptySub, setIsEmptySub] = useState(false);
  const [isLenSub, setIsLenSub] = useState(false);

  const navigate = useNavigate();

  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    axios
      .get(`/member/pw?email=${userEmail}`)
      .then((response) => {
        const isExist = response.data;

        if (isExist) {
          setMsg("기존 비밀번호와 새 비밀번호를 입력해주세요.");
          setIsPwExist(true);
        } else {
          setMsg("설정할 비밀번호를 입력해주세요.");
          setIsPwExist(false);
        }
      })
      .catch((error) => {});
  }, []);

  const existPwHandler = (e: React.ChangeEvent<HTMLInputElement>) => {
    clearSubState();
    let pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    checkExistPw(pwTmp);

    setExistPw(pwTmp);
  };

  const pwHandler = (e: React.ChangeEvent<HTMLInputElement>) => {
    clearIsState();
    let pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    comparePw(pwTmp, pwRe);

    setPw(pwTmp);
  };

  const pwReHandler = (e: React.ChangeEvent<HTMLInputElement>) => {
    clearIsState();
    let pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    comparePw(pwTmp, pw);

    setPwRe(pwTmp);
  };

  // 1. 기존 비밀번호 체크 함수
  const checkExistPw = (pw: string) => {
    if (pw.trim().length === 0) {
      setIsEmptySub(true);
      return false;
    }
    if (pw.length < 5) {
      setIsLenSub(true);
      return false;
    }

    return true;
  };

  const clearSubState = () => {
    setIsEmptySub(false);
    setIsLenSub(false);
  };

  // 2. 새로운 비밀번호(2개) 체크 함수
  const comparePw = (pw: string, cmpPw: string) => {
    if (pw.trim().length === 0 || cmpPw.trim().length === 0) {
      setIsEmpty(true);
      return false;
    }
    if (pw.length < 5 || cmpPw.length < 5) {
      setIsLen(true);
      return false;
    }
    if (pw === cmpPw) {
      setIsEqual(true);
      return true;
    }

    return true;
  };

  const clearIsState = () => {
    setIsEmpty(false);
    setIsLen(false);
    setIsEqual(false);
  };

  // Submit - 버튼 눌릴경우 실행되는 함수
  const onChangePw = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (isPwExist) {
      if (!checkExistPw(existPw)) return;
    }

    if (!comparePw(pw, pwRe)) return;

    if (isPwExist) {
      axios
        .post("/member/update/exist-pw", {
          email: userEmail,
          pw: existPw,
          changePw: pw,
        })
        .then((response) => {
          const isChanged = response.data;

          if (isChanged) {
            alert("비밀번호가 변경되었습니다.");

            navigate("/login");
          } else {
            alert("기존 비밀번호를 확인해주세요. (비밀번호 변경 실패)");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      axios
        .post("/member/update/pw", { email: userEmail, pw: pw })
        .then((response) => {
          const isChanged = response.data;

          if (isChanged) {
            alert("비밀번호가 설정되었습니다.");

            navigate("/login");
          } else {
            alert("비밀번호가 설정에 실패하였습니다.");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    }
  };

  return (
    <form className={classes.change_pw} onSubmit={onChangePw}>
      <h3 className={classes.change_pw_h3}>비밀번호 변경 / 설정</h3>
      <p className={classes.msg_p}>{msg}</p>
      {isPwExist && (
        <div className={classes.exist_pw_div}>
          {" "}
          <div className={classes.exist_pw_p_div}>
            <p className={classes.exist_pw_p}>기존 비밀번호</p>
          </div>
          <input
            type="password"
            className={classes.exist_pw_input}
            placeholder="기존 비밀번호를 입력해주세요."
            onChange={existPwHandler}
            value={existPw}
          />
          <div className={classes.not_right_p_box}>
            {isEmptySub && (
              <p className={classes.not_right_sub}>비밀번호를 입력해주세요.</p>
            )}
            {isLenSub && (
              <p className={classes.not_right_sub}>
                비밀번호는 5글자 이상이어야 합니다.
              </p>
            )}
          </div>
        </div>
      )}
      <div className={classes.new_pw_div}>
        <p className={classes.new_pw_p}>새로운 비밀번호</p>
        <input
          type="password"
          className={classes.new_pw_input}
          placeholder="비밀번호를 입력해주세요."
          onChange={pwHandler}
          value={pw}
        />
        <input
          type="password"
          className={classes.new_pw_re_input}
          placeholder="비밀번호를 다시 입력해주세요."
          onChange={pwReHandler}
          value={pwRe}
        />
      </div>
      {isEmpty && <p className={classes.not_right}>비밀번호를 입력해주세요.</p>}
      {isLen && (
        <p className={classes.not_right}>비밀번호는 5글자 이상이어야 합니다.</p>
      )}
      {isEqual && <p className={classes.right}>비밀번호가 동일합니다.</p>}
      <div className={classes.btn_box}>
        <button className={classes.set_pw_btn}>비밀번호 설정</button>
        <BackwardButton path="/login" />
      </div>
    </form>
  );
};

export default ChangePwPage;
