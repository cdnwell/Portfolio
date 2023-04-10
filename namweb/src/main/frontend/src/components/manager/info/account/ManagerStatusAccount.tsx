import classes from "./ManagerStatusAccount.module.scss";

const ManagerStatusAccount = () => {
  return (
    <fieldset className={classes.manager_status_account}>
      <legend>총 계</legend>
      <div className={classes.manager_status_account_box}>
        <div className={classes.manager_status_total_account}>
          <span>120만원</span>
        </div>
        <div className={classes.manager_status_total_time_account}>
            <div className={classes.manager_status_div}>
                <span>80 만원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span>150 만원</span>
            </div>
            <div className={classes.manager_status_div}>
                <span>60 만원</span>
            </div>
        </div>
      </div>
    </fieldset>
  );
};

export default ManagerStatusAccount;
