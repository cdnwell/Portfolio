import classes from "./BoardReadPage.module.scss";

import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import axios from "../../../common/axiosInstance";
import { useDispatch, useSelector } from "react-redux";

import { BiMessageDots } from "react-icons/bi";
import { RiDatabase2Line } from "react-icons/ri";
import BoardReply from "./reply/BoardReply";
import { SERVER_URL } from "../../../common/ServerConstant";

import sky_background from "../../../assets/images/background/sky/alan-jones-OQsxdghBKrU-unsplash.jpg";
import { backgroundActions } from "../../store/background";

type ReduxBackgroundType = {
  background: { path: string };
}

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
  const [fileName, setFileName] = useState();
  const [filePath, setFilePath] = useState();

  const [isChanged, setIsChanged] = useState(false);
  const backgroundPath = useSelector((state : ReduxBackgroundType) => state.background.path);

  const today = new Date();

  const dispatch = useDispatch();

  // 1. 게시글 내용 가져오기
  useEffect(() => {
    axios
      .get(`/board/bulletin/detail/${bno}`)
      .then((response) => {
        const data = response.data;

        setBnoState(data.bno);
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

    // 2. 파일 정보 가져오기
    axios
      .get(`/namweb/board/file?bno=${bno}`)
      .then((response) => {
        const data = response.data;

        setFileName(data.fileName);
        setFilePath(data.filePath);
      })
      .catch((error) => console.log(error));
  }, []);

  // 2. 게시글에 대한 댓글 갯수 가져오기
  useEffect(() => {
    axios
      .get(`/board/bulleting/detail/replynum/${bno}`)
      .then((response) => {
        const data = response.data;

        setBreply(data);
      })
      .catch((error) => {
        console.log(error);
      });

    // 3. 게시글에 대한 댓글 가져오기
    axios
      .get(`/board/bulletin/detail/reply/${bno}`)
      .then((response) => {
        const data = response.data;

        setReply(data);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [isChanged]);

  // 4. 배경화면 설정
  // useEffect(() => {
  //   dispatch(backgroundActions.setBackgroundImage({path : sky_background}));
  //   dispatch(backgroundActions.setBackground({background : '#15265b'}));

  //   return () => {
  //     dispatch(backgroundActions.setBackgroundInvalid());
  //   } 
  // },[]);

  const onBoardReplyChanged = () => {
    setIsChanged((prev) => !prev);
  };

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
      {content && (
        <section
          className={classes.board_read_section}
          dangerouslySetInnerHTML={{ __html: content }}
        ></section>
      )}
      {fileName && (
        <div className={classes.board_file_box}>
          <span className={classes.board_file_icon_box}>
            <RiDatabase2Line className={classes.board_file_icon} />
            <div className={classes.board_file_title}>첨부파일</div>
          </span>
          <Link to={`${SERVER_URL}/namweb/board/fileDown?bno=${bno}`}>
            {fileName}
          </Link>
        </div>
      )}
      <footer className={classes.board_read_footer}>
        <div className={classes.board_read_footer_box}>
          <span className={classes.board_read_reply}>댓글</span>
          <BiMessageDots className={classes.board_reply_icon} />
          <span className={classes.board_read_breply}>{breply}</span>
        </div>
        {reply && (
          <BoardReply
            reply={reply}
            bno={`${bno}`}
            onBoardReplyChanged={onBoardReplyChanged}
          />
        )}
      </footer>
    </div>
  );
};

export default BoardReadPage;
