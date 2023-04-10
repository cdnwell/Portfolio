import PagingProps from "../../../board/types/PagingProps";
import classes from "./ManagerStatusInfoPaging.module.scss";

import {
  BsFillArrowLeftCircleFill,
  BsFillArrowRightCircleFill,
} from "react-icons/bs";

const ManagerStatusInfoPaging = ({
  paging,
  onPageNoClick
}: PagingProps) => {
  return (
    <div className={classes.manager_status_info_paging}>
      <BsFillArrowLeftCircleFill className={classes.manager_paging_arrow} />
      <span className={classes.manager_paging_span_active}>1</span>
      <span className={classes.manager_paging_span_active}>2</span>
      <span className={classes.manager_paging_span_active}>3</span>
      <span className={classes.manager_paging_span_active}>4</span>
      <span className={classes.manager_paging_span_active}>5</span>
      <BsFillArrowRightCircleFill className={classes.manager_paging_arrow} />
    </div>
  );
};

export default ManagerStatusInfoPaging;
