import classes from "./BoardReply.module.scss";

import { useState, useEffect } from "react";
import { useDispatch } from "react-redux";

import BoardReplyWrite from "./BoardReplyWrite";
import BoardReplyList from "./BoardReplyList";
import { replyActions } from "../../../store/reply";

interface BoardReplyProps {
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
  bno: string;
  onBoardReplyChanged: () => void;
};

const BoardReply = ({ reply, bno, onBoardReplyChanged }: BoardReplyProps) => {
  const dispatch = useDispatch();

  useEffect(()=>{
    dispatch(replyActions.setIsReplyUpdate(false));
  },[]);

  return (
    <div className={classes.board_reply}>
      <BoardReplyWrite bno={bno} onReplyWriteChanged={onBoardReplyChanged} />
      <BoardReplyList reply={reply} onReplyListChanged={onBoardReplyChanged}/>
    </div>
  );
};

export default BoardReply;
