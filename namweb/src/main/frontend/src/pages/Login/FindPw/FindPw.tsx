import classes from "./FindPw.module.scss";

import { useState } from "react";

import FindPwPage from "../../../components/login/findpw/FindPwPage";
import FindEnterCode from "../../../components/login/findpw/FindEnterCode";
import RewritePw from "../../../components/login/findpw/RewritePw";

const FindPw = () => {
  const [code, setCode] = useState(-1);
  const [email, setEmail] = useState("");
  const [moveDirection, setMoveDirection] = useState("");
  const [isSuccess, setIsSuccess] = useState(false);

  const onSuccess = (data: { code: number; email: string }) => {
    // setIsSuccess(true);
    setCode(data.code);
    setEmail(data.email);
    console.log("code", data.code);
    setMoveDirection("left");
  };

  const onBackward = () => {
    setMoveDirection("right");
  };

  const onCodeComplete = () => {
    setMoveDirection("re_left");
  }

  return (
    <div className={classes.find_pw_root}>
      <div className={classes.find_pw_box}>
        <p className={classes.find_pw_p}>비밀번호 찾기</p>
        <div className={classes.find_pw_pages}>
          <FindPwPage moveDirection={moveDirection} onSuccess={onSuccess} />
          <FindEnterCode
            moveDirection={moveDirection}
            code={code}
            email={email}
            onBackward={onBackward}
            onCodeComplete={onCodeComplete}
          />
          <RewritePw moveDirection={moveDirection} email={email}/>
        </div>
      </div>
    </div>
  );
};

export default FindPw;
