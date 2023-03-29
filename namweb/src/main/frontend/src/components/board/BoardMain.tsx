import classes from "./BoardMain.module.scss";

import { useEffect, useState } from "react";
import axios from "../../common/axiosInstance";
import { useSelector as useReduxSelector } from "react-redux";

import BoardList from "./utility/BoardList";
import BoardSearch from "./utility/BoardSearch";
import { PagingType } from "./types/PagingType";
import { BoardType } from "./types/BoardType";

type SearchReduxType = {
  search: { search: string };
};

type CategoryReduxType = {
  search: { category: number };
};

const BoardMain = () => {
  const searchRedux = useReduxSelector(
    (state: SearchReduxType) => state.search.search
  );
  const categoryRedux = useReduxSelector(
    (state: CategoryReduxType) => state.search.category
  );

  const [board, setBoard] = useState<BoardType[]>([]);
  const [paging, setPaging] = useState<PagingType>();
  const [pageNo, setPageNo] = useState(0);
  const [search, setSearch] = useState(searchRedux);
  const [category, setCategory] = useState(categoryRedux);

  const onPageNoBoardClick = (pageNo: number) => {
    const currentPageNo = pageNo - 1;
    setPageNo(currentPageNo);
  };

  useEffect(() => {
    setSearch(searchRedux);
    setCategory(categoryRedux);
  }, [searchRedux, categoryRedux]);

  useEffect(() => {
    axios
      .get(
        `/board/bulletin?pageNo=${pageNo}&category=${category}&search=${search}`
      )
      .then((response) => {
        const board = response.data.board;
        const paging = response.data.paging;

        setBoard(board);
        setPaging(paging);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [pageNo, search, category]);

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
