import classes from "./BoardReplyItem.module.scss";

import { BsHandThumbsUp, BsHandThumbsDown } from "react-icons/bs";

const BoardReplyItem = () => {
  return (
    <div className={classes.board_reply_item}>
      <div className={classes.board_reply_nick_box}>
        <span></span>
        <span>닉네임</span>
        <span className={classes.board_reply_comment}>댓글 달기</span>
      </div>
      <div className={classes.board_reply_content}>
        dipiscing elit. Phasellus tincidunt tincidunt venenatis. Nunc a libero
        tortor. Praesent et nisl fermentum, mattis ligula quis, gravida metus.
        Aliquam id porttitor mauris, sit amet tincidunt neque. Pellentesque
        habitant morbi tristique senectus et netus et malesuada fames ac turpis
        egestas. Cras tempus ante metus, quis ullamcorper lacus lacinia et.
        Aliquam erat volutpat. Suspendisse felis est, elementum sed ligula sit
        amet, bibendum pretium turpis. Aenean pretium vel enim ut pretium. Nam
        in justo blandit, feugiat arcu vel, posuere enim. Nulla mattis felis
        elit, at ma
      </div>
      <div className={classes.board_reply_up_date_box}>
        <div className={classes.board_reply_hands}>
          <div>
            <BsHandThumbsUp className={classes.board_reply_up}/>
            <span className={classes.board_reply_up_num}>1</span>
          </div>
          <BsHandThumbsDown className={classes.board_reply_down}/>
        </div>
        <div className={classes.board_reply_date_box}>
          <span className={classes.board_reply_date}>2023-03-12</span>
        </div>
      </div>
    </div>
  );
};

export default BoardReplyItem;
