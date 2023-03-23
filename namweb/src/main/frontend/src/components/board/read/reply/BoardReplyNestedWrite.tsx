import classes from "./BoardReplyNestedWrite.module.scss";

import { useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

type BoardReplyNestedNickType = {
  login: {
    nick: string;
  };
};

const BoardReplyNestedWrite = () => {
  const [replyContent, setReplyContent] = useState("");
  const [isTextActive, setIsTextActive] = useState(false);

  const userNick = useReduxSelector(
    (state: BoardReplyNestedNickType) => state.login.nick
  );

  const onReplyTextEntered = (e : React.ChangeEvent<HTMLTextAreaElement>) => {
    setIsTextActive(true);
    const textTmp = e.target.value;

    if(textTmp.length > 300) return;

    setReplyContent(textTmp);
  }

  return (
    <>
      <div className={classes.board_reply}>
        <div className={classes.board_reply_span_box}>
          <span>{userNick}</span>
        </div>
        <textarea
          className={`${classes.board_reply_textarea} ${isTextActive ? classes.board_reply_textarea_active : ''}`}
          placeholder="댓글을 입력해주세요." 
          value={replyContent}
          onChange={onReplyTextEntered}
        ></textarea>
        <div className={classes.board_reply_btn_box}>
          <button className={classes.board_reply_btn}>댓글 작성</button>
        </div>
      </div>
    </>
  );
};

export default BoardReplyNestedWrite;
