import classes from "./BoardPage.module.scss";

import BoardPageTray from "./BoardPageTray";

const BoardPage = () => {
  return (
    <td colSpan={4} className={classes.board_page_td}>
      <BoardPageTray
        pageStartNum={1}
        pageEndNum={5}
        isBeforePage={true}
        isAfterPage={true}
      />
    </td>
  );
};

export default BoardPage;
