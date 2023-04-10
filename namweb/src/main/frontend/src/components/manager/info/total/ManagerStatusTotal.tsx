import classes from "./ManagerStatusTotal.module.scss";

const ManagerStatusTotal = () => {
  return <div className={classes.manager_status_total}>
    <div className={classes.manager_status_total_amount_box}>
        <div className={classes.manager_status_total_date}>
            <p className={classes.manager_status_total_date_p}>총 예약일</p>
            <span className={classes.manager_status_total_date_span}>7 일</span>
        </div>
        <div className={classes.manager_status_total_con_ea}>
            <p className={classes.manager_status_total_con_ea_p}>건수</p>
            <span className={classes.manager_status_total_con_ea_span}>11건</span>
        </div>
    </div>
    <div className={classes.manager_status_con_box}>
        <div className={classes.manager_status_total_morning}>
            <p className={classes.manager_status_total_morning_p}>아침</p>
            <span className={classes.manager_status_total_morning_span}>4건</span>
        </div>
        <div className={classes.manager_status_total_afternoon}>
            <p className={classes.manager_status_total_afternoon_p}>오후</p>
            <span className={classes.manager_status_total_afternoon_span}>5건</span>
        </div>
        <div className={classes.manager_status_total_extra}>
            <p className={classes.manager_status_total_extra_p}>추가</p>
            <span className={classes.manager_status_total_extra_span}>2건</span>
        </div>
    </div>
  </div>;
};

export default ManagerStatusTotal;
