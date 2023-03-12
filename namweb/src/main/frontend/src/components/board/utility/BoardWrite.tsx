import { Link } from "react-router-dom";
import classes from "./BoardWrite.module.scss";

const BoardWrite = () => {
  return (
    <td colSpan={1} className={classes.board_write_td}>
      <Link className={classes.board_write_link} to="/board/write">글쓰기</Link>
    </td>
  );
};

export default BoardWrite;
