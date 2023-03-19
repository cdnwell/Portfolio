import classes from "./BoardReadPage.module.scss";

import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axios from "../../../common/axiosInstance";

import { BiMessageDots } from "react-icons/bi";
import localStorage from "redux-persist/es/storage";

const BoardReadPage = () => {
  const { bno } = useParams();
  const [bnoState, setBnoState] = useState();
  const [breply, setBreply] = useState();
  const [bview, setBview] = useState();
  const [category, setCategory] = useState();
  const [content, setContent] = useState("");
  const [email, setEmail] = useState();
  const [postDate, setPostDate] = useState();
  const [title, setTitle] = useState();
  const [writer, setWriter] = useState();

  useEffect(() => {
    axios
      .get(`/board/bulletin/detail/${bno}`)
      .then((response) => {
        const data = response.data;
        console.log(data);

        setBnoState(data.bno);
        setBreply(data.breply);
        setBview(data.bview);
        setCategory(data.category);
        setContent(data.content);
        setEmail(data.email);
        setPostDate(data.postDate);
        setTitle(data.title);
        setWriter(data.writer);

        const boardView = sessionStorage.getItem(`boardView`);
        console.log(`boardView`, boardView);
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
                console.log(response);
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
            .then((response) => {
              console.log(response);
            })
            .catch((error) => {
              console.log(error);
            });
        }
      })
      .catch((error) => console.log(error));
  }, []);

  return (
    <div className={classes.board_read}>
      <header className={classes.board_read_header}>
        <span className={classes.board_read_category}>{category}</span>
        <h2 className={classes.board_read_title}>{title}</h2>
        <span className={classes.board_read_bview}>조회 {bview}</span>
        <span className={classes.board_read_reply}>
          댓글 {<BiMessageDots className={classes.board_reply_icon} />} {breply}
        </span>
      </header>
      <div></div>
      {content && (
        <section
          className={classes.board_read_section}
          dangerouslySetInnerHTML={{ __html: content }}
        ></section>
      )}
    </div>
  );
};

export default BoardReadPage;
