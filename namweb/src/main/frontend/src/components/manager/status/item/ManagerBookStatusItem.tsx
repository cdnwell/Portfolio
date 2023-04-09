import classes from "./ManagerBookStatusItem.module.scss";

const ManagerBookStatusItem = () => {
  return (
    <div className={classes.manager_book_status_item}>
      <div className={classes.manager_book_name}>HSH</div>
      <div className={classes.manager_book_date}>04/02 월</div>
      <div className={classes.manager_book_constructor_date}>
        <span className={classes.manager_book_date_item}>04/05 수</span>
        <span className={classes.manager_book_date_item}>04/06 목</span>
        <span className={classes.manager_book_date_item}>04/07 금</span>
      </div>
    </div>
  );
};

export default ManagerBookStatusItem;
