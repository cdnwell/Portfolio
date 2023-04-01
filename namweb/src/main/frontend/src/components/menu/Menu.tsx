import classes from "./Menu.module.scss";

import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

import { CgMenuRound } from "react-icons/cg";
import AdminMenu from "./admin/AdminMenu";
import { useSelector } from "react-redux";
import { ADMIN_EMAIL } from "../../common/ServerConstant";

type ReduxEmailType = {
  login: {
    email: string;
  };
};

const Menu = () => {
  const [isMenuClicked, setIsMenuClicked] = useState(false);
  const [isAdmin, setIsAdmin] = useState(false);
  const userEmail = useSelector((state: ReduxEmailType) => state.login.email);

  useEffect(() => {
    if (userEmail === ADMIN_EMAIL) {
      setIsAdmin(true);
    } else {
        setIsAdmin(false);
    }
  }, [userEmail]);

  const onMenuIconClick = () => {
    setIsMenuClicked(!isMenuClicked);
  };

  const onMenuLeave = () => {
    setIsMenuClicked(false);
  };

  return (
    <div className={classes.menu}>
      <Link className={classes.menu_introduce} to="/">사업 소개</Link>
      <Link className={classes.menu_bulletin} to="/board">게시판</Link>
      <Link className={classes.menu_register} to="/book">공사 예약</Link>
      {!isAdmin && (
        <Link className={classes.menu_login} to="/login">
          <CgMenuRound
            className={classes.menu_icon}
            onClick={onMenuIconClick}
          />
        </Link>
      )}
      {isAdmin && (
        <div className={classes.menu_login_box}>
          <CgMenuRound
            className={classes.menu_icon}
            onClick={onMenuIconClick}
          />
          {isMenuClicked && (
            <div
              className={classes.menu_login_admin}
              onMouseLeave={onMenuLeave}
            >
              <div className={classes.menu_login_dummy}></div>
              <AdminMenu />
            </div>
          )}
        </div>
      )}
    </div>
  );
};

export default Menu;
