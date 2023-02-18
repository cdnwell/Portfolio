import { useEffect, useRef, useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import classes from "./BookForm.module.css";
import axios from "axios";

const { kakao } = window;

const BookForm = () => {
  const lat_store_base = useReduxSelector(
    (state: { base_lat: number }) => state.base_lat
  );
  const lng_store_base = useReduxSelector(
    (state: { base_lng: number }) => state.base_lng
  );

  const [posData, setPosData] = useState({
    lat: lat_store_base,
    lng: lng_store_base,
  });
  const [addressName, setAddressName] = useState("");

  const nameRef = useRef<HTMLInputElement>(null);
  const phoneRef = useRef<HTMLInputElement>(null);
  const textRef = useRef<HTMLTextAreaElement>(null);

  const submitBookHandler = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    console.log("이름", nameRef.current?.value);
    console.log("전화번호", phoneRef.current?.value);
    console.log("내용", textRef.current?.value);
    console.log("위치", posData);
    console.log("주소", addressName);

    const name = nameRef.current?.value;
    const phone = phoneRef.current?.value;
    const content = textRef.current?.value;
    const latitude = posData.lat;
    const longitude = posData.lng;
    const address = addressName;

    // axios({
    //   method: "POST",
    //   url: "http://localhost:9997/sumbit",
    //   data: { name, phone, content, latitude, longitude, address },
    // })
    //   .then((response) => console.log(response))
    //   .catch((error) => console.log(error));
    axios
      .post("http://localhost:9997/submit", { name, phone, content, latitude, longitude, address })
      .then((response) => console.log(response))
      .catch((error) => console.log(error));
  };

  // redux에서 값이 바뀔 때마다 자동으로 위치 좌표, 주소 세팅
  useEffect(() => {
    setPosData({ lat: lat_store_base, lng: lng_store_base });
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(lng_store_base, lat_store_base, (result, status) => {
      const address_name = result[0].address.address_name;
      setAddressName(address_name);
    });
  }, [lat_store_base, lng_store_base]);

  return (
    <form className={classes.book_form} onSubmit={submitBookHandler}>
      <label className={classes.name_label} htmlFor="book_name">
        성함
      </label>
      <input
        id="book_name"
        className={classes.name_input}
        type="text"
        ref={nameRef}
      />
      <label className={classes.phone_label} htmlFor="book_phone">
        전화번호
      </label>
      <input
        id="book_phone"
        className={classes.phone_input}
        type="text"
        ref={phoneRef}
      />
      <label className={classes.book_label} htmlFor="book_text">
        예약 사항
      </label>
      <textarea
        id="book_text"
        className={classes.textarea}
        cols={30}
        rows={10}
        ref={textRef}
      ></textarea>
      <button className={classes.submit_button}>예약하기</button>
    </form>
  );
};

export default BookForm;
