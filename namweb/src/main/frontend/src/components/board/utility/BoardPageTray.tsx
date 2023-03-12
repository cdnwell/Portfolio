import classes from "./BoardPageTray.module.scss";

import {
  BsFillArrowLeftCircleFill,
  BsFillArrowRightCircleFill,
} from "react-icons/bs";

const BoardPageTray: React.FC<{
  pageStartNum: number;
  pageEndNum: number;
  isBeforePage: boolean;
  isAfterPage: boolean;
}> = ({ pageStartNum, pageEndNum, isBeforePage, isAfterPage }) => {
  const boardPageTray = [];

  if (isBeforePage) {
    boardPageTray.push(<BsFillArrowLeftCircleFill key="before_arrow" className={classes.before_arrow} />);
  }

  for (let page = pageStartNum; page <= pageEndNum; page++) {
    boardPageTray.push(
      <span key={page} className={classes.board_page_span}>
        {page}
      </span>
    );
  }

  if (isAfterPage) {
    boardPageTray.push(<BsFillArrowRightCircleFill key="after_arrow" className={classes.after_arrow} />);
  }

  return <>{boardPageTray}</>;
};

export default BoardPageTray;
