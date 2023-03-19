import classes from "./BoardMain.module.scss";

import { useEffect, useState } from "react";
import axios from "../../common/axiosInstance";

import BoardList from "./utility/BoardList";
import BoardSearch from "./utility/BoardSearch";
import { PagingType } from "./types/PagingType";
import { BoardType } from "./types/BoardType";

const BoardMain = () => {
  const [board, setBoard] = useState<BoardType[]>([]);
  const [paging, setPaging] = useState<PagingType>();
  const [pageNo, setPageNo] = useState(0);

  const onPageNoBoardClick = (pageNo: number) => {
    const currentPageNo = pageNo - 1;
    setPageNo(currentPageNo);
  };

  useEffect(() => {
    axios
      .get(`/board/bulletin?pageNo=${pageNo}`)
      .then((response) => {
        const board = response.data.board;
        const paging = response.data.paging;

        console.log(board);
        console.log(paging);

        setBoard(board);
        setPaging(paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [pageNo]);

  return (
    <div className={classes.board_main}>
      <h1>자유 게시판</h1>
      <BoardSearch />
      {paging && (
        <BoardList
          board={board}
          paging={paging}
          onPageNoBoardClick={onPageNoBoardClick}
        />
      )}
    </div>
  );
};

export default BoardMain;
