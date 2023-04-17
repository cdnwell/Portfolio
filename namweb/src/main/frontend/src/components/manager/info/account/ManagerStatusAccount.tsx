import { totalType } from "../type/totalType";
import classes from "./ManagerStatusAccount.module.scss";

const ManagerStatusAccount = ({total} : {total : totalType}) => {
  const totalMorningAccount = total.totalMorning * 20;
  const totalAfternoonAccount = total.totalAfternoon * 30;
  const totalExtraAccount = total.totalExtra * 30;
  const totalAccount = totalMorningAccount + totalAfternoonAccount + totalExtraAccount;

  return (
    <fieldset className={classes.manager_status_account}>
      <legend>총 계</legend>
      <div className={classes.manager_status_account_box}>
        <div className={classes.manager_status_total_account}>
          <span className={classes.manager_total_num_unit}>{totalAccount}</span> <span className={classes.manager_total_unit}>만원</span>
        </div>
        <div className={classes.manager_status_total_time_account}>
            <div className={classes.manager_status_div}>
                <span className={classes.manager_total_num_unit}>{totalMorningAccount}</span> <span className={classes.manager_total_unit}>만원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span className={classes.manager_total_num_unit}>{totalAfternoonAccount}</span> <span className={classes.manager_total_unit}>만원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span className={classes.manager_total_num_unit}>{totalExtraAccount}</span> <span className={classes.manager_total_unit}>만원</span>
            </div>
        </div>
      </div>
    </fieldset>
  );
};

export default ManagerStatusAccount;
