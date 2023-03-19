import classes from "./BoardPage.module.scss";

import { PagingType } from "../types/PagingType";

import BoardPageTray from "./BoardPageTray";

interface PagingProps {
  paging : PagingType;
  onPageNoPageClick : (pageNo : number) => void;
}

const BoardPage = ({ paging, onPageNoPageClick }: PagingProps) => {

  const onPageNoClick = (pageNo : number) => {
    onPageNoPageClick(pageNo);
  }

  return (
    <td colSpan={5} className={classes.board_page_td}>
      <BoardPageTray
        paging={paging}
        onPageNoClick={onPageNoClick}
      />
    </td>
  );
};

export default BoardPage;
