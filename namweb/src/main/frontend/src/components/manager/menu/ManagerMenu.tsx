import classes from "./ManagerMenu.module.scss";

import { useState } from "react";
import { Link } from "react-router-dom";

const ManagerMenu = ({ page }: { page: string }) => {
  const currentPage = (page: string, boldPage: string) => {
    if (page === boldPage) {
      return classes.bold;
    }
    return "";
  };

  const isBookCurrentPage = currentPage(page, "book");
  const isCalendarCurrentPage = currentPage(page, "calendar");
  const isAccountCurrentPage = currentPage(page, "account");

  return (
    <div className={classes.manager_menu}>
      <Link
        to="/manager/book"
        className={`${classes.manager_menu_book} ${isBookCurrentPage}`}
      >
        예약
      </Link>
      <Link
        to="/manager/calendar"
        className={`${classes.manager_menu_calendar}  ${isCalendarCurrentPage}`}
      >
        달력
      </Link>
      <Link
        to="/manager/account"
        className={`${classes.manager_menu_account} ${isAccountCurrentPage}`}
      >
        회계
      </Link>
    </div>
  );
};

export default ManagerMenu;
