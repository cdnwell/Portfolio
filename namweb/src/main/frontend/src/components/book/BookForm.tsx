import { useEffect, useRef, useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import classes from "./BookForm.module.scss";
import axios from "../../common/axiosInstance";
import UpdateAni from "../animation/UpdateAni";

const { kakao } = window;

const BookForm = () => {
  const lat_store_base = useReduxSelector(
    (state: { book: { base_lat: number } }) => state.book.base_lat
  );
  const lng_store_base = useReduxSelector(
    (state: { book: { base_lng: number } }) => state.book.base_lng
  );
  const workDateBase = useReduxSelector(
    (state: {
      book: {
        workDate: {
          date: Date;
          morning: boolean;
          afternoon: boolean;
          extra: boolean;
        }[];
      };
    }) => state.book.workDate
  );
  const isLoggedIn = useReduxSelector(
    (state: { login: { isLoggedIn: boolean } }) => state.login.isLoggedIn
  );
  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );

  const [name, setName] = useState("");
  const [phone, setPhone] = useState("");
  const [posData, setPosData] = useState({
    lat: lat_store_base,
    lng: lng_store_base,
  });
  const [addressName, setAddressName] = useState("");
  const [workDate, setWorkDate] = useState<
    {
      date: Date;
      morning: boolean;
      afternoon: boolean;
      extra: boolean;
    }[]
  >([...workDateBase]);
  
  const [isNameCorrect, setIsNameCorrect] = useState(false);
  const [isTextContent, setIsTextContent] = useState(false);
  const [isPhoneContent, setIsPhoneContent] = useState(false);
  const [isCalendarContent, setIsCalendarContent] = useState(false);
  const [isBooking, setIsBooking] = useState(false);

  const textRef = useRef<HTMLTextAreaElement>(null);

  const submitBookHandler = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    const nameReg = /^([가-힣a-zA-Z] ?){1,20}$/g;

    if(!nameReg.test(name)){
      setIsNameCorrect(true);
      return;
    }
    setIsNameCorrect(false);

    const content = textRef.current?.value;
    const conLatitude = posData.lat;
    const conLongitude = posData.lng;
    const conAddress = addressName;
    const workDateJson = JSON.stringify(workDate);

    const phoneReg = /^[\d]{1,4}-[\d]{4,6}-[\d]{4,6}$/g;

    if(phone.trim().length === 0 || !phoneReg.test(phone)) {
      setIsPhoneContent(true);
      return;
    }
    setIsPhoneContent(false);

    if(content?.trim().length === 0) {
      setIsTextContent(true);
      return;
    }
    setIsTextContent(false);

    let count = 0;

    for(let workData of workDate) {
      if(workData.morning || workData.afternoon || workData.extra){
        count++;
        break;
      }
    }

    // count = 0 일 경우, 달력에서 아무런 선택을 안한 경우다.
    if (count === 0) {
      setIsCalendarContent(true);
      return;
    }
    setIsCalendarContent(false);

    let bookDateObject = new Date();
    const bookDate =
      bookDateObject.toLocaleDateString() +
      " " +
      bookDateObject.toTimeString().substring(0, 8);

    const confirmPost = confirm("예약하시겠습니까?");

    if(!confirmPost) return;

    axios
      .post("/submit", {
        name,
        phone,
        content,
        conLatitude,
        conLongitude,
        conAddress,
        bookDate,
        workDate : workDateJson,
      })
      .then((response) => {
        setIsBooking(true);
        setTimeout(()=>{
          setIsBooking(false);
        },2000);
      })
      .catch((error) => console.log(error));
  };

  // redux에서 위치 값이 바뀔 때마다 자동으로 위치 좌표, 주소 세팅
  useEffect(() => {
    setPosData({ lat: lat_store_base, lng: lng_store_base });
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(lng_store_base, lat_store_base, (result, status) => {
      const address_name = result[0].address.address_name;
      setAddressName(address_name);
    });
  }, [lat_store_base, lng_store_base]);

  // redux에서 work_date 바뀔 때 마다 업데이트
  useEffect(() => {
    setWorkDate([...workDateBase]);
  }, [workDateBase]);

  // 로그인 되어 있다면 db에서 이름과 전화번호를 가져온다.
  useEffect(() => {
    if (!isLoggedIn) return;

    // [Add]
    // member 앞에 슬래쉬를 붙여도 되고 안붙여도 됨.
    axios
      .get(`member/info?email=${userEmail}`)
      .then((response) => {
        const data =response.data;

        const name = data.name;
        const phone = data.phone;
        if(name) setName(name);
        if(phone) setPhone(phone);
      })
      .catch((error) => console.log(error));
  }, [isLoggedIn]);

  const onNameEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    let name = e.target.value;

    if(name.length > 20) return;

    name = name.replace(/[^a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ ]/g,"");

    const nameReg = /^([가-힣a-zA-Z] ?){1,20}$/g;

    if(nameReg.test(name)){
      setIsNameCorrect(false);
    }

    setName(name);
  };

  const onPhoneEntered = (e: React.ChangeEvent<HTMLInputElement>) => {
    let phone = e.target.value;

    if(phone.length > 20) return;

    phone = phone.replace(/[^0-9\-]/g, "");

    setPhone(phone);
  };

  return (
    <>
    {isCalendarContent && <p className={classes.regex_right}>하루 이상 예약해주세요.</p>}
    <form className={classes.book_form} onSubmit={submitBookHandler}>
      <label className={classes.name_label} htmlFor="book_name">
        성함
      </label>
      <input
        id="book_name"
        className={classes.name_input}
        type="text"
        onChange={onNameEntered}
        value={name}
        placeholder="이름을 입력해주세요."
      />
      {isNameCorrect && <p className={classes.regex_right}>이름이 올바르지 않습니다. {"["}문자, 띄어쓰기 1회만 가능{"]"}</p>}
      <label className={classes.phone_label} htmlFor="book_phone">
        전화번호
      </label>
      <input
        id="book_phone"
        className={classes.phone_input}
        type="text"
        onChange={onPhoneEntered}
        value={phone}
        placeholder="전화번호를 입력해주세요"
      />
      {isPhoneContent && <p className={classes.regex_right}>올바른 전화번호를 입력해주세요.</p>}
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
      {isTextContent && <p className={classes.regex_right}>예약 사항을 입력해주세요</p>}
      <button className={classes.submit_button}>예약하기</button>
    </form>
    {isBooking && <UpdateAni content="예약 완료" />}
    </>
  );
};

export default BookForm;
