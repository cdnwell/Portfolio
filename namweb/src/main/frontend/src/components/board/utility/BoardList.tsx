import { BoardType } from "../types/BoardType";
import { PagingType } from "../types/PagingType";
import classes from "./BoardList.module.scss";

import BoardPageWrite from "./BoardPageWrite";
import BoardTray from "./BoardTray";

interface BoardListProps {
  board: BoardType[];
  paging: PagingType;
  onPageNoBoardClick: (pageNo: number) => void;
}

const BoardList = ({ board, paging, onPageNoBoardClick }: BoardListProps) => {
  const onPageNoListClick = (pageNo: number) => {
    onPageNoBoardClick(pageNo);
  };

  return (
    <div>
      <table className={classes.board_table}>
        <thead>
          <tr className={classes.table_th_tr}>
            <th>번호</th>
            <th>분류</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>등록시간</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <BoardTray board={board} />
        </tbody>
        <tfoot>
          <BoardPageWrite
            paging={paging}
            onPageNoListClick={onPageNoListClick}
          />
        </tfoot>
      </table>
    </div>
  );
};

export default BoardList;
