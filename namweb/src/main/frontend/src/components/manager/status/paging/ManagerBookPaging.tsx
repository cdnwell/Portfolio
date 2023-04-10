import classes from "./ManagerBookPaging.module.scss";

import { useState, useEffect } from "react";
import { PagingType } from "../../../board/types/PagingType";

import {
  BsFillArrowRightCircleFill,
  BsFillArrowLeftCircleFill,
} from "react-icons/bs";

interface ManagerBookPagingProps {
    onPageTransfer: (page: number) => void;
    paging : PagingType
}

const ManagerBookPaging = ({onPageTransfer, paging } : ManagerBookPagingProps) => {
  // page 번호를 올려 줌
  const onPageNoLinkClick = (pageNo: number) => {
    onPageTransfer(pageNo);
  };
  const [boardPageNo, setBoardPageNo] = useState<React.ReactNode[]>([]);

  useEffect(() => {
    // console.log(paging);
    boardPagingHandler();
  }, [paging]);

  const boardPagingHandler = () => {
    const boardPageTray = [];

    if (paging.previousPageGroup) {
      boardPageTray.push(
        <BsFillArrowLeftCircleFill
          key="before_arrow"
          className={classes.manger_book_left_arrow} 
          onClick={() => onPageNoLinkClick(paging.startPageOfPageGroup - 1)}
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
            className={classes.manager_book_span_active}
            onClick={() => onPageNoLinkClick(page)}
          >
            {page}
          </span>
        );
      } else {
        boardPageTray.push(
          <span
            key={page}
            className={classes.manager_book_span}
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
          className={classes.manger_book_right_arrow} 
          onClick={() => onPageNoLinkClick(paging.endPageOfPageGroup + 1)}
        />
      );
    }

    setBoardPageNo(boardPageTray);
  };

  return <div className={classes.manager_book_paging}>{boardPageNo}</div>;
  // return (
  //   <div className={classes.manager_book_paging}>
  //     <BsFillArrowLeftCircleFill className={classes.manger_book_left_arrow} />
  //     <span className={classes.manager_book_span} onClick={() => onPageTransfer(1)}>1</span>
  //     <span className={classes.manager_book_span}>2</span>
  //     <span className={classes.manager_book_span}>3</span>
  //     <span className={classes.manager_book_span}>4</span>
  //     <span className={classes.manager_book_span}>5</span>
  //     <BsFillArrowRightCircleFill className={classes.manger_book_right_arrow} />
  //   </div>
  // );
};

export default ManagerBookPaging;
