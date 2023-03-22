import classes from "./BoardWriteBtn.module.scss";

import { Link } from "react-router-dom";
import { useSelector as useReduxSelector } from "react-redux";

type BoardWriteType = {
  login : { email : string; }
}

const BoardWriteBtn = () => {
  const userEmail = useReduxSelector((state : BoardWriteType) => state.login.email);

  const onWriteBtnClick = () => {
    alert("로그인을 하신 후 글쓰기가 가능합니다.");
  }

  return ( 
  <>
    {userEmail && <td colSpan={1} className={classes.board_write_td}>
      <Link className={classes.board_write_link} to="/board/write">글쓰기</Link>
    </td>}
    {!userEmail && <td colSpan={1} className={classes.board_write_td}>
      <span className={classes.board_write_link} onClick={onWriteBtnClick}>글쓰기</span>
    </td>}
    </>
  );
};

export default BoardWriteBtn;
