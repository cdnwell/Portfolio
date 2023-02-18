import classes from "./Book.module.css";

import KakaoMap from "../components/api/KakaoMap";
import KakaoPost from "../components/api/KakaoPost";
import Calendar from "../components/utility/Calendar";
import BookForm from "../components/book/BookForm";

const Book = () => {
  return (
    <div className={classes.book_root}>
      <KakaoMap />
      <KakaoPost />
      <p className={classes.book_date_p}> 예약 일 </p>
      <Calendar />
      <br />
      <BookForm />
    </div>
  );
};

export default Book;
