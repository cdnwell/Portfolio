import { useEffect, useState } from "react";
import ReactDOM from "react-dom";

import classes from "./KakaoPost.module.scss";
import { useSelector as useReduxSelector, useDispatch } from "react-redux";

import { bookActions } from "../store/book";

import DaumPostcodeEmbed from "react-daum-postcode";
import Overlay from "../layout/Overlay";

const { kakao } = window;

const DAUM_POST_URL =
  "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";

const KakaoPost = () => {
  const [isPostClicked, setIsPostClicked] = useState(false);
  const [address, setAddress] = useState("");
  const [isWaiting, setIsWaiting] = useState(false);

  const dispatch = useDispatch();

  const lat_store_base = useReduxSelector(
    (state: { book: { base_lat: number } }) => state.book.base_lat
  );
  const lng_store_base = useReduxSelector(
    (state: { book: { base_lng: number } }) => state.book.base_lng
  );

  const completeHandler = (data: any) => {
    if (data) {
      setIsPostClicked(false);
    } else {
      return;
    }
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(data.address, (result, status) => {
      if (status === kakao.maps.services.Status.OK) {
        setIsWaiting(false);
        const lat = parseFloat(result[0].road_address.y);
        const lng = parseFloat(result[0].road_address.x);
        dispatch(bookActions.setPostPosition({ post_lat: lat, post_lng: lng }));
      } else {
        setIsWaiting(true);
      }
    });
    setAddress(data.address);
  };

  useEffect(() => {
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(lng_store_base, lat_store_base, (result, status) => {
      if (status === kakao.maps.services.Status.OK) {
        setIsWaiting(false);
        const address_name = result[0].address.address_name;
        setAddress(address_name);
      } else {
        setIsWaiting(true);
      }
    });
  }, [lat_store_base, lng_store_base]);

  return (
    <>
      <p className={classes.address_button_box}>
        <button
          type="button"
          className={classes.address_button}
          onClick={() => setIsPostClicked(true)}
        >
          주소 검색
        </button>
        <span className={classes.address_span}>
          {isWaiting ? "불러오는 중" : address}
        </span>
      </p>
      {isPostClicked &&
        ReactDOM.createPortal(
          <Overlay onClick={() => setIsPostClicked(false)} />,
          document.getElementById("backdrop-overlay") as HTMLElement
        )}
      {isPostClicked &&
        ReactDOM.createPortal(
          <DaumPostcodeEmbed
            autoClose={false}
            onComplete={completeHandler}
            className={classes.post_overlay}
            style={{ width: "80%", height: "450px", maxWidth: "1080px" }}
          />,
          document.getElementById("backdrop-item") as HTMLElement
        )}
    </>
  );
};

export default KakaoPost;
