import classes from "./ManagerBookProperty.module.scss";

const ManagerBookProperty = () => {
  return (
    <div className={classes.manager_book_property}>
      <ul className={classes.manager_book_ul}>
        <li className={classes.manager_book_name_li}>이름</li>
        <li className={classes.manager_book_date_li}>예약일</li>
        <li className={classes.manager_book_constructor_li}>공사 예약일</li>
      </ul>
    </div>
  );
};

export default ManagerBookProperty;
