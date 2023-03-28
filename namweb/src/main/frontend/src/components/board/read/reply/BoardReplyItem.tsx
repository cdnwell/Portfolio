import classes from "./BoardReplyItem.module.scss";

import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import axios from "../../../../common/axiosInstance";
import dateToString from "../../../../common/dateToString";

import { BsHandThumbsUp, BsHandThumbsDown } from "react-icons/bs";
import BoardReplyNestedWrite from "./BoardReplyNestedWrite";

import sanitizeHtml from "sanitize-html";
import { replyActions } from "../../../store/reply";

interface BoardReplyItemProps {
  represent: {
    replyno: number;
    bno: number;
    replyforno: number;
    email: string;
    nick: string;
    content: string;
    replyDate: string;
    replyLikeNum: number;
  };
  onReplyAppendClick: (replyno: number) => void;
  passedReplyno: number;
  onReplyItemChanged: () => void;
}

type EmailReduxType = {
  login: { email: string };
};

type ReplyUpdateReduxType = {
  reply: { isReplyUpdate: boolean };
};

const BoardReplyItem = ({
  represent,
  onReplyAppendClick,
  passedReplyno,
  onReplyItemChanged,
}: BoardReplyItemProps) => {
  const [isReplyOpen, setIsReplyOpen] = useState(false);
  const [isReplyUpdate, setIsReplyUpdate] = useState(false);
  const [replyContent, setReplyContent] = useState("");

  const userEmail = useSelector((state: EmailReduxType) => state.login.email);
  const userReplyUpdate = useSelector(
    (state: ReplyUpdateReduxType) => state.reply.isReplyUpdate
  );

  const dispatch = useDispatch();

  const onReplyClick = () => {
    onReplyAppendClick(represent.replyno);

    if (isReplyOpen) setIsReplyOpen(false);
  };

  useEffect(() => {
    // handedReplyno가 변하면 바로 모든 창을 닫기 위해 false로 바꿔준다.

    // reply root로 부터 온 replyno와 본 replyno가 같다면
    // 댓글 달기 버튼을 눌렀다는 것이므로 댓글을 달 수 있는 창을 열어준다.
    if (represent.replyno === passedReplyno) setIsReplyOpen(true);
    else setIsReplyOpen(false);
  }, [passedReplyno]);

  const replyDate = dateToString(represent.replyDate);
  const replySpan = isReplyOpen ? "닫기" : "댓글 달기";

  const onReplyDeleteClick = () => {
    const confirmSelect = confirm("댓글을 삭제하시겠습니까?");

    if (!confirmSelect) return;

    axios
      .delete(`/board/bulletin/reply?replyno=${represent.replyno}`)
      .then((response) => {
        alert("댓글이 삭제되었습니다.");

        onReplyItemChanged();
      })
      .catch((error) => {
        alert("댓글 삭제에 실패하였습니다.");
      });
  };

  const onReplyUpdateClick = () => {
    if (userReplyUpdate) {
      alert("이미 수정 중인 댓글이 있습니다.");
      return;
    }

    const confirmSelect = confirm("댓글을 수정하시겠습니까?");

    if (!confirmSelect) return;

    setIsReplyUpdate(true);
    let content = represent.content;
    content = content.replaceAll("<br><p></p>", "\n");
    setReplyContent(content);
    dispatch(replyActions.setIsReplyUpdate(true));
  };

  const onReplyUpdateChange = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    const { value } = e.target;

    if (value.length > 300) return;

    setReplyContent(value);
  };

  const onReplyUpdateSubmit = () => {
    if (replyContent.trim().length === 0) {
      alert("댓글을 입력해주세요.");
    }

    const confirmSelect = confirm("댓글을 수정하시겠습니까?");
    if (!confirmSelect) return;

    axios
      .put(`/board/bulletin/reply`, {
        replyno: represent.replyno,
        content: replyContent,
      })
      .then((response) => {
        alert("댓글이 수정되었습니다.");

        setIsReplyUpdate(false);
        onReplyItemChanged();
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const onReplyUpdateCancel = () => {
    dispatch(replyActions.setIsReplyUpdate(false));
    setIsReplyUpdate(false);
  };

  const onReplyContentEntered = () => {
    // 댓글창 업데이트를 위한 state 전달
    onReplyItemChanged();

    setIsReplyOpen(false);
  };

  const isReplyDeleted =
    represent.replyforno === -2 ? classes.board_reply_content_deleted : "";

  const onLikeClick = () => {
    if (!userEmail) {
      alert("로그인 후 이용 가능합니다.");
      return;
    }

    axios
      .post(`/board/bulletin/reply/like`, {
        replyno: represent.replyno,
        email: userEmail,
      })
      .then((response) => {
        const status = response.data.status;
        console.log(response);

        if (status === "HATE_REPLY_EXISTED") {
          alert("이미 비추천하셨습니다.");
        } else if (status === "LIKE_REPLY_INSERTED"){
          alert("추천되었습니다.");

          onReplyItemChanged();
        } else if (status === "LIKE_REPLY_DELETED") {
          alert("추천이 취소되었습니다.");

          onReplyItemChanged();
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const onHateClick = () => {
    if (!userEmail) {
      alert("로그인 후 이용 가능합니다.");
      return;
    }

    axios
      .post(`/board/bulletin/reply/hate`, {
        replyno: represent.replyno,
        email: userEmail,
      })
      .then((response) => {
        const status = response.data.status;

        if (status === "LIKE_REPLY_EXISTED") {
          alert("이미 추천하셨습니다.");
        } else if (status === "HATE_REPLY_INSERTED"){
          alert("비추천되었습니다.");

          onReplyItemChanged();
        } else if (status === "HATE_REPLY_DELETED") {
          alert("비추천이 취소되었습니다.");

          onReplyItemChanged();
        }
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <>
      <div className={classes.board_reply_item}>
        <div className={classes.board_reply_nick_box}>
          <span></span>
          <span>{represent.nick}</span>
          <span className={classes.board_reply_comment} onClick={onReplyClick}>
            {replySpan}
          </span>
        </div>
        {!isReplyUpdate && (
          <div
            className={`${classes.board_reply_content} ${isReplyDeleted}`}
            dangerouslySetInnerHTML={{
              __html: sanitizeHtml(represent.content),
            }}
          ></div>
        )}
        {isReplyUpdate && (
          <textarea
            className={classes.board_reply_textarea}
            onChange={onReplyUpdateChange}
            value={replyContent}
          >
            {" "}
          </textarea>
        )}
        <div className={classes.board_reply_up_date_box}>
          <div className={classes.board_reply_hands}>
            <div>
              <BsHandThumbsUp
                className={classes.board_reply_up}
                onClick={onLikeClick}
              />
              <span className={classes.board_reply_up_num}>
                {represent.replyLikeNum}
              </span>
            </div>
            <BsHandThumbsDown
              className={classes.board_reply_down}
              onClick={onHateClick}
            />
          </div>
          <div className={classes.board_reply_date_box}>
            <span className={classes.board_reply_date}>{replyDate}</span>
          </div>
          {!isReplyUpdate && userEmail === represent.email && (
            <div>
              <span
                className={classes.board_reply_update}
                onClick={onReplyUpdateClick}
              >
                수정
              </span>
              {" | "}
              <span
                className={classes.board_reply_delete}
                onClick={onReplyDeleteClick}
              >
                삭제
              </span>
            </div>
          )}
          {isReplyUpdate && (
            <div>
              <span
                className={classes.board_reply_update}
                onClick={onReplyUpdateSubmit}
              >
                수정 완료
              </span>
              {" | "}
              <span
                className={classes.board_reply_delete}
                onClick={onReplyUpdateCancel}
              >
                취소
              </span>
            </div>
          )}
        </div>
      </div>
      {isReplyOpen && (
        <BoardReplyNestedWrite
          bno={represent.bno}
          replyno={represent.replyno}
          onReplyChanged={onReplyContentEntered}
        />
      )}
    </>
  );
};

export default BoardReplyItem;
