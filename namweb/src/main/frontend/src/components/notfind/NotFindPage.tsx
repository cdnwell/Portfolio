import classes from "./NotFindPage.module.scss";
import { MdDoNotDisturbAlt } from "react-icons/md";
const NotFindPage = () => {
  return (
    <div className={classes.not_find}>
      <div className={classes.not_find_h1_div}>
        <MdDoNotDisturbAlt className={classes.not_find_icon} />
        <h1>404 Not Find</h1>
      </div>
      <section>존재하지 않는 페이지 입니다.</section>
    </div>
  );
};

export default NotFindPage;
