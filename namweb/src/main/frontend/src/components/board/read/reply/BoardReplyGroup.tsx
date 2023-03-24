import classes from "./BoardReplyGroup.module.scss";

import { useState, useEffect } from "react";
import { useDispatch, useSelector as useReduxSelector } from "react-redux";

import BoardReplyItem from "./BoardReplyItem";
import BoardReplyNestedWrite from "./BoardReplyNestedWrite";
import BoardReplyNestedGroup from "./BoardReplyNestedGroup";
import { replyActions } from "../../../store/reply";

interface BoardReplyGroupProps {
  reply: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    rLikeNum: number;
  }[];
  represent: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    rLikeNum: number;
  };
}

type BoardRepresentType = {
  replyno: number;
  bno: number;
  replyforno: number;
  email: string;
  nick: string;
  content: string;
  replyDate: string;
  rLikeNum: number;
};

type BoardReplyEmailType = {
  login: {
    email: string;
  };
};

const BoardReplyGroup = ({ reply, represent }: BoardReplyGroupProps) => {
  const [boardNestedRepresent, setBoardNestedRepresent] =
    useState<BoardRepresentType[]>([]);
  const [isReplyAppend, setIsReplyAppend] = useState(false);

  const userEmail = useReduxSelector(
    (state: BoardReplyEmailType) => state.login.email
  );

  const onReplyAppendClick = () => {
    if (!userEmail) {
      alert("댓글 작성을 위해 로그인을 해주세요.");
      return false;
    }

    setIsReplyAppend((prevState) => !prevState);
    return true;
  };

  useEffect(() => {
    // console.log('reply',reply);
    console.log('represent',represent);

    const boardNestedArray = reply.filter(
      (item) => item.replyforno === represent.replyno
    );

    console.log('boardNestedArray',boardNestedArray);

    setBoardNestedRepresent(boardNestedArray);
  }, []);


  return (
    <div className={classes.board_reply_group}>
      <BoardReplyItem
        represent={represent}
        onReplyAppendClick={onReplyAppendClick}
      />
      {isReplyAppend && <BoardReplyNestedWrite />}
      {boardNestedRepresent && <BoardReplyNestedGroup represent={boardNestedRepresent} />}
    </div>
  );
};

export default BoardReplyGroup;
