import { useDispatch } from "react-redux";
import classes from "./AdminMenu.module.scss";

import { Link, useNavigate } from "react-router-dom";
import { loginActions } from "../../store/login";

const AdminMenu = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const onLogoutClick = () => {
    dispatch(loginActions.setLoginInvalid());
    navigate("/");
  };

  return (
    <div className={classes.admin_menu}>
      <div className={classes.admin_diagonals}></div>
      <Link to="/login" className={classes.admin_info}>계정 정보</Link>
      <Link to="/manager" className={classes.admin_page}>관리자 화면</Link>
      <span className={classes.admin_logout} onClick={onLogoutClick}>Logout</span>
    </div>
  );
};

export default AdminMenu;
