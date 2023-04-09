import { PagingType } from "../../../board/types/PagingType";
import classes from "./ManagerBookPaging.module.scss";

import {
  BsFillArrowRightCircleFill,
  BsFillArrowLeftCircleFill,
} from "react-icons/bs";

interface ManagerBookPagingProps {
    onPageTransfer: (page: number) => void;
    paging : PagingType
}


const ManagerBookPaging = ({onPageTransfer, paging } : ManagerBookPagingProps) => {



  return (
    <div className={classes.manager_book_paging}>
      <BsFillArrowLeftCircleFill className={classes.manger_book_left_arrow} />
      <span className={classes.manager_book_span} onClick={() => onPageTransfer(1)}>1</span>
      <span className={classes.manager_book_span}>2</span>
      <span className={classes.manager_book_span}>3</span>
      <span className={classes.manager_book_span}>4</span>
      <span className={classes.manager_book_span}>5</span>
      <BsFillArrowRightCircleFill className={classes.manger_book_right_arrow} />
    </div>
  );
};

export default ManagerBookPaging;
