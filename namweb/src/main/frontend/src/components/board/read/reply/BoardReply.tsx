import classes from "./BoardReply.module.scss";

import { useEffect } from "react";
import BoardReplyItem from "./BoardReplyItem";
import BoardReplyWrite from "./BoardReplyWrite";

interface BoardReplyProps {
  bno: string;
}

const BoardReply = ({ bno }: BoardReplyProps) => {
  useEffect(() => {

  }, []);

  return <div className={classes.board_reply}>
    <BoardReplyWrite />
    <BoardReplyItem />
  </div>;
};

export default BoardReply;
