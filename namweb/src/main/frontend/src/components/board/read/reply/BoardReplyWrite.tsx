import classes from "./BoardReplyWrite.module.scss";

import { useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";
import { Link } from "react-router-dom";
import axios from "../../../../common/axiosInstance";

type NameReduxType = {
  login: { nick: string };
};

type EmailReduxType = {
  login: { email: string };
};

interface BoardReplyWriteProps {
  bno: string;
  onReplyWriteChanged: () => void;
}

const BoardReplyWrite = ({ bno, onReplyWriteChanged }: BoardReplyWriteProps) => {
  const [replyContent, setReplyContent] = useState("");
  const [isTextActive, setIsTextActive] = useState(false);

  const userNick = useReduxSelector((state: NameReduxType) => state.login.nick);
  const userEmail = useReduxSelector((state : EmailReduxType) => state.login.email);

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
    if(!confirmSelect) return;

    axios
      .post("/board/bulletin/reply", {
        bno: bno,
        replyforno: -1,
        email : userEmail,
        nick : userNick,
        content: replyContent,
      })
      .then((res) => {
        setReplyContent("");

        onReplyWriteChanged();
      })
      .catch((err) => {
        console.log(err);
      });
  };

  return (
    <>
      {userNick && (
        <div className={classes.board_reply}>
          <div className={classes.board_reply_span_box}>
            <span>{userNick}</span>
          </div>
          <textarea
            className={`${classes.board_reply_textarea} ${
              isTextActive ? classes.board_reply_textarea_active : ""
            }`}
            placeholder="댓글을 입력해주세요."
            onChange={onReplyTextEntered}
            value={replyContent}
          ></textarea>
          <div className={classes.board_reply_btn_box}>
            <button className={classes.board_reply_btn} onClick={onReplyClick}>
              댓글 작성
            </button>
          </div>
        </div>
      )}
      {!userNick && (
        <div className={classes.board_reply}>
          <div className={classes.board_reply_span_box}>
            <span>{userNick}</span>
          </div>
          <div className={classes.board_reply_textarea_box}>
            <textarea
              className={classes.board_reply_textarea}
              disabled
            ></textarea>
            <span className={classes.board_reply_login_span}>
              댓글을 작성하기 위해{" "}
              <Link to="/login" className={classes.board_login_link}>
                로그인
              </Link>
              을 해주세요.
            </span>
          </div>
          <div className={classes.board_reply_btn_box}>
            <button className={classes.board_reply_btn}>댓글 작성</button>
          </div>
        </div>
      )}
    </>
  );
};

export default BoardReplyWrite;
