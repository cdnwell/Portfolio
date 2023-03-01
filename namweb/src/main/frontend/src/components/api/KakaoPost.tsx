import { useState } from "react";
import ReactDOM from "react-dom";

import classes from "./KakaoPost.module.scss";

import DaumPostcodeEmbed from "react-daum-postcode";
import Overlay from "../layout/Overlay";

const { kakao } = window;

const DAUM_POST_URL =
  "//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js";

const KakaoPost: React.FC<{
  onPostPos: (pos: { lat: number; lng: number }) => void;
}> = ({ onPostPos }) => {
  const [isPostClicked, setIsPostClicked] = useState(false);

  const completeHandler = (data: any) => {
    if (data) setIsPostClicked(false);
    else return;

    const geocoder = new kakao.maps.services.Geocoder();
    geocoder.addressSearch(data.address, (result, status) => {
      if (status === kakao.maps.services.Status.OK) {
        const lat = parseFloat(result[0].road_address.y);
        const lng = parseFloat(result[0].road_address.x);
        onPostPos({ lat: lat, lng: lng });
      }
    });
  };

  return (
    <>
      <button
        type="button"
        className={classes.address_button}
        onClick={() => setIsPostClicked(true)}
      >
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
            style={{ width: "80%", height: "450px", maxWidth: "1080px" }}
          />,
          document.getElementById("backdrop-item") as HTMLElement
        )}
    </>
  );
};

export default KakaoPost;
