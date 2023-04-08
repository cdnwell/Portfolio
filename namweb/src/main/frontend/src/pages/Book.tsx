import { useState, useEffect } from "react";

import classes from "./Book.module.scss";

import KakaoMap from "../components/api/KakaoMap";
import KakaoPost from "../components/api/KakaoPost";
import Calendar from "../components/utility/Calendar";
import BookForm from "../components/book/BookForm";
import KakaoPostName from "../components/api/KakaoPostName";
import { useDispatch, useSelector as useReduxSelector } from "react-redux";
import { bookActions } from "../components/store/book";

import { CENTER_POS_Y, CENTER_POS_X } from "../constant/KakaoConstant";

const Book = () => {
  const [lat, setLat] = useState(CENTER_POS_Y);
  const [lng, setLng] = useState(CENTER_POS_X);

  const dispatch = useDispatch();

  const lat_store = useReduxSelector(
    (state: { book: { post_lat: number } }) => state.book.post_lat
  );
  const lng_store = useReduxSelector(
    (state: { book: { post_lng: number } }) => state.book.post_lng
  );

  useEffect(() => {
    setLat(lat_store);
    setLng(lng_store);
  }, [lat_store, lng_store]);

  const onResultHandler = (result: any) => {
    const post_lat = parseFloat(result[0].road_address.y);
    const post_lng = parseFloat(result[0].road_address.x);

    // KakaoMap 컴포넌트 center 위치 수정됨
    dispatch(
      bookActions.setPostPosition({ post_lat: post_lat, post_lng: post_lng })
    );
    // Redux에서 참조할 위치 값
    dispatch(
      bookActions.setStoredPosition({ stored_lat: post_lat, stored_lng: post_lng })
    );
    
    setLat(post_lat);
    setLng(post_lng);
  };

  const onMapPostHandler = (post: { lat: number; lng: number }) => {
    setLat(post.lat);
    setLng(post.lng);

    // Redux에서 참조할 위치 값
    dispatch(
      bookActions.setStoredPosition({ stored_lat: post.lat, stored_lng: post.lng })
    );
  };

  return (
    <div className={classes.book_root}>
      <KakaoMap onPostPos={onMapPostHandler} />
      <div className={classes.book_post}>
        <ul className={classes.book_post_ul}>
          <li>
            <KakaoPost onResult={onResultHandler} />
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
