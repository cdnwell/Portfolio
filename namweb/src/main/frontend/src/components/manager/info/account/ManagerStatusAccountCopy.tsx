import classes from "./ManagerStatusAccount.module.scss";

const ManagerStatusAccountCopy = () => {
  return (
    <fieldset className={classes.manager_status_account}>
      <legend>총 계</legend>
      <div className={classes.manager_status_account_box}>
        <div className={classes.manager_status_total_account}>
          <span> 원</span>
        </div>
        <div className={classes.manager_status_total_time_account}>
            <div className={classes.manager_status_div}>
                <span> 원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span> 원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span> 원</span>
            </div>
        </div>
      </div>
    </fieldset>
  );
};

export default ManagerStatusAccountCopy;
