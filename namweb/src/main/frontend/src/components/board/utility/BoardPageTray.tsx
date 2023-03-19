import classes from "./BoardPageTray.module.scss";

import { useEffect, useState } from "react";

import {
  BsFillArrowLeftCircleFill,
  BsFillArrowRightCircleFill,
} from "react-icons/bs";

import { PagingType } from "../types/PagingType";

interface PagingProps {
  paging: PagingType;
  onPageNoClick: (pageNo: number) => void;
}

const BoardPageTray = ({ paging, onPageNoClick }: PagingProps) => {
  // page 번호를 올려 줌
  const onPageNoLinkClick = (pageNo: number) => {
    onPageNoClick(pageNo);
  };
  const [boardPageNo, setBoardPageNo] = useState<React.ReactNode[]>([]);

  useEffect(() => {
    boardPagingHandler();
  }, []);

  const boardPagingHandler = () => {
    const boardPageTray = [];

    if (paging.previousPageGroup) {
      boardPageTray.push(
        <BsFillArrowLeftCircleFill
          key="before_arrow"
          className={classes.before_arrow}
        />
      );
    }

    for (
      let page = paging.startPageOfPageGroup;
      page <= paging.endPageOfPageGroup;
      page++
    ) {
      if (page !== paging.currentPageNo) {
        boardPageTray.push(
          <span
            key={page}
            className={classes.board_page_span}
            onClick={() => onPageNoLinkClick(page)}
          >
            {page}
          </span>
        );
      } else {
        boardPageTray.push(
          <span
            key={page}
            className={classes.board_page_current_span}
          >
            {page}
          </span>
        );
      }
      
    }

    if (paging.nextPageGroup) {
      boardPageTray.push(
        <BsFillArrowRightCircleFill
          key="after_arrow"
          className={classes.after_arrow}
        />
      );
    }

    setBoardPageNo(boardPageTray);
  };

  return <>{boardPageNo}</>;
};

export default BoardPageTray;
