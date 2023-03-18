import { useEffect, useState } from "react";
import classes from "./PhoneButton.module.scss";

import axios from "../../../common/axiosInstance";

import { useSelector as useReduxSelector } from "react-redux";
import UpdateAni from "../../animation/UpdateAni";

const PhoneButton: React.FC<{
  phoneP: string;
  phoneInit: string;
  onReloadClick: () => void;
}> = ({ phoneP, phoneInit, onReloadClick }) => {
  const [phone, setPhone] = useState("");
  const [initPhone, setInitPhone] = useState("");
  const [isZeroStart, setIsZeroStart] = useState(false);
  const [isFullNumber, setIsFullNumber] = useState(false);
  const [isInitPhone, setIsInitPhone] = useState(false);
  const [isUpdate, setIsUpdate] = useState(false);

  const user_email = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setPhone(phoneP);
  }, [phoneP]);

  useEffect(() => {
    setInitPhone(phoneInit);
  }, [phoneInit]);

  const onPhoneClick = () => {
    setIsInitPhone(false);
    setIsZeroStart(false);
    setIsFullNumber(false);

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

    if (initPhone === phone) {
      setIsInitPhone(true);
      return;
    }
    setIsInitPhone(false);

    const changeSelect = confirm("전화번호를 변경하시겠습니까?");

    if (!changeSelect) return;

    phoneUpdate(phoneRep);
  };

  const phoneUpdate = (phoneRep: string) => {
    axios
      .put("/member/phone", { phone: phoneRep, email: user_email })
      .then((response) => {
        onReloadClick();
        setIsUpdate(true);
        setTimeout(() => {
          setIsUpdate(false);
        }, 2000);
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
      {isInitPhone && (
        <p className={classes.phone_right}>
          기존의 전화번호와 같은 이름입니다.
        </p>
      )}
      {isUpdate && <UpdateAni content="업데이트 완료" />}
    </>
  );
};

export default PhoneButton;
