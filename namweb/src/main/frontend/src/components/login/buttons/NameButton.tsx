import { useEffect, useState } from "react";
import axios from "../../../common/axiosInstance";

import classes from "./NameButton.module.scss";

import { useSelector as useReduxSelector } from "react-redux";

const NameButton: React.FC<{ nameP: string; nameInit : string }> = ({ nameP, nameInit }) => {
  const [name, setName] = useState("");
  const [initName, setInitName] = useState("");
  const [isNoName, setIsNoName] = useState(false);
  const [isNameLong, setIsNameLong] = useState(false);
  const [isInitName, setIsInitName] = useState(false);

  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setName(nameP);
  }, [nameP]);

  useEffect(()=>{
    setInitName(nameInit);
  },[nameInit]);

  const onNameClick = () => {
    if (name.trim().length === 0) {
      setIsNoName(true);
      return;
    }
    setIsNoName(false);

    const regex = /[ㄱ-ㅎ]/g;

    if (regex.test(name)) {
      setIsNoName(true);
      return;
    }
    setIsNoName(false);

    if (name.trim().length > 20) {
      setIsNameLong(true);
      return;
    }
    setIsNameLong(false);

    if (initName === name) {
      setIsInitName(true);
      return
    }
    setIsInitName(false);

    const changeSelect =  confirm("이름을 변경하시겠습니까?");

    if(!changeSelect) return;

    axios
      .post("/member/update/name", { email: userEmail, name: name })
      .then((response) => console.log(response))
      .catch((error) => console.log(error));
  };

  return (
    <>
      <button className={classes.name_button} onClick={onNameClick}>
        이름 변경
      </button>
      {isNoName && <p className={classes.name_right}>이름을 입력해주세요.</p>}
      {isNameLong && (
        <p className={classes.name_right}>
          이름은 20글자 이하로 입력가능합니다.
        </p>
      )}
      {isInitName && <p className={classes.name_right}>기존의 이름과 같은 이름입니다.</p>}
    </>
  );
};

export default NameButton;
