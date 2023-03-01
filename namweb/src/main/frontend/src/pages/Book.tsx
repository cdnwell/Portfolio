import { useState, useEffect } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import classes from "./Book.module.scss";

import KakaoMap from "../components/api/KakaoMap";
import KakaoPost from "../components/api/KakaoPost";
import Calendar from "../components/utility/Calendar";
import BookForm from "../components/book/BookForm";
import KakaoPostName from "../components/api/KakaoPostName";
import { useDispatch } from "react-redux";
import { bookActions } from "../components/store/book";

import { CENTER_POS_Y, CENTER_POS_X } from "../constant/KakaoConstant";

const Book = () => {
  const [lat, setLat] = useState(CENTER_POS_Y);
  const [lng, setLng] = useState(CENTER_POS_X);

  const lat_store = useReduxSelector(
    (state: { book: { post_lat: number } }) => state.book.post_lat
  );
  const lng_store = useReduxSelector(
    (state: { book: { post_lng: number } }) => state.book.post_lng
  );
  const re_lat_store = useReduxSelector(
    (state: { book: { re_post_lat: number } }) => state.book.re_post_lat
  );
  const re_lng_store = useReduxSelector(
    (state: { book: { re_post_lng: number } }) => state.book.re_post_lng
  );

  const dispatch = useDispatch();

  // bug
  // KakaoPostName 컴포넌트에서 기본값을 전달 값으로 변경하니 페이지 전환에도
  // useEffect로 redux 값이 들어간다.
  // 기본값을 0으로 설정하니 redux값이 들어가지 않고 CENTER_POS_값이 들어갔다.
  useEffect(() => {
    dispatch(
      bookActions.setRePostPosition({
        re_post_lat: lat_store,
        re_post_lng: lng_store,
      })
    );
  }, [lat_store, lng_store]);

  useEffect(() => {
    setLat(re_lat_store);
    setLng(re_lng_store);
  }, [re_lat_store, re_lng_store]);

  const onPostHandler = (post: { lat: number; lng: number }) => {
    // KakaoMap 컴포넌트 center 위치 수정됨
    dispatch(
      bookActions.setPostPosition({ post_lat: post.lat, post_lng: post.lng })
    );
    setLat(post.lat);
    setLng(post.lng);
  };

  const onMapPostHandler = (post: { lat: number; lng: number }) => {
    setLat(post.lat);
    setLng(post.lng);
  };

  return (
    <div className={classes.book_root}>
      <KakaoMap onPostPos={onMapPostHandler} />
      <div className={classes.book_post}>
        <ul className={classes.book_post_ul}>
          <li>
            <KakaoPost onPostPos={onPostHandler} />
          </li>
          <li>
            <KakaoPostName posData={{ lat: lat, lng: lng }} />
          </li>
        </ul>
      </div>
      <p className={classes.book_date_p}> 예약 일 </p>
      <Calendar />
      <br />
      <BookForm />
      <br />
    </div>
  );
};

export default Book;
