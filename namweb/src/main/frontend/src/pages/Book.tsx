import classes from "./Book.module.scss";

import KakaoMap from "../components/api/KakaoMap";
import KakaoPost from "../components/api/KakaoPost";
import Calendar from "../components/utility/Calendar";
import BookForm from "../components/book/BookForm";
import { useState } from "react";

const Book = () => {
  const [select , setSelect] = useState<number>();

  const selectHandler = (e : React.ChangeEvent<HTMLSelectElement>) => {
    console.log(e.target.value);
    setSelect(parseInt(e.target.value));
  };

  return (
    <div className={classes.book_root}>
      <KakaoMap />
      <KakaoPost />
      <p className={classes.book_date_p}> 예약 일 </p>
      <Calendar />
      <br />
      <BookForm />
      <br />
      <select onChange={selectHandler} value={select}>
        <option value={1}>1 option</option>
        <option value={5}>5 option</option>
        <option value={3}>3 option</option>
        <option value={0}>0 option</option>
      </select>
    </div>
  );
};

export default Book;
