import classes from "./Book.module.scss";

import KakaoMap from "../components/api/KakaoMap";
import KakaoPost from "../components/api/KakaoPost";
import Calendar from "../components/utility/Calendar";
import BookForm from "../components/book/BookForm";
import { useState } from "react";

const Book = () => {
  return (
    <div className={classes.book_root}>
      <KakaoMap />
      <KakaoPost />
      <p className={classes.book_date_p}> 예약 일 </p>
      <Calendar />
      <br />
      <BookForm />
      <br />
    </div>
  );
};

export default Book;
