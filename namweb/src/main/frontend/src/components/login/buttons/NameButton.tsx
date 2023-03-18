import { useEffect, useState } from "react";
import axios from "../../../common/axiosInstance";

import classes from "./NameButton.module.scss";

import { useSelector as useReduxSelector } from "react-redux";
import UpdateAni from "../../animation/UpdateAni";

const NameButton: React.FC<{
  nameP: string;
  nameInit: string;
  onReloadClick: () => void;
}> = ({ nameP, nameInit, onReloadClick }) => {
  const [name, setName] = useState("");
  const [initName, setInitName] = useState("");
  const [isNoName, setIsNoName] = useState(false);
  const [isInitName, setIsInitName] = useState(false);
  const [isUpdate, setIsUpdate] = useState(false);

  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setName(nameP);
  }, [nameP]);

  useEffect(() => {
    setInitName(nameInit);
  }, [nameInit]);

  const onNameClick = () => {
    setIsNoName(false);
    setIsInitName(false);

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

    if (initName === name) {
      setIsInitName(true);
      return;
    }
    setIsInitName(false);

    const changeSelect = confirm("이름을 변경하시겠습니까?");

    if (!changeSelect) return;

    axios
      .put("/member/name", { email: userEmail, name: name })
      .then((response) => {
        onReloadClick();
        setIsUpdate(true);
        setTimeout(()=>{
          setIsUpdate(false);
        },2000);
      })
      .catch((error) => console.log(error));
  };

  return (
    <>
      <button className={classes.name_button} onClick={onNameClick}>
        이름 변경
      </button>
      {isNoName && <p className={classes.name_right}>이름을 입력해주세요.</p>}
      {isInitName && (
        <p className={classes.name_right}>기존의 이름과 같은 이름입니다.</p>
      )}
      {isUpdate && <UpdateAni content="업데이트 완료" />}
    </>
  );
};

export default NameButton;
