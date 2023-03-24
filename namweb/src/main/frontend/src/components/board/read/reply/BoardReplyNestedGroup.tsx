import classes from "BoardReplyNestedGroup.module.scss";

import { useState, useEffect } from "react";
import { useDispatch, useSelector as useReduxSelector } from "react-redux";
import BoardReplyNestedWrite from "./BoardReplyNestedWrite";

import BoardReplyNestedItem from "./BoardReplyNestedItem";
import { replyActions } from "../../../store/reply";

interface BoardReplyNestedGroupProps {
  represent: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    rLikeNum: number;
  }[];
}

type ReduxEmailType = {
  login: {
    email: string;
  };
};


const BoardReplyNestedGroup = ({ represent }: BoardReplyNestedGroupProps) => {
  const [isReplyAppend, setIsReplyAppend] = useState(false);

  const userEmail = useReduxSelector(
    (state: ReduxEmailType) => state.login.email
  );

  const onReplyAppendClick = () => {
    if (!userEmail) {
      alert("댓글 작성을 위해 로그인을 해주세요.");
      return false;
    }

    setIsReplyAppend((prevState) => !prevState);
    return true;
  };

  return (
    <>
      {represent[0] && (
        <BoardReplyNestedItem
          represent={represent[0]}
          onReplyAppendClick={onReplyAppendClick}
        />
      )}
      {isReplyAppend && <BoardReplyNestedWrite />}
    </>
  );
};

export default BoardReplyNestedGroup;
