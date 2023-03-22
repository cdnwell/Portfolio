import classes from "./BoardReadPage.module.scss";

import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "../../../common/axiosInstance";

import { BiMessageDots } from "react-icons/bi";
import BoardReply from "./reply/BoardReply";

const BOARD_REPLY_DUMMY = [
  {
    bno: 483,
    replyno: 0,
    replyforno: -1, // 기본 값 -1
    nick: "b0001",
    content:
      " consectetur adipiscing elit. Phasellus tincidunt tincidunt venenatis. Nunc a libero tortor. Praesent et nisl fermentum, mattis ligula quis, gravida metus. Aliquam id porttitor mauris, sit amet tincidunt neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras tempus ante metus, quis ullamcorper lacus lacinia et. Aliquam erat volutpat. Suspendisse felis est, elementum sed",
    date: "2023-3-20 11:02:03",
    rlike: 3,
  },
  {
    bno: 483,
    replyno: 1,
    replyforno: -1,
    nick: "aab1c",
    content:
      " consectetur adipiscing elit. Phasellus tincidunt tincidunt venenatis. Nunc a libero tortor. Praesent et nisl fermentum, mattis ligula quis, gravida metus. Aliquam id porttitor mauris, sit amet tincidunt neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras tempus ante metus, quis ullamcorper lacus lacinia et. Aliquam erat volutpat. Suspendisse felis est, elementum sed",
    date: "2023-3-22 11:02:03",
    rlike: 0,
  },
  {
    bno: 483,
    replyno: 2,
    replyforno: 1,
    nick: "Zabcda1",
    content:
      " consectetur adipiscing elit. Phasellus tincidunt tincidunt venenatis. Nunc a libero tortor. Praesent et nisl fermentum, mattis ligula quis, gravida metus. Aliquam id porttitor mauris, sit amet tincidunt neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras tempus ante metus, quis ullamcorper lacus lacinia et. Aliquam erat volutpat. Suspendisse felis est, elementum sed",
    date: "2023-2-1 11:02:03",
    rlike: 1,
  },
];

const BoardReadPage = () => {
  const { bno } = useParams();
  const [bnoState, setBnoState] = useState();
  const [breply, setBreply] = useState();
  const [bview, setBview] = useState();
  const [category, setCategory] = useState();
  const [content, setContent] = useState("");
  const [email, setEmail] = useState();
  const [postDate, setPostDate] = useState("");
  const [title, setTitle] = useState();
  const [nick, setNick] = useState();
  const [reply, setReply] = useState();

  const today = new Date();

  useEffect(() => {
    // 1. 게시글 내용 가져오기
    axios
      .get(`/board/bulletin/detail/${bno}`)
      .then((response) => {
        const data = response.data;

        setBnoState(data.bno);
        setBreply(data.breply);
        setBview(data.bview);
        setCategory(data.category);
        setContent(data.content);
        setEmail(data.email);
        setTitle(data.title);
        setNick(data.nick);

        const postDateTmp = new Date(data.postDate);
        let postDateStr = "";

        if (
          postDateTmp.getFullYear() === today.getFullYear() &&
          postDateTmp.getMonth() === today.getMonth() &&
          postDateTmp.getDate() === today.getDate()
        ) {
          postDateStr =
            postDateTmp.getHours() + " : " + postDateTmp.getMinutes();
        } else {
          postDateStr =
            postDateTmp.getFullYear() +
            "-" +
            postDateTmp.getMonth() +
            "-" +
            postDateTmp.getDate();
        }

        setPostDate(postDateStr);

        const boardView = sessionStorage.getItem(`boardView`);
        if (boardView) {
          const boardArray = boardView.split(" ");
          let isNoView = true;
          for (let boardNo of boardArray) {
            if (boardNo === bno) {
              isNoView = false;
              break;
            }
          }
          if (isNoView) {
            axios
              .put(`/board/bulletin/detail/${bno}`)
              .then((response) => {
                sessionStorage.setItem("boardView", boardView + " " + bno);
              })
              .catch((error) => {
                console.log(error);
              });
          }
        } else {
          sessionStorage.setItem("boardView", `${bno}`);
          axios
            .put(`/board/bulletin/detail/${bno}`)
            .then((response) => {})
            .catch((error) => {
              console.log(error);
            });
        }
      })
      .catch((error) => console.log(error));

    // 2. 게시글에 대한 댓글 가져오기
    axios
      .get(`/board/bulletin/detail/reply/${bno}`)
      .then((response) => {
        console.log(response);
        const data = response.data;

        setReply(data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  return (
    <div className={classes.board_read}>
      <header className={classes.board_read_header}>
        <div className={classes.board_read_category_box}>
          <span className={classes.board_read_category}>{category}</span>
        </div>
        <h1 className={classes.board_read_title}>{title}</h1>
        <div className={classes.board_read_writer_box}>
          <div>
            <span className={classes.board_read_writer}>{nick}</span>
            <span className={classes.board_read_bview}>
              조회 <span className={classes.board_read_bview_num}>{bview}</span>
            </span>
          </div>
          <div>
            <span className={classes.board_read_postDate_span}>
              작성시간 /{" "}
            </span>
            <span className={classes.board_read_postDate}>{postDate}</span>
          </div>
        </div>
      </header>
      <div></div>
      {content && (
        <section
          className={classes.board_read_section}
          dangerouslySetInnerHTML={{ __html: content }}
        ></section>
      )}
      <footer className={classes.board_read_footer}>
        <div className={classes.board_read_footer_box}>
          <span className={classes.board_read_reply}>댓글</span>
          <BiMessageDots className={classes.board_reply_icon} />
          <span className={classes.board_read_breply}>{breply}</span>
        </div>
        {reply && <BoardReply reply={reply} />}
      </footer>
    </div>
  );
};

export default BoardReadPage;
