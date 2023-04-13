import { managerActions } from "../../../store/manager";
import classes from "./ManagerBookStatusItem.module.scss";

import { useDispatch } from "react-redux";

export interface ManagerBookStatusItemProps {
  item: { bwno: number; name: string; bookDate: string; conDate: string[] };
}

const ManagerBookStatusItem = ({ item }: ManagerBookStatusItemProps) => {
  const dispatch = useDispatch();

  const conDateTray = item.conDate.map((item, idx) => {
    if (idx > 3) {
      return <span key={idx}></span>;
    } else if (idx === 3) {
      return <span key={idx} className={classes.manager_book_date_item}>...</span>;
    }
    return <span key={idx} className={classes.manager_book_date_item}>{item}</span>;
  });

  const onBookItemClick = () => {
    dispatch(managerActions.setBookDate({bwno : item.bwno}));
  };

  return (
    <div className={classes.manager_book_status_item} onClick={onBookItemClick}>
      <div className={classes.manager_book_name}>{item.name}</div>
      <div className={classes.manager_book_date}>{item.bookDate}</div>
      <div className={classes.manager_book_constructor_date}>{conDateTray}</div>
    </div>
  );
};

export default ManagerBookStatusItem;
