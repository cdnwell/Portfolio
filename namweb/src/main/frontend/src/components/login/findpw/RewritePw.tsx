import classes from "./RewritePw.module.scss";

import { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "../../../common/axiosInstance";

const RewritePw: React.FC<{ moveDirection: string; email: string }> = ({
  moveDirection,
  email,
}) => {
  const [moveClass, setMoveClass] = useState("");
  const [pw, setPw] = useState("");
  const [pwRe, setPwRe] = useState("");
  const [isEmpty, setIsEmpty] = useState(false);
  const [isShort, setIsShort] = useState(false);
  const [isPwNotSame, setIsPwNotSame] = useState(false);
  const [isPwSame, setIsPwSame] = useState(false);

  const navigate = useNavigate();

  useEffect(() => {
    if (moveDirection === "left") {
      setMoveClass(classes.rewrite_pw_left_one);
    } else if (moveDirection === "right") {
      setMoveClass(classes.rewrite_pw_right_one);
    } else if (moveDirection === "re_left") {
      setMoveClass(classes.rewrite_pw_left_two);
    }
  }, [moveDirection]);

  const onPwChangeClick = () => {
    axios
      .post("/member/update/pw", { email, pw })
      .then((response) => {
        console.log(response);
        alert("비밀번호가 변경되었습니다.");

        navigate("/login");
      })
      .catch((error) => {
        console.log(error);

        alert("비밀번호 변경에 실패하였습니다.");
      });
  };

  const onPwChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setIsEmpty(false);
    const pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    comparePw(pwTmp, pwRe);

    setPw(pwTmp);
  };

  const onPwReChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setIsEmpty(false);
    const pwTmp = e.target.value;

    if (pwTmp.length > 20) return;

    comparePw(pwTmp, pw);

    setPwRe(pwTmp);
  };

  const comparePw = (pw :string , cmpPw : string) => {
    if (pw.trim().length === 0 || cmpPw.trim().length === 0) {
        setIsEmpty(true);
        setIsPwNotSame(false);
        setIsPwSame(false);
        setIsShort(false);
      } else if (pw.trim().length < 5 || cmpPw.trim().length < 5) {
        setIsShort(true);
        setIsPwNotSame(false);
        setIsPwSame(false);
        setIsEmpty(false);
      } else if (pw !== cmpPw) {
        setIsPwNotSame(true);
        setIsEmpty(false);
        setIsPwSame(false);
        setIsShort(false);
      } else if (pw === cmpPw) {
        setIsPwSame(true);
        setIsPwNotSame(false);
        setIsEmpty(false);
        setIsShort(false);
      }
  }

  return (
    <div className={`${classes.rewrite_pw} ${moveClass}`}>
      <label htmlFor="pw_one" className={classes.pw_one_label}>
        새로운 비밀번호 입력
      </label>
      <input
        type="password"
        id="pw_one"
        className={classes.pw_input}
        placeholder="새 비밀번호를 입력해주세요"
        onChange={onPwChange}
        value={pw}
      />
      <input
        type="password"
        className={classes.pw_re_input}
        placeholder="비밀번호를 다시 입력해주세요"
        onChange={onPwReChange}
        value={pwRe}
      />
      {isEmpty && <p className={classes.not_right}>비밀번호를 입력해주세요.</p>}
      {isShort && (
        <p className={classes.not_right}>비밀번호는 5자리 이상 입력해주세요.</p>
      )}
      {isPwNotSame && (
        <p className={classes.not_right}>비밀번호 번호가 일치하지 않습니다.</p>
      )}
      {isPwSame && <p className={classes.right}>비밀번호 일치합니다.</p>}
      <div className={classes.btn_box}>
        <button className={classes.pw_change_btn} onClick={onPwChangeClick}>
          비밀번호 변경
        </button>
        <Link className={classes.cancel_btn} to={"/login"}>
          취소하기
        </Link>
      </div>
    </div>
  );
};

export default RewritePw;
