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
    rLikeNum: number;
  }[];
}

const BoardReplyList = ({ reply }: BoardReplyListProps) => {
  const [boardReplyGroup, setBoardReplyGroup] = useState<React.ReactNode[]>([]);

  useEffect(() => {
    const boardReplyArray : React.ReactNode[] = [];
    let boardReplyRange = [...reply];

    // 1. 댓글 시간 순서대로 정렬
    boardReplyRange = boardReplyRangeFunc(boardReplyRange);

    console.log("range", boardReplyRange);

    boardReplyRange.map((item) => {
      if (item.replyforno === -1) {
        boardReplyArray.push(
          <BoardReplyGroup key={item.replyno} reply={reply} represent={item} />
        );
      }
    });
    
    setBoardReplyGroup(boardReplyArray);
  }, []);

  return <>{boardReplyGroup}</>;
};

export default BoardReplyList;
