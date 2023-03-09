import classes from "./FindEnterCode.module.scss";

import { useEffect, useState } from "react";

import axios from "../../../common/axiosInstance";
import BackwardButton from "../buttons/BackwardButton";

const FindEnterCode: React.FC<{
  code: number;
  email: string;
  moveDirection: string;
  onBackward: () => void;
}> = ({ code, email, moveDirection, onBackward }) => {
  const [codeEntered, setCodeEntered] = useState<number | null>(null);
  const [codeOrigin, setCodeOrigin] = useState<number>();
  const [isBackward, setIsBackward] = useState(false);
  const [btnStc, setBtnStr] = useState("코드 입력");

  const onCodeEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    let codeTmp = e.target.value;

    if (codeTmp.length > 6) return;

    codeTmp = codeTmp.replace(/[^\d]+/g, "");

    if (codeTmp.trim() === "") {
      setCodeEntered(null);
      return;
    }

    const result = Number(codeTmp);

    setCodeEntered(result);
  };

  useEffect(() => {
    setCodeOrigin(code);
  }, [code]);

  const onCodeBtnClick = () => {
    
  };

  const onReSendClick = () => {
    console.log("email", email);

    axios
      .get(`/login/find-email?email=${email}`)
      .then((response) => {
        console.log(response);
        const code = response.data;

        setCodeOrigin(code);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const onBackwardHandler = () => {
    onBackward();
  };

  let move_class = "";

  if (moveDirection === "left") {
    move_class = classes.find_enter_left;
  } else if (moveDirection === "right") {
    move_class = classes.find_enter_right;
  }

  const backward_class = isBackward ? classes.find_enter_change : "";

  return (
    <div className={`${classes.find_enter_code} ${move_class}`}>
      <label htmlFor="code" className={classes.code_label}>
        이메일로 받은 코드
      </label>
      <input
        id="code"
        type="text"
        className={classes.code_input}
        onChange={onCodeEntered}
        value={codeEntered ?? ""}
        placeholder="코드를 입력해주세요."
      />
      <div className={classes.btn_box}>
        <button className={classes.enter_code_btn} onClick={onCodeBtnClick}>
          코드 입력
        </button>
        <button className={classes.email_send_btn} onClick={onReSendClick}>
          이메일 다시 보내기
        </button>
      </div>
      <button className={classes.backward_button} onClick={onBackwardHandler}>
        뒤로 가기
      </button>
    </div>
  );
};

export default FindEnterCode;
