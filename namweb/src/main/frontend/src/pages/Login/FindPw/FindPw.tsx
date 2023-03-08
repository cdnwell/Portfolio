import classes from "./FindPw.module.scss";

import { useState } from "react";

import FindPwPage from "../../../components/login/findpw/FindPwPage";
import FindEnterCode from "../../../components/login/findpw/FindEnterCode";

const FindPw = () => {
  const [code, setCode] = useState(-1);
  const [isSuccess, setIsSuccess] = useState(false);

  const onSuccess = (code: number) => {
    setIsSuccess(true);
    setCode(code);
    console.log("code", code);
  };

  return (
    <div className={classes.find_pw_root}>
      <div className={classes.find_pw_box}>
        <p className={classes.find_pw_p}>비밀번호 찾기</p>
        {!isSuccess && <FindPwPage onSuccess={onSuccess} />}
        {isSuccess && <FindEnterCode code={code}/>}
      </div>
    </div>
  );
};

export default FindPw;
