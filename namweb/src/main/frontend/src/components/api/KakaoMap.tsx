import { useState } from "react";

import {
  Map,
  MapMarker,
  ZoomControl,
  MapTypeControl,
} from "react-kakao-maps-sdk";

const CENTER_POS_Y = 37.64836248151049;
const CENTER_POS_X = 127.2455233464401;

const KakaoMap = () => {
  const [position, setPosition] = useState({
    lat: CENTER_POS_Y,
    lng: CENTER_POS_X,
  });
  const [isClicked, setIsClicked] = useState(true);

  return (
    <Map
      center={{ lat: CENTER_POS_Y, lng: CENTER_POS_X }}
      style={{ width: "100%", height: "480px", borderRadius: "10px" }}
      onClick={(_t, mouseEvent) => {
        setPosition({
          lat: mouseEvent.latLng.getLat(),
          lng: mouseEvent.latLng.getLng(),
        });
        setIsClicked(false);
      }}
      level={9}
    >
      <ZoomControl position={kakao.maps.ControlPosition.RIGHT} />
      <MapTypeControl position={kakao.maps.ControlPosition.RIGHT} />
      <MapMarker position={{ lat: position.lat, lng: position.lng }}>
        {isClicked && (
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
        {!isClicked && (
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
