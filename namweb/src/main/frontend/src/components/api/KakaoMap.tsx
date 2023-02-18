import { useEffect, useState } from "react";
import { useSelector as useReduxSelector, useDispatch } from "react-redux";

import {
  Map,
  MapMarker,
  ZoomControl,
  MapTypeControl,
} from "react-kakao-maps-sdk";
import { namwebActions } from "../store";

const CENTER_POS_Y = 37.64836248151049;
const CENTER_POS_X = 127.2455233464401;

let REDUX_POS_FLAG = false;

const KakaoMap = () => {
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

  const dispatch = useDispatch();

  const lat_store = useReduxSelector(
    (state: { post_lat: number }) => state.post_lat
  );
  const lng_store = useReduxSelector(
    (state: { post_lng: number }) => state.post_lng
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
    dispatch(
      namwebActions.setPosition({
        base_lat: mouseEvent.latLng.getLat(),
        base_lng: mouseEvent.latLng.getLng(),
      })
    );
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
