import classes from "./BoardReplyGroup.module.scss";

import { useState, useEffect } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import BoardReplyItem from "./BoardReplyItem";
import BoardReplyNestedItem from "./BoardReplyNestedItem";

interface BoardReplyGroupProps {
  reply: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    replyLikeNum: number;
  }[];
  represent: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    replyLikeNum: number;
  };
  passedReplyno : number;
  onReplyRootAppendClick: (replyno: number) => void;
  onReplyGroupChanged: () => void;
}

type BoardReplyEmailType = {
  login: {
    email: string;
  };
};

const BoardReplyGroup = ({
  reply,
  represent,
  passedReplyno,
  onReplyRootAppendClick,
  onReplyGroupChanged,
}: BoardReplyGroupProps) => {
  const [boardNestedRepresent, setBoardNestedRepresent] = useState<
    React.ReactNode[]
  >([]);

  const userEmail = useReduxSelector(
    (state: BoardReplyEmailType) => state.login.email
  );

  const onReplyAppendClick = (replyno: number) => {
    if (!userEmail) {
      alert("댓글 작성을 위해 로그인을 해주세요.");
      return;
    }

    onReplyRootAppendClick(replyno);
  };

  useEffect(() => {
    const boardReplyArray: React.ReactNode[] = [];
    const boardNestedArray = reply.filter(
      (item) => item.replyforno === represent.replyno
    );

    boardNestedArray.map((item) => {
      boardReplyArray.push(
        <BoardReplyNestedItem
          key={item.replyno}
          represent={item}
          onReplyAppendClick={onReplyAppendClick}
          onReplyItemChanged={onReplyGroupChanged}
          passedReplyno={passedReplyno}
        />
      );
    });

    setBoardNestedRepresent(boardReplyArray);
  }, [passedReplyno, reply]);

  return (
    <div className={classes.board_reply_group}>
      <BoardReplyItem
        represent={represent}
        onReplyAppendClick={onReplyAppendClick}
        onReplyItemChanged={onReplyGroupChanged}
        passedReplyno={passedReplyno}
      />
      {boardNestedRepresent}
    </div>
  );
};

export default BoardReplyGroup;
