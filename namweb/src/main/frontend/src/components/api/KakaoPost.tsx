import { useState } from "react";
import ReactDOM from "react-dom";

import classes from "./KakaoPost.module.css";

import DaumPostcodeEmbed from "react-daum-postcode";
import Overlay from "../layout/Overlay";

const { kakao } = window;

const DAUM_POST_URL =
  "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";

const KakaoPost = () => {
  const [isPostClicked, setIsPostClicked] = useState(false);

  const completeHandler = (data: any) => {
    console.log(data);
    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(data.address, (result, status) => {
        console.log(result);
    })
    if (data) {
      setIsPostClicked(false);
    }
  };

  return (
    <>
      <button type="button" onClick={() => setIsPostClicked(true)}>
        주소 검색
      </button>
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
            style={{ width: "80%", height: "450px" }}
          />,
          document.getElementById("backdrop-item") as HTMLElement
        )}
    </>
  );
};

export default KakaoPost;
