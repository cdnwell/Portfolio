import classes from "./BoardReplyList.module.scss";

import { useEffect, useState } from "react";
import BoardReplyGroup from "./BoardReplyGroup";
import boardReplyRangeFunc from "../../../../common/boardReplyRangeFunc";

interface BoardReplyListProps {
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
  onReplyListChanged: () => void;
}

const BoardReplyList = ({ reply, onReplyListChanged }: BoardReplyListProps) => {
  const [boardReplyGroup, setBoardReplyGroup] = useState<React.ReactNode[]>([]);
  const [replyno, setReplyno] = useState<number>();

  const onReplyRootAppendClick = (replyno: number) => {
    setReplyno(replyno);
  };

  useEffect(() => {

    const boardReplyArray: React.ReactNode[] = [];
    let boardReplyRange = [...reply];

    boardReplyRange = boardReplyRangeFunc(boardReplyRange);

    boardReplyRange.map((item) => {
      if (item.replyforno === -1) {
        boardReplyArray.push(
          <BoardReplyGroup
            key={item.replyno}
            reply={reply}
            represent={item}
            onReplyRootAppendClick={onReplyRootAppendClick}
            onReplyGroupChanged={onReplyListChanged}
            passedReplyno={replyno ?? -1}
          />
        );
      } else if (item.replyforno === -2) {
        let itemTmp = item;
        itemTmp.content = "삭제된 댓글입니다.";

        boardReplyArray.push(
          <BoardReplyGroup
            key={item.replyno}
            reply={reply}
            represent={itemTmp}
            onReplyRootAppendClick={onReplyRootAppendClick}
            onReplyGroupChanged={onReplyListChanged}
            passedReplyno={replyno ?? -1}
          />
        );
      }
    });

    setBoardReplyGroup(boardReplyArray);
  }, [replyno, reply]);

  return <>{boardReplyGroup}</>;
};

export default BoardReplyList;
