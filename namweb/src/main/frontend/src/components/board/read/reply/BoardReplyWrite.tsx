import classes from "./BoardReplyWrite.module.scss";

import { useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";
import { Link } from "react-router-dom";

type NameReduxType = {
  login: { nick: string };
};

const BoardReplyWrite = () => {
  const [writer, setWriter] = useState();
  const userNick = useReduxSelector((state: NameReduxType) => state.login.nick);

  return (
    <>
      {userNick && (
        <div className={classes.board_reply}>
          <div className={classes.board_reply_span_box}>
            <span>{userNick}</span>
          </div>
          <textarea
            className={classes.board_reply_textarea}
            placeholder="댓글을 입력해주세요."
          ></textarea>
          <div className={classes.board_reply_btn_box}>
            <button className={classes.board_reply_btn}>댓글 작성</button>
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
