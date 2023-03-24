import classes from "./BoardReplyNestedItem.module.scss";

import { useState } from "react";
import dateToString from "../../../../common/dateToString";

import { BsHandThumbsUp, BsHandThumbsDown } from "react-icons/bs";

interface BoardReplyItemProps {
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
  onReplyAppendClick: () => boolean;
}

const BoardReplyNestedItem = ({
  represent,
  onReplyAppendClick,
}: BoardReplyItemProps) => {
  const [isReplyOpen, setIsReplyOpen] = useState(false);

  const onReplyClick = () => {
    const isAppendAble = onReplyAppendClick();

    if (isAppendAble) 
      setIsReplyOpen((prevState) => !prevState);
  };

  let replyDate = dateToString(represent.replyDate);
  const replySpan = isReplyOpen ? "닫기" : "댓글 달기";

  return (
    <div className={classes.board_reply_item}>
      <div className={classes.board_reply_item_left_border}></div>
      <div className={classes.board_reply_nick_box}>
        <span></span>
        <span>{represent.nick}</span>
        <span className={classes.board_reply_comment} onClick={onReplyClick}>
          {replySpan}
        </span>
      </div>
      <div className={classes.board_reply_content}>{represent.content}</div>
      <div className={classes.board_reply_up_date_box}>
        <div className={classes.board_reply_hands}>
          <div>
            <BsHandThumbsUp className={classes.board_reply_up} />
            <span className={classes.board_reply_up_num}>
              {represent.rLikeNum}
            </span>
          </div>
          <BsHandThumbsDown className={classes.board_reply_down} />
        </div>
        <div className={classes.board_reply_date_box}>
          <span className={classes.board_reply_date}>{replyDate}</span>
        </div>
      </div>
    </div>
  );
};

export default BoardReplyNestedItem;
