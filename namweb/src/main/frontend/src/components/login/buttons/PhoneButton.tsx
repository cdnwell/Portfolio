import { useEffect, useState } from "react";
import classes from "./PhoneButton.module.scss";

import axios from "../../../common/axiosInstance";

import { useSelector as useReduxSelector } from "react-redux";

const PhoneButton: React.FC<{ phoneNumber: string }> = ({ phoneNumber }) => {
  const [phone, setPhone] = useState(phoneNumber);
  const [isZeroStart, setIsZeroStart] = useState(false);
  const [isFullNumber, setIsFullNumber] = useState(false);

  const user_email = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setPhone(phoneNumber);
  }, [phoneNumber]);

  const onPhoneClick = () => {
    let phoneRep = phone;

    let phoneFront = phoneRep.substring(0, 3);

    if (phoneFront !== "010") {
      setIsZeroStart(true);
      return;
    }
    setIsZeroStart(false);

    if (phoneRep.length !== 13) {
      setIsFullNumber(true);
      return;
    }
    setIsFullNumber(false);

    phoneUpdate(phoneRep);
  };

  const phoneUpdate = (phoneRep: string) => {
    axios
      .post("/member/update/phone", { phone: phoneRep, email: user_email })
      .then((response) => {
        console.log(response);
      })
      .catch((error) => console.log(error));
  };

  return (
    <>
      <button className={classes.phone_button} onClick={onPhoneClick}>
        전화번호 변경
      </button>
      {isZeroStart && (
        <p className={classes.phone_right}>
          전화번호가 올바르지 않습니다. (010으로 시작하지 않음)
        </p>
      )}
      {isFullNumber && (
        <p className={classes.phone_right}>전화번호를 모두 적어주세요.</p>
      )}
    </>
  );
};

export default PhoneButton;
