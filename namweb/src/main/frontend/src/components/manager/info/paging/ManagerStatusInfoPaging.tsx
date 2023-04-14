import classes from "./ManagerStatusInfoPaging.module.scss";

import { useEffect, useState } from "react";
import PagingProps from "../../../board/types/PagingProps";

import {
  BsFillArrowLeftCircleFill,
  BsFillArrowRightCircleFill,
} from "react-icons/bs";

const ManagerStatusInfoPaging = ({
  paging,
  onPageNoClick
}: PagingProps) => {
  const [page, setPage] = useState<React.ReactNode[]>([]);

  useEffect(()=>{
    generateInfoPageNumbers();
  },[paging]);

  const generateInfoPageNumbers = () => {
    const pageNumbers = [];

    if(paging.previousPageGroup) {
      pageNumbers.push(
        <BsFillArrowLeftCircleFill
          key="before_arrow"
          className={classes.manager_paging_arrow}
          onClick={() => onPageNoClick(paging.startPageOfPageGroup - 1)}
        />
      );
    }  

    for (let i = 1; i <= paging.endPageOfPageGroup ; i++) {
      if(i === paging.currentPageNo) {
        pageNumbers.push(
          <span
            key={i}
            className={classes.manager_paging_span_non_active}
          >
            {i}
          </span>
        );
      } else {
        pageNumbers.push(
          <span
            key={i}
            className={classes.manager_paging_span_active}
            onClick={() => onPageNoClick(i)}
          >
            {i}
          </span>
        );
      }
    }

    if(paging.nextPageGroup) {
      pageNumbers.push(
        <BsFillArrowRightCircleFill
          key="after_arrow"
          className={classes.manager_paging_arrow}
          onClick={() => onPageNoClick(paging.endPageOfPageGroup + 1)}
        />
      );
    }

    setPage(pageNumbers);
  };

  return (
    <div className={classes.manager_status_info_paging}>
      {page && page}
    </div>
  );
};

export default ManagerStatusInfoPaging;
