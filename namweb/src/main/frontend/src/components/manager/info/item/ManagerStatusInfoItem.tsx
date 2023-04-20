import classes from "./ManagerStatusInfoItem.module.scss";

import { AiFillCheckCircle } from "react-icons/ai";

export interface ManagerStatusInfoItemProps {
  date: string;
  morning: boolean;
  afternoon : boolean;
  extra : boolean;
}

type CloseButtonProps = {
  onClick: () => void
} & React.HTMLAttributes<HTMLButtonElement>

const ManagerStatusInfoItem = ({ date, morning, afternoon, extra } : ManagerStatusInfoItemProps) => {
  return (
    <div className={classes.manager_status_info_item}>
      <div className={classes.manager_info_date}>
        <span className={classes.manager_info_date_span}>{date}</span>
        </div>
      <div className={classes.manager_info_check_box}>
        <div className={classes.manager_info_check_box_div}>
          {morning && <AiFillCheckCircle className={classes.manager_info_checked} />}
        </div>
        <div className={classes.manager_info_check_box_div}>
          {afternoon && <AiFillCheckCircle className={classes.manager_info_checked} />}
        </div>
        <div className={classes.manager_info_check_box_div}>
          {extra && <AiFillCheckCircle className={classes.manager_info_checked} />}
        </div>
      </div>
    </div>
  );
};

export default ManagerStatusInfoItem;
