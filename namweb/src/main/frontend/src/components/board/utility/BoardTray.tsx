import classes from "./BoardTray.module.scss";

import { BiMessageDots } from "react-icons/bi";

const BoardTray: React.FC<{
  board: {
    id: string;
    title: string;
    writer: string;
    date: string;
    view: number;
    reply: number;
  }[];
}> = ({ board }) => {
  const board_spread = board.map((item) => (
    <tr key={item.id} className={classes.board_spread_tr}>
      <td>{item.id}</td>
      <td>
        {item.title}
        {item.reply !== 0 && (
          <span className={classes.board_reply_span}>
            <BiMessageDots className={classes.board_reply_icon} />{" "}
            <span>{item.reply}</span>
          </span>
        )}
      </td>
      <td>{item.writer}</td>
      <td>{item.date}</td>
      <td>{item.view}</td>
    </tr>
  ));

  return <>{board_spread}</>;
};

export default BoardTray;
