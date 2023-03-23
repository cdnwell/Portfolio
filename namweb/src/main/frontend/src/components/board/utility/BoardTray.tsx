import classes from "./BoardTray.module.scss";

import axios from "../../../common/axiosInstance";
import { Link } from "react-router-dom";
import dateToString from "../../../common/dateToString";

import { BiMessageDots } from "react-icons/bi";

interface BoardTrayProps {
  board: {
    bno: string;
    category: string;
    title: string;
    nick: string;
    bview: number;
    breply: number;
    postDate: string;
  }[];
}

const BoardTray = ({ board }: BoardTrayProps) => {

  const onBoardReadClick = (bno: string) => {
    axios
      .get(`/board/bulletin/detail/${bno}`)
      .then((response) => {
        console.log(response);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const board_spread = board.map((item) => (
    <tr key={item.bno} className={classes.board_spread_tr}>
      <td>{item.bno}</td>
      <td>{item.category}</td>
      <td>
        <Link to={`/namweb/board/detail/${item.bno}`} className={classes.board_title} onClick={() => onBoardReadClick(item.bno)}>{item.title}</Link>
        {item.breply !== 0 && (
          <span className={classes.board_reply_span}>
            <BiMessageDots className={classes.board_reply_icon} />{" "}
            <span>{item.breply}</span>
          </span>
        )}
      </td>
      <td>{item.nick}</td>
      <td>{dateToString(item.postDate)}</td>
      <td>{item.bview}</td>
    </tr>
  ));

  return <>{board_spread}</>;
};

export default BoardTray;
