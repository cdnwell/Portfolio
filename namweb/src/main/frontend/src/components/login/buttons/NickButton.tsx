import { useState, useEffect } from "react";

import classes from "./NickButton.module.scss";

import axios from "../../../common/axiosInstance";
import { useSelector as useReduxSelector } from "react-redux";
import UpdateAni from "../../animation/UpdateAni";

const NickButton: React.FC<{
  nickP: string;
  nickInit: string;
  onReloadClick: () => void;
}> = ({ nickP, nickInit, onReloadClick }) => {
  const [nick, setNick] = useState("");
  const [initNick, setInitNick] = useState("");
  const [isLength, setIsLength] = useState(false);
  const [isNotWord, setIsNotWord] = useState(false);
  const [isInitNick, setIsInitNick] = useState(false);
  const [isUpdate, setIsUpdate] = useState(false);

  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  useEffect(() => {
    setNick(nickP);
  }, [nickP]);

  useEffect(() => {
    setInitNick(nickInit);
  }, [nickInit]);

  const onNickClick = () => {
    setIsLength(false);
    setIsNotWord(false);
    setIsInitNick(false);

    let nickTmp = nick;

    if (nickTmp.trim().length === 0) {
      setIsLength(true);
      return;
    }
    setIsLength(false);

    const regex = /[^가-힣a-zA-Z0-9]/g;

    if (regex.test(nickTmp)) {
      setIsNotWord(true);
      return;
    }
    setIsNotWord(false);

    if (initNick === nick) {
      setIsInitNick(true);
      return;
    }
    setIsInitNick(false);

    const changeSelect = confirm("이름을 변경하시겠습니까?");

    if (!changeSelect) return;

    axios
      .post("/member/update/nick", { email: userEmail, nick: nick })
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
      <button className={classes.nick_button} onClick={onNickClick}>
        닉네임 변경
      </button>
      {isLength && <p className={classes.nick_right}>닉네임을 입력해주세요.</p>}
      {isNotWord && (
        <p className={classes.nick_right}>
          닉네임은 영어, 한글, 숫자로 구성되어야 합니다.
        </p>
      )}
      {isInitNick && (
        <p className={classes.nick_right}>기존의 닉네임과 같은 닉네임입니다.</p>
      )}
      {isUpdate && <UpdateAni />}
    </>
  );
};

export default NickButton;
