import { useEffect, useState } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import {
  Map,
  MapMarker,
  ZoomControl,
  MapTypeControl,
} from "react-kakao-maps-sdk";

import { CENTER_POS_Y, CENTER_POS_X } from "../../constant/KakaoConstant";

let REDUX_POS_FLAG = false;

type KakaoMapType = {
  onPostPos: (pos: { lat: number; lng: number }) => void;
};

type PostLatType = {
  book: { post_lat: number };
};

type PostLngType = {
  book: { post_lng: number };
};

const KakaoMap = ({ onPostPos }: KakaoMapType) => {
  const [position, setPosition] = useState({
    lat: CENTER_POS_Y,
    lng: CENTER_POS_X,
  });
  const [storedPosition, setStoredPosition] = useState({
    lat: CENTER_POS_Y,
    lng: CENTER_POS_X,
  });
  const [isClicked, setIsClicked] = useState(false);
  const [isStored, setIsStored] = useState(false);

  const lat_store = useReduxSelector(
    (state: PostLatType) => state.book.post_lat
  );
  const lng_store = useReduxSelector(
    (state: PostLngType) => state.book.post_lng
  );

  useEffect(() => {
    if (!REDUX_POS_FLAG) {
      REDUX_POS_FLAG = true;
      return;
    }
    setIsClicked(true);
    setIsStored(true);
    setStoredPosition({
      lat: lat_store,
      lng: lng_store,
    });
    setPosition({
      lat: lat_store,
      lng: lng_store,
    });
  }, [lat_store, lng_store]);

  const onKakaoMapClicked = (
    _t: kakao.maps.Map,
    mouseEvent: kakao.maps.event.MouseEvent
  ) => {
    setIsClicked(true);
    setPosition({
      lat: mouseEvent.latLng.getLat(),
      lng: mouseEvent.latLng.getLng(),
    });
    onPostPos({
      lat: mouseEvent.latLng.getLat(),
      lng: mouseEvent.latLng.getLng(),
    });
  };

  return (
    <Map
      center={{ lat: storedPosition.lat, lng: storedPosition.lng }}
      style={{ width: "100%", height: "480px", borderRadius: "10px" }}
      onClick={onKakaoMapClicked}
      level={!isStored ? 9 : 5}
    >
      <ZoomControl position={kakao.maps.ControlPosition.RIGHT} />
      <MapTypeControl position={kakao.maps.ControlPosition.RIGHT} />
      <MapMarker position={{ lat: position.lat, lng: position.lng }}>
        {!isClicked && (
          <div
            style={{
              paddingLeft: "25px",
              paddingTop: "5px",
              paddingBottom: "5px",
            }}
          >
            남양주 스카이
          </div>
        )}
        {isClicked && (
          <div
            style={{
              paddingLeft: "40px",
              paddingTop: "5px",
              paddingBottom: "5px",
            }}
          >
            공사 위치
          </div>
        )}
      </MapMarker>
    </Map>
  );
};

export default KakaoMap;
