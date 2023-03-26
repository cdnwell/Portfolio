import classes from "./BoardReplyNestedWrite.module.scss";

import { useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import axios from "../../../../common/axiosInstance";

type NickReduxType = {
  login: {
    nick: string;
  };
};

type EmailReduxType = {
  login: { email: string };
};

interface BoardReplyNestedWriteProps {
  bno: number;
  replyno: number;
  onReplyChanged : () => void;
}

const BoardReplyNestedWrite = ({
  bno,
  replyno,
  onReplyChanged,
}: BoardReplyNestedWriteProps) => {
  const [replyContent, setReplyContent] = useState("");
  const [isTextActive, setIsTextActive] = useState(false);

  const userNick = useReduxSelector((state: NickReduxType) => state.login.nick);

  const userEmail = useReduxSelector(
    (state: EmailReduxType) => state.login.email
  );

  const onReplyTextEntered = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    setIsTextActive(true);
    const textTmp = e.target.value;

    if (textTmp.length > 300) return;

    setReplyContent(textTmp);
  };

  const onReplyClick = () => {
    if (replyContent.trim().length === 0) {
      alert("댓글을 입력해주세요.");
      return;
    }

    const confirmSelect = confirm("댓글을 입력하시겠습니까?");
    if (!confirmSelect) return;

    axios
      .post("/board/bulletin/reply", {
        bno: bno,
        replyforno: replyno,
        email : userEmail,
        nick: userNick,
        content: replyContent,
      })
      .then((res) => {
        setReplyContent("");
        
        onReplyChanged();
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <>
      <div className={classes.board_reply}>
        <div className={classes.board_reply_span_box}>
          <span>{userNick}</span>
        </div>
        <textarea
          className={`${classes.board_reply_textarea} ${
            isTextActive ? classes.board_reply_textarea_active : ""
          }`}
          placeholder="댓글을 입력해주세요."
          value={replyContent}
          onChange={onReplyTextEntered}
        ></textarea>
        <div className={classes.board_reply_btn_box}>
          <button className={classes.board_reply_btn} onClick={onReplyClick}>
            댓글 작성
          </button>
        </div>
      </div>
    </>
  );
};

export default BoardReplyNestedWrite;
