import classes from "./BoardReply.module.scss";

import { useEffect } from "react";
import BoardReplyWrite from "./BoardReplyWrite";
import BoardReplyGroup from "./BoardReplyGroup";
import BoardReplyList from "./BoardReplyList";

interface BoardReplyProps {
  reply: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
  }[];
};

const BoardReply = ({ reply }: BoardReplyProps) => {
  useEffect(() => {}, []);

  return (
    <div className={classes.board_reply}>
      <BoardReplyWrite />
      <BoardReplyList reply={reply} />
    </div>
  );
};

export default BoardReply;
