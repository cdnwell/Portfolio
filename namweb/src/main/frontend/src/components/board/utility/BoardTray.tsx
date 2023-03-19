import classes from "./BoardTray.module.scss";

import { BiMessageDots } from "react-icons/bi";


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

const BoardTray = ({ board } : BoardTrayProps) => {
  
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

  const board_spread = board.map((item) => (
    <tr key={item.bno} className={classes.board_spread_tr}>
      <td>{item.bno}</td>
      <td>
        {item.title}
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
