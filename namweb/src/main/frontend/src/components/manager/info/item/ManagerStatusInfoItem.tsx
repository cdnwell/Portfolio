import classes from "./ManagerStatusInfoItem.module.scss";

import { AiFillCheckCircle } from "react-icons/ai";

const ManagerStatusInfoItem = () => {
  return (
    <div className={classes.manager_status_info_item}>
      <div className={classes.manager_info_date}>
        <span className={classes.manager_info_date_span}>04/19 수</span>
        </div>
      <div className={classes.manager_info_check_box}>
        <div className={classes.manager_info_check_box_div}>
          <AiFillCheckCircle className={classes.manager_info_checked} />
        </div>
        <div className={classes.manager_info_check_box_div}></div>
        <div className={classes.manager_info_check_box_div}>
          <AiFillCheckCircle className={classes.manager_info_checked} />
        </div>
      </div>
    </div>
  );
};

export default ManagerStatusInfoItem;
