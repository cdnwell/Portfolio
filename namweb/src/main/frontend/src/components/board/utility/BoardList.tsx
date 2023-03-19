import { BoardType } from "../types/BoardType";
import { PagingType } from "../types/PagingType";
import classes from "./BoardList.module.scss";

import BoardPageWrite from "./BoardPageWrite";
import BoardTray from "./BoardTray";

const BOARD_DUMMY = [
  {
    id: "3",
    title: "게시글 세 번쨰 글의 제목 #3",
    writer: "Admin01",
    date: "11 : 30",
    view: 13,
    reply: 3,
  },
  {
    id: "2",
    title: "게시글 #2",
    writer: "Kim",
    date: "2023-03-01",
    view: 23,
    reply: 0,
  },
  {
    id: "1",
    title: "첫 글 #1",
    writer: "Admin01",
    date: "2023-02-13",
    view: 7,
    reply: 1,
  },
];

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
            paging={paging as PagingType}
            onPageNoListClick={onPageNoListClick}
          />
        </tfoot>
      </table>
    </div>
  );
};

export default BoardList;
