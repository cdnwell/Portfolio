import { useState, useEffect } from "react";

import classes from "./EmailButton.module.scss";

import UpdateAni from "../../../animation/UpdateAni";
import axios from "../../../../common/axiosInstance";

const EmailButton: React.FC<{
  emailP: string;
  isEmailChecked: (checked: boolean) => void;
  onEmailIcon: () => void;
}> = ({ emailP, isEmailChecked, onEmailIcon }) => {
  const [email, setNick] = useState("");
  const [isLength, setIsLength] = useState(false);
  const [isNotWord, setIsNotWord] = useState(false);

  useEffect(() => {
    setNick(emailP);
    setIsNotWord(false);
  }, [emailP]);

  const onEmailCheck = () => {
    setIsNotWord(false);
    isEmailChecked(false);
    onEmailIcon();

    if (email.trim().length === 0) {
      setIsLength(true);
      return;
    }
    setIsLength(false);

    const emailRegex = /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,10}\.[a-zA-Z\.]{1,8}/g;

    if (!emailRegex.test(email)) {
      setIsNotWord(true);
      return;
    }
    setIsNotWord(false);

    axios
      .get(`/member/exist?email=${email}`)
      .then((response) => {
        const data = response.data;

        if (data.email) {
          isEmailChecked(true);
        } else {
          isEmailChecked(false);
        }
      })
      .catch((error) => console.log(error));
  };

  return (
    <>
      <button type="button" className={classes.email_button} onClick={onEmailCheck}>
        이메일 중복 확인
      </button>
      {isLength && (
        <p className={classes.email_right}>이메일을 입력해주세요.</p>
      )}
      {isNotWord && (
        <p className={classes.email_right}>
          올바른 이메일 형식이 아닙니다. {"(ooo@ooo.com)"}
        </p>
      )}
    </>
  );
};

export default EmailButton;
