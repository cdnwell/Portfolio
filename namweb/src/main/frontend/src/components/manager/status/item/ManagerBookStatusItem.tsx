import classes from "./ManagerBookStatusItem.module.scss";

export interface ManagerBookStatusItemProps {
  item: { bwno : number; name: string; bookDate: string; conDate: string[] };
}

const ManagerBookStatusItem = ({ item }: ManagerBookStatusItemProps) => {
  const conDateTray = item.conDate.map((item, idx) => {
    if (idx > 3) {
      return <></>
    } else if (idx === 3) {
      return <span className={classes.manager_book_date_item}>...</span>;
    }
    return <span className={classes.manager_book_date_item}>{item}</span>
  });

  return (
    <div className={classes.manager_book_status_item}>
      <div className={classes.manager_book_name}>{item.name}</div>
      <div className={classes.manager_book_date}>{item.bookDate}</div>
      <div className={classes.manager_book_constructor_date}>
        {conDateTray}
      </div>
    </div>
  );
};

export default ManagerBookStatusItem;
