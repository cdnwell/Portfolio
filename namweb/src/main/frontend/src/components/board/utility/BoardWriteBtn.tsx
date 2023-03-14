import { Link } from "react-router-dom";
import classes from "./BoardWriteBtn.module.scss";

const BoardWriteBtn = () => {
  return (
    <td colSpan={1} className={classes.board_write_td}>
      <Link className={classes.board_write_link} to="/board/write">글쓰기</Link>
    </td>
  );
};

export default BoardWriteBtn;
