import classes from "./BoardTray.module.scss";

import { BiMessageDots } from "react-icons/bi";
import axios from "../../../common/axiosInstance";
import { Link } from "react-router-dom";

interface BoardTrayProps {
  board: {
    bno: string;
    category: string;
    title: string;
    writer: string;
    bview: number;
    breply: number;
    postDate: string;
  }[];
}

const BoardTray = ({ board }: BoardTrayProps) => {
  const dateConverter = (dateArg: string) => {
    const dateTmp = new Date(dateArg);
    const today = new Date();
    let dateResult = "";

    if (
      today.getFullYear() === dateTmp.getFullYear() &&
      today.getMonth() === dateTmp.getMonth() &&
      today.getDate() === dateTmp.getDate()
    ) {
      dateResult = dateTmp.getHours() + " : " + dateTmp.getMinutes();
      return dateResult;
    }

    dateResult =
      dateTmp.getFullYear() +
      "-" +
      dateTmp.getMonth() +
      "-" +
      dateTmp.getDate();
    return dateResult;
  };

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
      <td>{item.writer}</td>
      <td>{dateConverter(item.postDate)}</td>
      <td>{item.bview}</td>
    </tr>
  ));

  return <>{board_spread}</>;
};

export default BoardTray;
